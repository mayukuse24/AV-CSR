% Merge left at medium/high traffic condition

%%% FRAME 1 - 160.png %%%
self_speed(15, 1).
self_lane(3, 1).

speed_limit(30, 1).

obj_meta(1, 1, car, pos(-8, -5), lane(current, 2), none).

lanes(current, [1,2,3], 1).

traffic_light(none, 1).

intent(merge_into_left_lane, 1).

expected_action(brake, 1).

%%% FRAME 2 - 230.png %%%

self_speed(8, 2).
self_lane(3, 2).

speed_limit(30, 2).

obj_meta(2, 1, car, pos(-4, 3), lane(current, 2), none).

lanes(current, [1,2,3], 2).

traffic_light(none, 2).

intent(merge_into_left_lane, 2).

expected_action(brake, 2).

%%% FRAME 3 - 410.png %%%

self_speed(21, 3).
self_lane(3, 3).

speed_limit(30, 3).

obj_meta(3, 1, car, pos(-4, 12), lane(current, 2), none).

lanes(current, [1,2,3], 3).

traffic_light(none, 3).

intent(merge_into_left_lane, 3).

expected_action(change_lane_left, 3).



%%% FRAME 3 - 410.png %%%