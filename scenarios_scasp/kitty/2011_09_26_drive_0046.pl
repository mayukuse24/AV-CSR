% Left turn at four-way, wait for car incoming from left
% to pass before turning.

%%% FRAME 1 - 60.png %%%
self_speed(2, 1).
self_lane(1, 1).

speed_limit(20, 1).

obj_meta(1, 1, car, pos(-2, 4), lane(cross_right, 1), none).

lanes(current, [1], 1).
lanes(oncoming, [1], 1).

intersection(four_way, major, at, 1).

self_pred_path(sp1, 1).
obj_pred_path(1, op1, 1).
path_intersects(sp1, op1).

traffic_light(none, 1).

intent(enter_left_lane, 1).

expected_action(brake, 1).

%%% FRAME 2 - 100.png %%%
self_speed(2, 2).
self_lane(1, 2).

speed_limit(20, 2).

lanes(current, [1], 2).
lanes(oncoming, [1], 2).

intersection(four_way, major, enter, 2).

traffic_light(none, 2).

intent(enter_left_lane, 2).

expected_action(turn_left, 2).

%%% FRAME 3 - 120.png %%%
self_speed(2, 3).
self_lane(1, 3).

speed_limit(20, 3).

lanes(current, [1], 3).
lanes(oncoming, [1], 3).

traffic_light(none, 3).

intent(continue_in_lane, 3).

expected_action(accelerate, 3).

