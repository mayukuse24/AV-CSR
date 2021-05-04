import random
import copy
import math

MV_OBJ_TYPES_DIST = {'car': 0.7, 'truck': 0.05, 'bus': 0.05, 'bicycle': 0.01}
NONMV_OBJ_TYPES_DIST = {'plastic_bag': 0.1, 'roadblock': 0.1}
OBJ_TYPES_DIST = {**MV_OBJ_TYPES_DIST, **NONMV_OBJ_TYPES_DIST}

TRAFFIC_LIGHT_DIST = {'none': 0.6, 'red': 0.2, 'yellow': 0.1, 'green': 0.1}

INDICATOR_DIST = {'none': 0.8, 'left': 0.1, 'right': 0.1}

ACTIONS = ['change_lane_left', 'change_lane_right', 'accelerate', 'brake', 'cruise']
INTENTS_DIST = {'continue_in_lane': 0.8, 'stay_in_leftmost_lane': 0.1, 'stay_in_rightmost_lane': 0.1}

FPS = 10 # frames per second
DEFAULT_DECELERATION = 10 # 10 m/s^2 set as default decelaration on braking for any vehicle
MINIMUM_DISTANCING = 3 # maintain a minimum of 3 metre distance with any object
FRAME_RANGE = 60 # visible range (front and behind) for the av in metres

class LaneObject():
    def __init__(self, obj_id, lanes, speed_limit, depth=None, obj_type=None):
        self.obj_id = obj_id
        self.obj_type = obj_type or random.choices(list(OBJ_TYPES_DIST.keys()), list(OBJ_TYPES_DIST.values()))[0]
        self.depth = depth or random.randrange(-FRAME_RANGE, FRAME_RANGE)
        self.lane_id = random.choice(lanes)
        self.intent = random.choices(list(INTENTS_DIST.keys()), list(INTENTS_DIST.values()))[0]
        self.expected_action = 'cruise'

        if self.obj_type in list(MV_OBJ_TYPES_DIST.keys()):
            self.indicator = random.choices(list(INDICATOR_DIST.keys()), list(INDICATOR_DIST.values()))[0]
            self.speed = random.randrange(speed_limit - 5, speed_limit + 5)
        else:
            self.indicator = 'none'
            self.speed = 0

    # See calculation for stopping distance https://nacto.org/docs/usdg/vehicle_stopping_distance_and_time_upenn.pdf
    def getStoppingDistance(self):
        stopping_time = (self.speed / DEFAULT_DECELERATION)

        return math.ceil(0.5*self.speed*stopping_time)

    def executeAction(self, action, frame_speed):
        if action == "brake":
            self.speed -= math.ceil(10 / FPS)

        if action == "accelerate":
            self.speed += math.ceil(5 / FPS)

        if action == "change_lane_left":
            self.lane_id -= 1

        if action == "change_lane_right":
            self.lane_id += 1

        self.depth += math.ceil((self.speed - frame_speed) / FPS)

class Frame():
    def __init__(self, frame_id):
        self.id = frame_id
        self.speed_limit = random.randrange(8, 33)
        self.mv_lane_objs = []
        self.nonmv_lane_objs = []

        total_lanes = random.randrange(1, 5)
        self.lanes = list(range(1, total_lanes + 1))
        
        self.av = LaneObject(0, self.lanes, self.speed_limit, depth=0, obj_type='car')

    def getAllLaneObjects(self):
        return self.mv_lane_objs + self.nonmv_lane_objs

    def addTrafficLight(self):
        self.traffic_light = random.choices(list(TRAFFIC_LIGHT_DIST.keys()), list(TRAFFIC_LIGHT_DIST.values()))[0]

    def addObject(self, obj_id):
        lane_obj_succ = False
        for itr in range(1, 20): # Try n times
            lane_obj = LaneObject(obj_id, self.lanes, self.speed_limit)

            if not self.checkCollision(lane_obj, self.getAllLaneObjects() + [self.av], front_threshold=0.5, rear_threshold=0.5):
                lane_obj_succ = True
                break

        if not lane_obj_succ:
            print("WARNING: generating lane object failed, no safe spot found")

            return
        
        if lane_obj.obj_type in list(MV_OBJ_TYPES_DIST.keys()):
            self.mv_lane_objs.append(lane_obj)
        else:
            self.nonmv_lane_objs.append(lane_obj)

    def addIntent(self):
        self.av.intent = random.choice(list(INTENTS_DIST.keys()))

    def checkCollision(self, lane_obj_1, lane_objs, front_threshold=1.0, rear_threshold=1.0):
        stopping_dist_obj_1 = lane_obj_1.getStoppingDistance()

        # TODO: sort objects to check collision with nearest objects in lane first

        for lane_obj_2 in lane_objs:
            # NOTE: speed of lane_obj_2 is not known by av in original frame. Assuming
            # speed is known here
            stopping_dist_obj_2 = lane_obj_2.getStoppingDistance()
            
            if lane_obj_2.obj_id != lane_obj_1.obj_id and lane_obj_2.lane_id == lane_obj_1.lane_id:
                depth_diff = lane_obj_2.depth - lane_obj_1.depth

                # Object_2 is ahead and within collision range
                if 0 <= depth_diff <= (stopping_dist_obj_1 * front_threshold) + MINIMUM_DISTANCING:
                    return True

                # Object_2 is behind and within collision range
                if -((stopping_dist_obj_2 * rear_threshold) + MINIMUM_DISTANCING) <= depth_diff <= 0: 
                    return True

        return False

    def checkDynamicCollision(self, lane_obj_1, lane_objs):
        return

    def selectAction(self, lane_obj_1, actions):
        if self.checkCollision(lane_obj_1, self.mv_lane_objs + [self.av], front_threshold=0.75, rear_threshold=0):
            return 'brake'

        if self.checkCollision(lane_obj_1, self.nonmv_lane_objs, front_threshold=0.75, rear_threshold=0):
            if 'change_lane_left' in actions:
                return 'change_lane_left'

            if 'change_lane_right' in actions:
                return 'change_lane_right'

        if 'change_lane_left' in actions and lane_obj_1.intent == 'stay_in_leftmost_lane':
            return 'change_lane_left'

        if 'change_lane_right' in actions and lane_obj_1.intent == 'stay_in_rightmost_lane':
            return 'change_lane_right' 

        if 'accelerate' in actions:
            return 'accelerate'

        return 'cruise'

    def getValidActions(self, lane_obj_1):
        # TODO: Think of better way to perform checks without i) creating copy of object
        # ii) modifying the object itself
        lane_obj_1_copy = copy.deepcopy(lane_obj_1)
        actions = list(ACTIONS)

        all_lane_objects = self.getAllLaneObjects()

        leftmost_lane_id = self.lanes[0]
        rightmost_lane_id = self.lanes[-1]
        
        # Cannot accelerate
        if lane_obj_1_copy.speed >= self.speed_limit:
            actions.remove('accelerate')
        elif self.checkCollision(lane_obj_1_copy, all_lane_objects + [self.av], front_threshold=1.0, rear_threshold=0):
            actions.remove('accelerate')

        # Move object to left lane to perform checks. 
        lane_obj_1_copy.lane_id -= 1

        # Cannot change to left lane
        if lane_obj_1_copy.lane_id < leftmost_lane_id:
            actions.remove('change_lane_left')
        elif self.checkCollision(lane_obj_1_copy, all_lane_objects + [self.av], front_threshold=0.5, rear_threshold=0.5):
            actions.remove('change_lane_left')

        # Move object from left lane to right lane to perform checks
        lane_obj_1_copy.lane_id += 2

        # Cannot change to right lane
        if lane_obj_1_copy.lane_id > rightmost_lane_id:
            actions.remove('change_lane_right')
        elif self.checkCollision(lane_obj_1_copy, all_lane_objects + [self.av], front_threshold=0.5, rear_threshold=0.5):
            actions.remove('change_lane_right')

        return actions

    def next(self):
        self.id += 1

        for lane_obj in self.getAllLaneObjects():
            relative_speed = lane_obj.speed - self.av.speed

            # If non-motor vehicle, update relative position only
            if lane_obj.obj_type in list(NONMV_OBJ_TYPES_DIST.keys()):
                lane_obj.depth += (relative_speed // FPS)

                continue

            actions = self.getValidActions(lane_obj)
                
            action = self.selectAction(lane_obj, actions)

            lane_obj.executeAction(action, self.av.speed)

            lane_obj.expected_action = action
            

        # With probability add traffic sign?

        # With probability all lane objects should act on traffic sign?

        # Move self car based on intent?
        actions = self.getValidActions(self.av)

        print("%valid actions: {}".format(actions))

        action = self.selectAction(self.av, actions)

        self.av.executeAction(action, self.av.speed)

        # Generate expected action based on same logic as used for driving other vehicles + intent
        self.av.expected_action = action
        

def printFrame(frame):
    print("%%% FRAME {} %%%\n".format(frame.id))

    print("% av stopping distance: {}".format(frame.av.getStoppingDistance()))
    print("% av depth: {}".format(frame.av.depth))

    print("self_speed({}, {}).".format(frame.av.speed, frame.id))

    print("self_lane({}, {}).".format(frame.av.lane_id, frame.id))

    print("speed_limit({}, {}).\n".format(frame.speed_limit, frame.id))

    print("lanes({}, {}).\n".format(frame.lanes, frame.id))

    for lane_obj in frame.getAllLaneObjects():
        print("obj_meta({}, {}, {}, {}, {}, {}).".format(
            lane_obj.obj_id,
            lane_obj.obj_type,
            lane_obj.depth,
            lane_obj.lane_id,
            lane_obj.indicator,
            frame.id
        ))

    print("\ntraffic_light({}, {}).\n".format(frame.traffic_light, frame.id))

    print("intent({}, {}).\n".format(frame.av.intent, frame.id))

    print("expected_action({}, {}).\n".format(frame.av.expected_action, frame.id))
    

def generateFrame(frame_id):
    F = Frame(frame_id)

    # Must add lanes first since other predicates are dependent on it
    F.addTrafficLight()

    object_count = random.randrange(1, 6)
    for obj_id in range(1, object_count):
        F.addObject(obj_id)

    # AV chooses among intent with equal probability
    F.addIntent()

    return F

if __name__ == '__main__':
    frame = generateFrame(0)

    for frame_id in range(1, 20):
        #frame = generate_frame(frame_id)

        frame.next()
    
        printFrame(frame)