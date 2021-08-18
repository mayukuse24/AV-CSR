% Basic driving simple traffic, right lane change scenario

%%% FRAME 1 - 0.png %%%
self_speed(14.8, 1).

self_lane(1, 1).

speed_limit(20, 1).

obj_meta(1, 1, truck, 5, 3, none).
obj_meta(1, 2, car, 20, 2, none).

lanes([1,2], 1).

traffic_light(none, 1).

intent(stay_in_rightmost_lane, 1).

expected_action(change_lane_right, 1).

%%% FRAME 2 - 5.png %%%
self_speed(15, 2).

self_lane(1, 2).

speed_limit(20, 2).

obj_meta(2, 1, truck, 2, 3, none).
obj_meta(2, 2, car, 20, 2, none).

lanes([1,2], 2).

traffic_light(none, 2).

intent(stay_in_rightmost_lane, 2).

expected_action(change_lane_right, 2).

%%% FRAME 3 - 40.png %%%

self_speed(15.8, 3).

self_lane(2, 3).

speed_limit(20, 3).

obj_meta(3, 2, car, 25, 2, none).

lanes([1,2], 3).

traffic_light(none, 3).

intent(continue_in_lane, 3).

expected_action(accelerate, 3).

%%% FRAME 4 - 158.png %%%

self_speed(14.6, 4).

self_lane(2, 4).

speed_limit(20, 4).

obj_meta(4, 1, car, 28, 1, none).
obj_meta(4, 2, car, 25, 2, none).

lanes([1,2], 4).

traffic_light(none, 4).

intent(continue_in_lane, 4).

expected_action(accelerate, 4).

%%% FRAME 5 - 170.png %%%

self_speed(12.3, 5).

self_lane(2, 5).

speed_limit(20, 5).

obj_meta(5, 1, car, 22, 1, none).
obj_meta(5, 2, car, 20, 2, none).

lanes([1,2], 5).

traffic_light(none, 5).

intent(continue_in_lane, 5).

expected_action(accelerate, 5).

%%% FRAME 6 - 190.png %%%

self_speed(11.7, 6).

self_lane(2, 6).

speed_limit(20, 6).

obj_meta(6, 1, car, 17, 1, none).
obj_meta(6, 2, car, 15, 2, none).

lanes([1,2,3], 6).

traffic_light(none, 6).

intent(continue_in_lane, 6).

expected_action(accelerate, 6).

%%% FRAME 7 - 210.png %%%

self_speed(11.2, 7).

self_lane(2, 7).

speed_limit(20, 7).

obj_meta(7, 1, car, 12, 1, none).
obj_meta(7, 2, car, 11, 2, none).

lanes([1,2,3], 7).

traffic_light(green, 7).

intent(continue_in_lane, 7).

expected_action(accelerate, 7).

%%% FRAME 8 - 225.png %%%

self_speed(10.7, 8).

self_lane(2, 8).

speed_limit(20, 8).

obj_meta(8, 1, car, 10, 1, none).
obj_meta(8, 2, car, 7, 2, none).

lanes([1,2,3], 8).

traffic_light(green, 8).

intent(continue_in_lane, 8).

expected_action(accelerate, 8).

%%% FRAME 9 - 240.png %%%

self_speed(10.5, 9).

self_lane(2, 9).

speed_limit(20, 9).

obj_meta(9, 1, car, 12, 1, none).
obj_meta(9, 2, car, 7, 2, none).

lanes([1,2,3], 9).

traffic_light(green, 9).

intent(continue_in_lane, 9).

expected_action(accelerate, 9).

%%% FRAME 10 - 260.png %%%

self_speed(11.4, 10).

self_lane(2, 10).

speed_limit(20, 10).

obj_meta(10, 1, car, 12, 1, none).
obj_meta(10, 2, car, 9, 2, none).

lanes([1,2], 10).

traffic_light(none, 10).

intent(continue_in_lane, 10).

expected_action(accelerate, 10).

%%% FRAME 11 - 290.png %%%

self_speed(13, 11).

self_lane(2, 11).

speed_limit(20, 11).

obj_meta(11, 1, car, 15, 1, none).
obj_meta(11, 2, car, 13, 2, none).

lanes([1,2], 11).

traffic_light(none, 11).

intent(continue_in_lane, 11).

expected_action(accelerate, 11).

%%% FRAME 12 - 320.png %%%

self_speed(14.3, 12).

self_lane(2, 12).

speed_limit(20, 12).

obj_meta(12, 1, car, 15, 1, none).
obj_meta(12, 2, car, 13, 2, none).
obj_meta(12, 3, car, 1, 1, none).

lanes([1,2], 12).

traffic_light(none, 12).

intent(continue_in_lane, 12).

expected_action(accelerate, 12).

%%% FRAME 13 - 330.png %%%

self_speed(14.7, 13).

self_lane(3, 13).

speed_limit(20, 13).

obj_meta(13, 1, car, 12, 1, none).
obj_meta(13, 2, car, 13, 3, none).
obj_meta(13, 3, car, 4, 2, none).

lanes([1,2,3], 13).

traffic_light(none, 13).

intent(continue_in_lane, 13).

expected_action(accelerate, 13).

%%% FRAME 14 - 350.png %%%

self_speed(15.2, 14).

self_lane(3, 14).

speed_limit(20, 14).

obj_meta(14, 1, car, 9, 1, none).
obj_meta(14, 2, car, 16, 2, none).
obj_meta(14, 3, car, 6, 2, none).
obj_meta(14, 4, truck, 19, 3, none).

lanes([1,2,3], 14).

traffic_light(none, 14).

intent(continue_in_lane, 14).

expected_action(accelerate, 14).

%%% FRAME 15 - 370.png %%%

self_speed(15.8, 15).

self_lane(3, 15).

speed_limit(20, 15).

obj_meta(15, 1, car, 7, 1, none).
obj_meta(15, 2, car, 17, 2, none).
obj_meta(15, 3, car, 7, 2, none).
obj_meta(15, 4, truck, 19, 3, none).

lanes([1,2,3], 15).

traffic_light(none, 15).

intent(continue_in_lane, 15).

expected_action(accelerate, 15).

%%% FRAME 16 - 380.png %%%

self_speed(15.6, 16).

self_lane(3, 16).

speed_limit(20, 16).

obj_meta(16, 1, car, 4, 1, none).
obj_meta(16, 2, car, 17, 2, none).
obj_meta(16, 3, car, 6, 2, none).
obj_meta(16, 4, truck, 19, 3, none).
obj_meta(16, 5, car, 20, 1, none).

lanes([1,2,3], 16).

traffic_light(none, 16).

intent(continue_in_lane, 16).

expected_action(accelerate, 16).

%%% FRAME 17 - 389.png %%%

self_speed(15.5, 17).

self_lane(3, 17).

speed_limit(20, 17).

obj_meta(17, 1, car, 2, 1, none).
obj_meta(17, 2, car, 17, 2, none).
obj_meta(17, 3, car, 8, 2, none).
obj_meta(17, 4, truck, 20, 3, none).

lanes([1,2,3], 17).

traffic_light(none, 17).

intent(continue_in_lane, 17).

expected_action(accelerate, 17).
