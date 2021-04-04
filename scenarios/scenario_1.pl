
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

% depth(Object Id, distance (in metres), timestamp)
depth(1, 22, 1).
depth(2, 45, 1).

% lane(lane id, [list of object ids], timestamp) - leftmost lane id = 1
lane(1, [1, 2], 1).
lane(2, [], 1).
lane(3, [], 1).

% traffic_sign(sign, timestamp)
%traffic_signs(stop, 1).

traffic_signal(none, 1).


%%% FRAME 2 %%%
self_lane(1, 2).

speed_limit(10, 2).

depth(1, 20, 2).
depth(2, 41, 2).

lane(1, [1, 2], 2).
lane(2, [], 2).
lane(3, [], 2).

traffic_signal(none, 2).

%%% FRAME 3 %%%
self_lane(1, 3).

speed_limit(10, 3).

depth(1, 15, 3).
depth(2, 37, 3).

lane(1, [1, 2], 3).
lane(2, [], 3).
lane(3, [], 3).

traffic_signal(none, 3).

%%% FRAME 4 %%%
self_lane(1, 4).

speed_limit(10, 4).

depth(1, 9, 4).
depth(2, 41, 4).

lane(1, [1, 2], 4).
lane(2, [], 4).
lane(3, [], 4).

traffic_signal(none, 4).

%%% FRAME 5 %%%
self_lane(1, 5).

speed_limit(10, 5).

depth(1, 7, 5).
depth(2, 40, 5).

lane(1, [1, 2], 5).
lane(2, [], 5).
lane(3, [], 5).

traffic_signal(none, 5).