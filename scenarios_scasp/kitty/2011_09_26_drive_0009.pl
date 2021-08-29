% Basic driving simple traffic, city scenario

%%% FRAME 1 - 50.png %%%
self_speed(6, 1).

self_lane(1, 1).

speed_limit(10, 1).

obj_meta(1, 1, car, pos(-3, 8), lane(oncoming, 1), none).
obj_meta(1, 2, car, pos(-3, 12), lane(oncoming, 1), none).

lanes(current, [1], 1).
lanes(oncoming, [1], 1).

traffic_light(none, 1).

intent(continue_in_lane, 1).

expected_action(accelerate, 1).

%%% FRAME 2 - 100.png %%%
self_speed(8, 2).

self_lane(1, 2).

speed_limit(10, 2).

obj_meta(2, 1, car, pos(0, 30), lane(current, 1), none).

lanes(current, [1], 2).
lanes(oncoming, [1], 2).

traffic_light(none, 2).

intent(continue_in_lane, 2).

expected_action(accelerate, 2).

%%% FRAME 3 - 360.png %%%
self_speed(6, 3).

self_lane(1, 3).

speed_limit(10, 3).

obj_meta(3, 1, car, pos(-3, 4), lane(oncoming, 1), none).
obj_meta(3, 2, car, pos(-4, 7), lane(oncoming, 1), none).
obj_meta(3, 3, car, pos(-3, 15), lane(oncoming, 1), none).
obj_meta(3, 4, car, pos(2, 16), lane(oncoming, 1), none).
obj_meta(3, 5, car, pos(-6, 12), lane(oncoming, 1), none).

lanes(current, [1], 3).
lanes(oncoming, [1], 3).

traffic_light(red, 3).

intersection(four_way, major, arriving, 3).

intent(continue_in_lane, 3).

expected_action(brake, 3).

