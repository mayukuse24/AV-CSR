% Road - Left turn at singalized intersection, turn after truck leaves
% and green signal.

%%% FRAME 1 - 70.png %%%
self_speed(12, 1).
self_lane(2, 1).

speed_limit(20, 1).

lanes(current, [1, 2, 3], 1).

traffic_light(none, 1).

intent(stay_in_leftmost_lane, 1).

expected_action(change_lane_left, 1).

%%% FRAME 2 - 200.png %%%
self_speed(0, 2).
self_lane(1, 2).

speed_limit(10, 2).

obj_meta(2, 1, truck, pos(-8, 10), lane(cross_right, 1), none).

lanes(current, [1, 2, 3], 1).
lanes(cross_right, [1], 1).

intersection(t_intersect, major, at, 2).

self_pred_path(sp1, 2).
obj_pred_path(1, op1, 2).
path_intersects(sp1, op1).

traffic_light(red, 2).

intent(enter_left_lane, 2).

expected_action(brake, 2).

%%% FRAME 3 - 300.png %%%
self_speed(3, 3).
self_lane(1, 3).

speed_limit(10, 3).

obj_meta(3, 1, truck, pos(6, 30), lane(current, 2), none).

lanes(current, [1, 2, 3], 3).
lanes(oncoming, [1], 3).
lanes(cross_right, [1], 3).
lanes(cross_left, [1], 3).

traffic_light(green, 3).

intent(enter_left_lane, 3).

expected_action(turn_left, 3).

