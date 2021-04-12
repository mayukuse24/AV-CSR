import random

MV_OBJ_TYPES_DIST = {'car': 0.7, 'truck': 0.05, 'bus': 0.05, 'bicycle': 0.01}
NONMV_OBJ_TYPES_DIST = {'plastic_bag': 0.1, 'roadblock': 0.1}
OBJ_TYPES_DIST = {**MV_OBJ_TYPES_DIST, **NONMV_OBJ_TYPES_DIST}

TRAFFIC_LIGHT_DIST = {'none': 0.6, 'red': 0.2, 'yellow': 0.1, 'green': 0.1}

INDICATOR_DIST = {'none': 0.8, 'left': 0.1, 'right': 0.1}

INTENT = ['continue_on_lane', 'stay_in_leftmost_lane', 'stay_in_rightmost_lane']

class LaneObject():
    def __init__(self, obj_id, lanes):
        self.obj_id = obj_id
        self.obj_type = random.choices(list(OBJ_TYPES_DIST.keys()), list(OBJ_TYPES_DIST.values()))[0]
        self.depth = random.randrange(-30, 30)
        self.lane_id = random.choice(lanes)

        if self.obj_type in list(MV_OBJ_TYPES_DIST.keys()):
            self.indicator = random.choices(list(INDICATOR_DIST.keys()), list(INDICATOR_DIST.values()))[0]
        else:
            self.indicator = 'none'


class Frame():
    def __init__(self, frame_id):
        self.id = frame_id
        self.speed_limit = random.randrange(8, 33)
        self.self_speed = random.randrange(self.speed_limit - 10, self.speed_limit + 5)
        self.lane_objs = []

    def add_lanes(self):
        total_lanes = random.randrange(1, 5)
        self.lanes = list(range(1, total_lanes + 1))
        self.self_lane = random.choice(self.lanes)

    def add_traffic_light(self):
        self.traffic_light = random.choices(list(TRAFFIC_LIGHT_DIST.keys()), list(TRAFFIC_LIGHT_DIST.values()))[0]

    def add_object(self, obj_id):
        lane_obj_succ = False
        for itr in range(1, 100):
            lane_obj = LaneObject(obj_id, self.lanes)

            if not self.check_collision(lane_obj):
                lane_obj_succ = True
                break

        if not lane_obj_succ:
            print("WARNING: generating lane object failed, no safe spot found")
        
        self.lane_objs.append(lane_obj)

    def add_intent(self):
        self.intent = random.choice(INTENT)

    def check_collision(self, lane_obj_1):
        # TODO: split collision checks, consider creating self car as LaneObject
        # Check collision with other objects
        for lane_obj_2 in self.lane_objs:
            if lane_obj_2.lane_id == lane_obj_1.lane_id and \
                 abs(lane_obj_2.depth - lane_obj_1.depth) <= 2:

               return True

        # Check collision with self car
        if self.self_lane == lane_obj_1.lane_id and abs(lane_obj_1.depth) <= 2:
            return True

        return False

def print_frame(frame):
    print("%%% FRAME {} %%%\n".format(frame.id))

    print("self_speed({}, {}).".format(frame.self_speed, frame.id))

    print("self_lane({}, {}).".format(frame.self_lane, frame.id))

    print("speed_limit({}, {}).\n".format(frame.speed_limit, frame.id))

    print("lanes({}, {}).\n".format(frame.lanes, frame.id))

    for lane_obj in frame.lane_objs:
        print("obj_meta({}, {}, {}, {}, {}, {}).".format(
            lane_obj.obj_id,
            lane_obj.obj_type,
            lane_obj.depth,
            lane_obj.lane_id,
            lane_obj.indicator,
            frame.id
        ))

    print("\ntraffic_light({}, {}).\n".format(frame.traffic_light, frame.id))

    print("intent({}, {}).\n".format(frame.intent, frame.id))
    

def generate_frame(frame_id):
    F = Frame(frame_id)

    # Must add lanes first since other predicates are dependent on it
    F.add_lanes()
    F.add_traffic_light()

    object_count = random.randrange(1, 6)
    for obj_id in range(1, object_count):
        F.add_object(obj_id)

    F.add_intent()

    return F

if __name__ == '__main__':
    for frame_id in range(1, 10):
        frame = generate_frame(frame_id)
    
        print_frame(frame)