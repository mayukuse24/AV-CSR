
%%% FRAME 1 - 100.png %%%
self_speed(29, 1).

self_lane(1, 1).

speed_limit(32, 1).

obj_meta(1, 1, car, 6, 3, none).
obj_meta(1, 2, car, 18, 2, none).

lanes([1,2,3], 1).

traffic_light(none, 1).

intent(continue_in_lane, 1).

expected_action(accelerate, 1).

%%% FRAME 2 - 120.png %%%
self_speed(28.6, 2).

self_lane(1, 2).

speed_limit(32, 2).

obj_meta(2, 1, car, 6, 3, none).
obj_meta(2, 2, car, 18, 2, none).

lanes([1,2,3], 2).

traffic_light(none, 2).

intent(continue_in_lane, 2).

expected_action(accelerate, 2).

%%% FRAME 3 - 140.png %%%
self_speed(28.6, 3).

self_lane(1, 3).

speed_limit(32, 3).

obj_meta(3, 1, car, 5, 3, none).
obj_meta(3, 2, car, 17, 2, none).

lanes([1,2,3], 3).

traffic_light(none, 3).

% NOTE: there is a traffic sign at this point that informs
% of a merge right and only 2 lanes ahead

intent(continue_in_lane, 3).

expected_action(accelerate, 3).

%%% FRAME 4 - 270.png %%%
self_speed(28.6, 4).

self_lane(1, 4).

speed_limit(32, 4).

obj_meta(4, 1, car, 5, 3, none).
obj_meta(4, 2, car, 17, 2, none).

lanes([1,2,3], 4).

traffic_light(none, 4).

intent(continue_in_lane, 4).

expected_action(accelerate, 4).

%%% FRAME 5 - 320.png %%%
self_speed(29, 5).

self_lane(1, 5).

speed_limit(32, 5).

obj_meta(5, 1, car, 5, 3, none).
obj_meta(5, 2, car, 17, 2, none).

lanes([1,2,3], 5).

traffic_light(none, 5).

intent(continue_in_lane, 5).

expected_action(accelerate, 5).

%%% FRAME 6 - 340.png %%%
self_speed(29, 6).

self_lane(1, 6).

speed_limit(32, 6).

obj_meta(6, 1, car, 5, 3, none).
obj_meta(6, 2, car, 13, 2, none).

lanes([1,2,3], 6).

traffic_light(none, 6).

intent(continue_in_lane, 6).

expected_action(accelerate, 6).

%%% FRAME 7 - 360.png %%%
self_speed(29, 7).

self_lane(1, 7).

speed_limit(32, 7).

obj_meta(7, 1, car, pos(7, 4), lane(current, 3), none).
obj_meta(7, 2, car, pos(4, 12), lane(current, 2), none).

lanes(current, [1,2,3], 7).

% NOTE: need an entry here that provides radar info
% to detect objects/barrier beside/near the vehicle
sensor(left, 0.3, 7).

traffic_light(none, 7).

intent(continue_in_lane, 7).

expected_action(change_lane_right, 7).

%%% FRAME 8 - 380.png %%%
self_speed(29.9, 8).

self_lane(1, 8).

speed_limit(32, 8).

obj_meta(8, 1, car, pos(7, 6), lane(current, 3), none).
obj_meta(8, 2, car, pos(4, 13), lane(current, 2), none).

lanes(current, [1,2,3], 8).

sensor(left, 0.4, 8).

traffic_light(none, 8).

intent(continue_in_lane, 8).

expected_action(change_lane_right, 8).

%%% FRAME 9 - 400.png %%%
self_speed(29.9, 9).

self_lane(1, 9).

speed_limit(32, 9).

obj_meta(9, 1, car, 6, 2, none).
obj_meta(9, 2, car, 13, 1, none).

lanes([1,2], 9).

traffic_light(none, 9).

intent(continue_in_lane, 9).

expected_action(accelerate, 9).

%%% FRAME 10 - 450.png %%%
self_speed(29, 10).

self_lane(1, 10).

speed_limit(32, 10).

obj_meta(10, 1, car, 6, 2, none).
obj_meta(10, 2, car, 13, 1, none).

lanes([1,2], 10).

traffic_light(none, 10).

intent(continue_in_lane, 10).

expected_action(accelerate, 10).

%%% FRAME 11 - 500.png %%%
self_speed(29, 11).

self_lane(1, 11).

speed_limit(32, 11).

obj_meta(11, 1, car, 8, 2, none).
obj_meta(11, 2, car, 13, 1, none).

lanes([1,2], 11).

traffic_light(none, 11).

intent(continue_in_lane, 11).

expected_action(accelerate, 11).