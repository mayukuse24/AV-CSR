%%% FRAME i %%%

% self_speed(speed, timestamp).
self_speed(5, i).

% self_lane(lane id, timestamp).
self_lane(1, i).

% speed_limit(speed (metres/s), timestamp)
speed_limit(10, i).

% obj_meta(timestamp, object id, object type, depth (metres), lane id, indicator)
obj_meta(1, car, 22, 1, none, i).
obj_meta(2, car, 45, 1, none, i).

% lane([lane ids]], timestamp) - leftmost lane id = 1
lanes([1,2,3], i).

% traffic_sign(sign, timestamp)
traffic_signs(stop, i).

% traffic_light(<light>, timestamp) light - red, yellow, green, none
traffic_light(none, i).

% intent(<intent>, timestamp) - used for guiding car based on the route to destination
intent(continue_in_lane, i).

% expected_action(<action>, timestamp) - used for testing action suggested by the AV-CSR
expected_action(accelerate, i).