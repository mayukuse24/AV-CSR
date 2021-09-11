% Campus - Drive straight on a campus road with medium pedestrian traffic.

%%% FRAME 1 - 20.png %%%
self_speed(2, 1).
self_lane(1, 1).

speed_limit(5, 1).

obj_meta(1, 1, bicycle, pos(-3, 6), lane(oncoming, 1), none).
obj_meta(1, 2, bicycle, pos(6, 8), lane(sidewalk_right, 1), none).

lanes(current, [1], 1).
lanes(oncoming, [1], 1).
lanes(sidewalk_right, [1], 1).

traffic_light(none, 1).

intent(continue_in_lane, 1).

expected_action(accelerate, 1).

%%% FRAME 2 - 20.png %%%
self_speed(4, 2).
self_lane(1, 2).

speed_limit(5, 2).

obj_meta(2, 1, pedestrian, pos(1, 6), lane(current, 1), none).
obj_meta(2, 2, pedestrian, pos(0, 7), lane(current, 1), none).
obj_meta(2, 3, pedestrian, pos(0, 6), lane(current, 1), none).
obj_meta(2, 4, pedestrian, pos(3, 3), lane(sidewalk_right, 1), none).

lanes(current, [1], 2).
lanes(oncoming, [1], 2).
lanes(sidewalk_right, [1], 2).

traffic_light(none, 2).

intent(continue_in_lane, 2).

expected_action(brake, 2).

%%% FRAME 3 - 100.png %%%
self_speed(2, 3).
self_lane(1, 3).

speed_limit(5, 3).

obj_meta(3, 1, pedestrian, pos(2, 6), lane(sidewalk_right, 1), none).

lanes(current, [1], 3).
lanes(oncoming, [1], 3).

self_pred_path(sp1, 3).
obj_pred_path(1, op1, 3).
path_intersects(sp1, op1).

traffic_light(none, 3).

intent(continue_in_lane, 3).

expected_action(brake, 3).


% findall(OType, obj_meta(1, _, OType, pos(_, 6), _, none), Ls).