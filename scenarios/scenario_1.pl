%:- abolish(self_speed/2).
%:- dynamic self_speed/2.
%:- dynamic self_lane/2.

%%% FRAME 1 %%%
% self_speed(speed, timestamp).
self_speed(5, 1).

% self_lane(lane id, timestamp).
self_lane(1, 1).

% speed_limit(speed (metres/s), timestamp)
speed_limit(10, 1).

% obj_meta(object id, depth (metres), lane id, indicator, timestamp)
obj_meta(1, 22, 1, none, 1).
obj_meta(2, 45, 1, none, 1).

% lane([lane ids]], timestamp) - leftmost lane id = 1
lanes([1,2,3], 1).

% traffic_sign(sign, timestamp)
%traffic_signs(stop, 1).

traffic_light(none, 1).

% intent(<intent>, timestamp) - used for guiding car based on the route to destination
intent(continue_on_lane, 1).

% expected_action(<action>, timestamp) - used for testing suggested action
expected_action(accelerate, 1).

%%% FRAME 2 %%%
self_speed(8, 2).
self_lane(1, 2).

speed_limit(10, 2).

obj_meta(1, 20, 1, none, 2).
obj_meta(2, 41, 1, none, 2).

lanes([1,2,3], 2).
traffic_signal(none, 2).

intent(continue_on_lane, 2).
expected_action(accelerate, 2).

%%% FRAME 3 %%%
self_speed(11, 3).
self_lane(1, 3).

speed_limit(10, 3).

obj_meta(1, 15, 1, none, 3).
obj_meta(2, 37, 1, none, 3).

lanes([1,2,3], 3).
traffic_light(none, 3).

intent(continue_on_lane, 3).
expected_action(none, 3).

%%% FRAME 4 %%%
self_speed(9, 4).
self_lane(1, 4).

speed_limit(10, 4).

obj_meta(1, 9, 1, none, 4).
obj_meta(2, 41, 1, none, 4).

lanes([1,2,3], 4).
traffic_light(none, 4).

intent(continue_on_lane, 4).
expected_action(brake, 4).

%%% FRAME 5 %%%
self_speed(6, 5).
self_lane(1, 5).

speed_limit(10, 5).

obj_meta(1, 7, 1, none, 5).
obj_meta(2, 40, 1, none, 5).

lanes([1,2,3], 5).
traffic_light(none, 5).

intent(continue_on_lane, 5).
expected_action(brake, 5).

%%% FRAME 6 %%%

self_speed(4, 6).
self_lane(1, 6).

speed_limit(10, 6).

obj_meta(1, 12, 1, none, 6).
obj_meta(2, 48, 1, none, 6).

lanes([1,2,3], 6).
traffic_light(red, 6).

intent(continue_on_lane, 6).
expected_action(none, 6).

%%% FRAME 7 %%%

self_speed(2, 7).
self_lane(1, 7).

speed_limit(10, 7).

obj_meta(1, 12, 1, none, 7).
obj_meta(2, 68, 1, none, 7).

lanes([1,2,3], 7).
traffic_light(red, 7).

intent(continue_on_lane, 7).
expected_action(none, 7).

%%% FRAME 8 %%%

self_speed(0, 8).
self_lane(1, 8).

speed_limit(10, 8).

obj_meta(1, 7, 1, none, 8).

lanes([1,2,3], 8).
traffic_light(red, 8).

intent(continue_on_lane, 8).
expected_action(brake, 8).

%%% FRAME 9 %%%

self_speed(0, 9).
self_lane(1, 9).

speed_limit(10, 9).

obj_meta(1, 8, 1, none, 9).

lanes([1,2,3], 9).
traffic_light(green, 9).

intent(continue_on_lane, 9).
expected_action(brake, 9).

%%% FRAME 10 %%%

self_speed(0, 10).
self_lane(1, 10).

speed_limit(10, 10).

obj_meta(1, 12, 1, none, 10).

lanes([1,2,3], 10).
traffic_light(green, 10).

intent(continue_on_lane, 10).
expected_action(accelerate, 10).

%%% FRAME 11 %%%

self_speed(2, 11).
self_lane(1, 11).

speed_limit(10, 11).

obj_meta(1, 18, 1, none, 11).

lanes([1,2,3], 11).
traffic_light(green, 11).

intent(continue_on_lane, 11).
expected_action(accelerate, 11).

%%% FRAME 12 %%%

self_speed(5, 12).
self_lane(1, 12).

speed_limit(10, 12).

obj_meta(1, 21, 1, none, 12).

lanes([1,2,3], 12).
traffic_light(none, 12).

intent(continue_on_lane, 12).
expected_action(accelerate, 12).