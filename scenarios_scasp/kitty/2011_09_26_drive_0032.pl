% Basic driving simple traffic, right lane change scenario

%%% FRAME 1 - 0.png %%%
self_speed(14.8, 1).

self_lane(1, 1).

speed_limit(20, 1).

obj_meta(1, 1, truck, pos(6, 5), lane(current, 3), none).
obj_meta(1, 2, car, pos(3, 20), lane(current, 2), none).

lanes(current, [1,2], 1).

traffic_light(none, 1).

intent(stay_in_rightmost_lane, 1).

expected_action(change_lane_right, 1).

%%% FRAME 2 - 5.png %%%
self_speed(15, 2).

self_lane(1, 2).

speed_limit(20, 2).

obj_meta(2, 1, truck, pos(6, 2), lane(current, 3), none).
obj_meta(2, 2, car, pos(3, 20), lane(current, 2), none).

lanes(current, [1,2], 2).

traffic_light(none, 2).

intent(stay_in_rightmost_lane, 2).

expected_action(change_lane_right, 2).

%%% FRAME 3 - 40.png %%%

self_speed(15.8, 3).

self_lane(2, 3).

speed_limit(20, 3).

obj_meta(3, 2, car, pos(0, 25), lane(current, 2), none).

lanes(current, [1,2], 3).

traffic_light(none, 3).

intent(continue_in_lane, 3).

expected_action(accelerate, 3).
