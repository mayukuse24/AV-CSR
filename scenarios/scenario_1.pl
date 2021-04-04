
:- abolish(self_speed/2).
:- dynamic self_speed/2.
:- dynamic self_lane/2.

%%% FRAME 1 %%%
% self_speed(speed, timestamp).
self_speed(5, 1).

% self_lane(lane id, timestamp).
self_lane(1, 1).

% speed_limit(speed (metres/s), timestamp)
speed_limit(10, 1).

% obj_meta(object id, depth, lane id, indicator, timestamp)
obj_meta(1, 22, 1, none, 1).
obj_meta(2, 45, 1, none, 1).

% lane([lane ids]], timestamp) - leftmost lane id = 1
lanes([1,2,3], 1).

% traffic_sign(sign, timestamp)
%traffic_signs(stop, 1).

traffic_signal(none, 1).


%%% FRAME 2 %%%
self_lane(1, 2).

speed_limit(10, 2).

obj_meta(1, 20, 1, none, 2).
obj_meta(2, 41, 1, none, 2).

lanes([1,2,3], 2).

traffic_signal(none, 2).

%%% FRAME 3 %%%
self_lane(1, 3).

speed_limit(10, 3).

obj_meta(1, 15, 1, none, 3).
obj_meta(2, 37, 1, none, 3).

lanes([1,2,3], 3).

traffic_signal(none, 3).

%%% FRAME 4 %%%
self_lane(1, 4).

speed_limit(10, 4).

obj_meta(1, 9, 1, none, 4).
obj_meta(2, 41, 1, none, 4).

lanes([1,2,3], 4).

traffic_signal(none, 4).

%%% FRAME 5 %%%
self_lane(1, 5).

speed_limit(10, 5).

obj_meta(1, 7, 1, none, 5).
obj_meta(2, 40, 1, none, 5).

lanes([1,2,3], 5).

traffic_signal(none, 5).