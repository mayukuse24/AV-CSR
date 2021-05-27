:- dynamic obj_meta/6, lanes/2, intent/2, traffic_light/2, expected_action/2, speed_limit/2, self_speed/2, self_lane/2.

:- include(scenarios/scenario_3).

/* NOTE: Avoid using consult since it may not remove predicates when rerunning program */
start_drive(Scenario_file, Timestamp) :- /*consult(Scenario_file),*/ start_drive(Timestamp).
start_drive(Timestamp) :- suggest_decision(Timestamp, Action), compare(Action, Timestamp), Timestamp1 is Timestamp + 1, start_drive(Timestamp1).

% TODO: consider using something like "choice rules" to select one of n possible actions for each fact

suggest_decision(T, brake) :- brake_constraints(T), sleep(0.5), !.
suggest_decision(T, change_lane_left) :- intent(stay_in_leftmost_lane, T), change_lane_constraints(left, T), sleep(0.5), !.
suggest_decision(T, change_lane_left) :- self_lane(SLid, T), nonmv_ahead_in_lane(SLid, 20, T), change_lane_constraints(left, T), sleep(0.5), !.
suggest_decision(T, change_lane_right) :- intent(stay_in_rightmost_lane, T), change_lane_constraints(right, T), sleep(0.5), !.
suggest_decision(T, change_lane_right) :- self_lane(SLid, T), nonmv_ahead_in_lane(SLid, 20, T), change_lane_constraints(right, T), sleep(0.5), !.
suggest_decision(T, accelerate) :- acc_constraints(T), sleep(0.5), !.
suggest_decision(T, cruise) :- sleep(0.5).

change_lane_constraints(left, T) :- self_lane(SLid, T), lanes([LeftmostLid | Lids], T), not(SLid == LeftmostLid), 
                                    LLid is SLid - 1, not(obstacle_ahead_in_lane(LLid, 10, T)).
change_lane_constraints(right, T) :- self_lane(SLid, T), lanes(Lids, T), last(Lids, RightmostLid), not(SLid == RightmostLid), 
                                     RLid is SLid + 1, not(obstacle_ahead_in_lane(RLid, 10, T)).

acc_constraints(T) :- below_speed_limit(T), self_lane(SLid, T), not(obstacle_ahead_in_lane(SLid, 10, T)), not(traffic_light(red, T)).

brake_constraints(T) :- self_lane(SLid, T), mv_ahead_in_lane(SLid, 10, T).
brake_constraints(T) :- self_lane(SLid, T), nonmv_ahead_in_lane(SLid, 10, T), self_speed(S, T), S > 2.

obstacle_ahead_in_lane(Lid, Dist, T) :- mv_ahead_in_lane(Lid, Dist, T).
obstacle_ahead_in_lane(Lid, Dist, T) :- nonmv_ahead_in_lane(Lid, Dist, T).

nonmv_ahead_in_lane(Lid, Dist, T) :- obj_meta(_, OType, Depth, Lid, _, T), not(is_mv(OType)), Depth < Dist.

mv_ahead_in_lane(Lid, Dist, T) :- obj_meta(_, OType, Depth, Lid, _, T), is_mv(OType), Depth < Dist.

% is motor vehicle
is_mv(OType) :- member(OType, [car, bicycle, truck]). 

below_speed_limit(T) :- self_speed(S, T), speed_limit(SL, T), S =< SL.

compare(Act, T) :- expected_action(EAct, T), format('~w: suggested: ~w, expected: ~w~n', [T, Act, EAct]).

/*
% Simulate chosen actions
execute(accelerate, T) :- self_speed(S, T), S1 is S + 1, T1 is T + 1, assertz(self_speed(S1, T1)).
execute(brake, T) :- self_speed(S, T), S1 is S - 1, T1 is T + 1, assertz(self_speed(S1, T1)).
execute(none, T) :- self_speed(S, T), T1 is T + 1, assertz(self_speed(S, T1)).
*/