
%%% FRAME 1 %%%
% self_speed(speed, timestamp).
self_speed(10, 1).

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

self_speed(10, 2).
self_lane(1, 2).
speed_limit(10, 2).

depth(1, 20, 2).
depth(2, 41, 2).

lane(1, [1, 2], 2).
lane(2, [], 2).
lane(3, [], 2).

traffic_signal(none, 2).