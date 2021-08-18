%%% FRAME <i> %%%

% self_speed(speed, timestamp) - defines the current speed of AV
self_speed(5, i).

% self_lane(lane id, timestamp) - defines the current lane of AV
self_lane(1, i).

% speed_limit(speed (metres/s), timestamp)
speed_limit(10, i).

% obj_meta(timestamp, object id, object type, position from ego vehicle (metres), lane, indicator)
obj_meta(i, 1, car, pos(5, 20), lane(current, 2), none). % Car with object id 1, 20 metres ahead and 5 metres to right of ego vehicle, on lane 2 of current lanes
obj_meta(i, 2, bicycle, pos(0, 10), lane(current, 1), none).
obj_meta(i, 3, truck, pos(X, Y), lane(oncoming, 1), none).

% lane(type, [lane ids]], timestamp) - leftmost lane id = 1
lanes(current, [1,2,3], i). % Lanes with traffic in the same direction as ego
lanes(oncoming, [1], i). % Lanes with traffic in opposite direction of ego
lanes(cross_right, [1,2,3], i). % Lanes with traffic perpendicular to ego lane, moving towards right
lanes(cross_left, [1,2,3], i). % Lanes with traffic perpendicular to ego lane, moving towards left 

% at_intersection(object id, i) - true if object with id is at start (waiting to enter) intersection. 0 represents ego vehicle
at_intersection(0, i).

% in_intersection(object id, i) - true if object with id has entered intersection. 0 represents ego vehicle
in_intersection(5, i).

% intersection(type, meta, timestamp) - meta represents additional info required to navigate intersection
intersection(signaled, none, i).
intersection(unsignaled, 2, i). % meta - rank of ego vehicle (1 implies first). Used to determine fcfs order in unsignaled
intersection(t_intersect, minor, i). % meta - ego vehicle in major or minor road of intersection. minor yields to major

% traffic_sign(sign, timestamp)
traffic_sign(stop, i).

% traffic_light(<light>, timestamp) light - red, yellow, green, none
traffic_light(none, i).

% intent(<intent>, timestamp) - short term goal used for guiding car based on the route to destination
intent(continue_in_lane, i).

% expected_action(<action>, timestamp) - used for testing action suggested by the AV-CSR
expected_action(accelerate, i).