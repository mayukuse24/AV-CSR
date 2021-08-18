% Right turn avoiding incoming cyclist, pedestrians

%%% FRAME 1 - 0.png %%%
self_speed(0, 1).
self_lane(1, 1).

speed_limit(20, 1).

obj_meta(1, 1, bicycle, pos(0, 5), lane(current, 1), none).
obj_meta(1, 2, bicycle, pos(0, 8), lane(current, 1), none).
obj_meta(1, 3, pedestrian, pos(4, 4), lane(cross_left, 1), none).
obj_meta(1, 4, pedestrian, pos(4, 4), lane(cross_left, 1), none).

lanes(current, [1], 1).

lanes(oncoming, [1], 1).

intersection(t_intersect, major, at, 1).

self_pred_path(sp1, 1).
obj_pred_path(1, op1, 1).
path_intersects(sp1, op1).

traffic_light(none, 1).

intent(enter_right_lane, 1).

expected_action(brake, 1).

%%% FRAME 2 - 20.png %%%
self_speed(0, 2).
self_lane(1, 2).

speed_limit(20, 2).

obj_meta(2, 1, bicycle, pos(4, 4), lane(cross_right, 1), none).
obj_meta(2, 2, bicycle, pos(0, 12), lane(current, 1), none).
obj_meta(2, 3, pedestrian, pos(4, 6), lane(cross_left, 1), none).
obj_meta(2, 4, pedestrian, pos(4, 6), lane(cross_left, 1), none).

lanes(current, [1], 2).

lanes(oncoming, [1], 2).

intersection(t_intersect, major, at, 2).

self_pred_path(sp1, 2).
obj_pred_path(1, op1, 2).
path_intersects(sp1, op1).

traffic_light(none, 2).

intent(enter_right_lane, 2).

expected_action(brake, 2).

%%% FRAME 3 - 60.png %%%
self_speed(6, 3).
self_lane(1, 3).

speed_limit(20, 3).

obj_meta(3, 1, bicycle, pos(0, 3), lane(oncoming, 1), none).
obj_meta(3, 2, pedestrian, pos(-2, 3), lane(sidewalk_left, 1), none).

lanes(current, [1], 3).

lanes(oncoming, [1], 3).

intersection(t_intersect, major, enter, 3).

traffic_light(none, 3).

intent(enter_right_lane, 3).

expected_action(enter_right_lane, 3).

