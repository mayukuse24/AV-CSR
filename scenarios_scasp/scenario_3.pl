:-style_check(-discontiguous).

%%% FRAME 1 %%%
self_speed(8, 1).
self_lane(2, 1).

speed_limit(15, 1).

obj_meta(1, 1, roadblock, 25, 2, none).

lanes([1,2,3], 1).
traffic_light(none, 1).

intent(continue_in_lane, 1).
expected_action(accelerate, 1).

%%% FRAME 2 %%%
self_speed(10, 2).
self_lane(2, 2).

speed_limit(15, 2).

obj_meta(2, 1, roadblock, 21, 2, none).

lanes([1,2,3], 2).
traffic_light(none, 2).

intent(continue_in_lane, 2).
expected_action(accelerate, 2).

%%% FRAME 3 %%%
self_speed(13, 3).
self_lane(2, 3).

speed_limit(15, 3).

obj_meta(3, 1, roadblock, 18, 2, none).

lanes([1,2,3], 3).
traffic_light(none, 3).

intent(continue_in_lane, 3).
expected_action(change_lane_left, 3).

%%% FRAME 4 %%%
self_speed(12, 4).
self_lane(2, 4).

speed_limit(15, 4).

obj_meta(4, 1, roadblock, 15, 2, none).

lanes([1,2,3], 4).
traffic_light(none, 4).

intent(continue_in_lane, 4).
expected_action(change_lane_left, 4).

%%% FRAME 5 %%%
self_speed(12, 5).
self_lane(1, 5).

speed_limit(15, 5).

obj_meta(5, 1, roadblock, 12, 2, none).

lanes([1,2,3], 5).
traffic_light(none, 5).

intent(continue_in_lane, 5).
expected_action(accelerate, 5).

%%% FRAME 6 %%%
self_speed(14, 6).
self_lane(1, 6).

speed_limit(15, 6).

obj_meta(6, 1, roadblock, 7, 2, none).

lanes([1,2,3], 6).
traffic_light(none, 6).

intent(continue_in_lane, 6).
expected_action(accelerate, 6).

%%% FRAME 7 %%%
self_speed(15, 7).
self_lane(1, 7).

speed_limit(15, 7).

obj_meta(7, 1, roadblock, -2, 2, none).
obj_meta(7, 2, plastic_bag, 8, 1, none).

lanes([1,2,3], 7).
traffic_light(none, 7).

intent(continue_in_lane, 7).
expected_action(cruise, 7).

%%% FRAME 8 %%%
self_speed(17, 8).
self_lane(1, 8).

speed_limit(15, 8).

obj_meta(8, 1, roadblock, -7, 2, none).
obj_meta(8, 2, plastic_bag, 5, 1, none).

lanes([1,2,3], 8).
traffic_light(none, 8).

intent(continue_in_lane, 8).
expected_action(cruise, 8).

%%% FRAME 9 %%%
self_speed(16, 9).
self_lane(1, 9).

speed_limit(15, 9).

obj_meta(9, 2, plastic_bag, 2, 1, none).

lanes([1,2,3], 9).
traffic_light(none, 9).

intent(continue_in_lane, 9).
expected_action(cruise, 9).

%%% FRAME 10 %%%
self_speed(14, 10).
self_lane(1, 10).

speed_limit(15, 10).

obj_meta(10, 1, pedestrian, 12, 1, none).
obj_meta(10, 2, plastic_bag, -3, 1, none).

lanes([1,2,3], 10).
traffic_light(none, 10).

intent(continue_in_lane, 10).
expected_action(accelerate, 10).

%%% FRAME 11 %%%
self_speed(15, 11).
self_lane(1, 11).

speed_limit(15, 11).

obj_meta(11, 1, pedestrian, 8, 1, none).
obj_meta(11, 2, plastic_bag, -12, 1, none).

lanes([1,2,3], 11).
traffic_light(none, 11).

intent(continue_in_lane, 11).
expected_action(brake, 11).

%%% FRAME 12 %%%
self_speed(9, 12).
self_lane(1, 12).

speed_limit(15, 12).

obj_meta(12, 1, pedestrian, 4, 1, none).

lanes([1,2,3], 12).
traffic_light(none, 12).

intent(continue_in_lane, 12).
expected_action(brake, 12).

%%% FRAME 13 %%%
self_speed(4, 13).
self_lane(1, 13).

speed_limit(15, 13).

obj_meta(13, 1, pedestrian, 2, 1, none).

lanes([1,2,3], 13).
traffic_light(none, 13).

intent(continue_in_lane, 13).
expected_action(brake, 13).