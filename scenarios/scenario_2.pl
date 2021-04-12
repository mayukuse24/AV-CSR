:-style_check(-discontiguous).

%%% FRAME 1 %%%
self_speed(8, 1).
self_lane(1, 1).

speed_limit(15, 1).

obj_meta(1, car, 20, 1, none, 1).
obj_meta(2, car, 5, 2, none, 1).

lanes([1,2,3], 1).
traffic_light(none, 1).

intent(continue_on_lane, 1).
expected_action(accelerate, 1).

%%% FRAME 2 %%%
self_speed(10, 2).
self_lane(1, 2).

speed_limit(15, 2).

obj_meta(1, car, 15, 1, none, 2).
obj_meta(2, car, 5, 2, none, 2).

lanes([1,2,3], 2).
traffic_light(none, 2).

intent(stay_in_rightmost_lane, 2).
expected_action(accelerate, 2).

%%% FRAME 3 %%%
self_speed(12, 3).
self_lane(1, 3).

speed_limit(15, 3).

obj_meta(1, car, 18, 1, none, 3).
obj_meta(2, car, 9, 2, none, 3).

lanes([1,2,3], 3).
traffic_light(none, 3).

intent(stay_in_rightmost_lane, 3).
expected_action(accelerate, 3).

%%% FRAME 4 %%%
self_speed(14, 4).
self_lane(1, 4).

speed_limit(15, 4).

obj_meta(1, car, 15, 1, none, 4).
obj_meta(2, car, 11, 2, none, 4).

lanes([1,2,3], 4).
traffic_light(none, 4).

intent(stay_in_rightmost_lane, 4).
expected_action(change_lane_right, 4).

%%% FRAME 5 %%%
self_speed(13, 5).
self_lane(1, 5).

speed_limit(15, 5).

obj_meta(1, car, 11, 1, none, 5).
obj_meta(2, car, 13, 2, none, 5).

lanes([1,2,3], 5).
traffic_light(none, 5).

intent(stay_in_rightmost_lane, 5).
expected_action(change_lane_right, 5).

%%% FRAME 6 %%%
self_speed(13, 6).
self_lane(2, 6).

speed_limit(15, 6).

obj_meta(1, car, 9, 1, none, 6).
obj_meta(2, car, 9, 2, none, 6).

lanes([1,2,3], 6).
traffic_light(none, 6).

intent(stay_in_rightmost_lane, 6).
expected_action(break, 6).

%%% FRAME 7 %%%
self_speed(10, 7).
self_lane(2, 7).

speed_limit(15, 7).

obj_meta(1, car, 11, 1, none, 7).
obj_meta(2, car, 13, 2, none, 7).

lanes([1,2,3], 7).
traffic_light(none, 7).

intent(stay_in_rightmost_lane, 7).
expected_action(change_lane_right, 7).

%%% FRAME 8 %%%
self_speed(9, 8).
self_lane(2, 8).

speed_limit(15, 8).

obj_meta(1, car, 7, 1, none, 8).
obj_meta(2, car, 12, 2, none, 8).

lanes([1,2,3], 8).
traffic_light(none, 8).

intent(stay_in_rightmost_lane, 8).
expected_action(change_lane_right, 8).

%%% FRAME 9 %%%
self_speed(9, 9).
self_lane(3, 9).

speed_limit(15, 9).

obj_meta(1, car, 11, 1, none, 9).
obj_meta(2, car, 8, 2, none, 9).

lanes([1,2,3], 9).
traffic_light(none, 9).

intent(stay_in_rightmost_lane, 9).
expected_action(accelerate, 9).

%%% FRAME 10 %%%
self_speed(13, 10).
self_lane(3, 10).

speed_limit(15, 10).

obj_meta(1, car, 8, 1, none, 10).
obj_meta(2, car, 4, 2, none, 10).

lanes([1,2,3], 10).
traffic_light(none, 10).

intent(stay_in_rightmost_lane, 10).
expected_action(accelerate, 10).

%%% FRAME 11 %%%
self_speed(15, 11).
self_lane(3, 11).

speed_limit(15, 11).

obj_meta(1, car, 6, 1, none, 11).
obj_meta(2, car, 1, 2, none, 11).

lanes([1,2,3], 11).
traffic_light(none, 11).

intent(stay_in_rightmost_lane, 11).
expected_action(accelerate, 11).

%%% FRAME 12 %%%
self_speed(17, 12).
self_lane(3, 12).

speed_limit(15, 12).

obj_meta(1, car, 3, 1, none, 12).

lanes([1,2,3], 12).
traffic_light(none, 12).

intent(stay_in_rightmost_lane, 12).
expected_action(cruise, 12).

%%% FRAME 13 %%%
self_speed(16, 13).
self_lane(3, 13).

speed_limit(15, 13).

obj_meta(1, car, 1, 1, none, 13).

lanes([1,2,3], 13).
traffic_light(none, 13).

intent(stay_in_rightmost_lane, 13).
expected_action(cruise, 13).