% Residential - Left turn at t-intersection, turn before approaching car.

%%% FRAME 1 - 640.png %%%
self_speed(5, 1).
self_lane(1, 1).

speed_limit(10, 1).

obj_meta(1, 1, car, pos(-2, 4), lane(oncoming, 1), none).
obj_meta(1, 2, car, pos(-2, 8), lane(oncoming, 1), none).

lanes(current, [1], 1).
lanes(oncoming, [1], 1).

traffic_light(none, 1).

intent(continue_in_lane, 1).

expected_action(accelerate, 1).

%%% FRAME 2 - 730.png %%%
self_speed(2, 2).
self_lane(1, 2).

speed_limit(10, 2).

obj_meta(2, 1, car, pos(-3, 12), lane(oncoming, 1), none).

lanes(current, [1], 2).
lanes(oncoming, [1], 2).

intersection(t_intersect, major, enter, 2).

traffic_light(none, 2).

intent(enter_left_lane, 2).

expected_action(turn_left, 2).

%%% FRAME 3 - 770.png %%%
self_speed(12, 3).
self_lane(1, 3).

speed_limit(10, 3).

lanes(current, [1], 3).
lanes(oncoming, [1], 3).

traffic_light(none, 3).

intent(continue_in_lane, 3).

expected_action(cruise, 3).

