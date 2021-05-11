%:- dynamic obj_meta/6, lanes/2, intent/2, traffic_light/2, expected_action/2, speed_limit/2, self_speed/2, self_lane/2.

#include 'scenarios/scenario_3_idx.pl'.
#include 'rules/entities.pl'.

action(change_lane_left). action(change_lane_right).
action(brake). action(accelerate). action(cruise).

start_drive(FT, FT).
start_drive(ITimestamp, FTimestamp) :- ITimestamp #< FTimestamp, expected_action(EAct, ITimestamp), suggest_action(Action, ITimestamp),
                                       ITimestamp1 is ITimestamp + 1, start_drive(ITimestamp1, FTimestamp).

% TODO: consider using something like "choice rules" to select one of n possible actions for each fact

brake_constraints(T) :- self_lane(SLid, T), mv_ahead_in_lane(T, SLid, 10).
brake_constraints(T) :- self_lane(SLid, T), nonmv_ahead_in_lane(T, SLid, 10).

suggest_action(Act, T) :- action(Act), not neg_suggest_action(Act, T), action_constraints(Act, T).
neg_suggest_action(Act, T) :- action(Act), not suggest_action(Act, T).

action_constraints(brake, T) :- brake_constraints(T), not ab(d_action_constraints(brake, T)).
action_constraints(accelerate, T) :- acc_constraints(T), not ab(d_action_constraints(accelerate, T)), not neg_action_constraints(accelerate, T).
action_constraints(cruise, T) :- cruise_constraints(T), not ab(d_action_constraints(cruise, T)).
action_constraints(change_lane_left, T) :- change_lane_left_constraints(T), not ab(d_action_constraints(change_lane_left, T)),
                                           not neg_action_constraints(change_lane_left, T).
action_constraints(change_lane_right, T) :- change_lane_right_constraints(T), not ab(d_action_constraints(change_lane_right, T)),
                                           not neg_action_constraints(change_lane_right, T).

%suggest_decision(T, change_lane_left) :- intent(stay_in_leftmost_lane, T), change_lane_constraints(left, T), sleep(0.5), !.
%suggest_decision(T, change_lane_right) :- intent(stay_in_rightmost_lane, T), change_lane_constraints(right, T), sleep(0.5), !.

acc_constraints(T) :- below_speed_limit(T).

neg_action_constraints(accelerate, T) :- self_lane(SLid, T), obstacle_ahead_in_lane(T, SLid, 10).
neg_action_constraints(accelerate, T) :- traffic_light(red, T).

%-action_constraints(T, accelerate) :- self_lane(SLid, T), obstacle_ahead_in_lane(SLid, 10, T).
%-action_constraints(T, accelerate) :- traffic_light(red, T).

cruise_constraints(T) :- self_lane(SLid, T), not obstacle_ahead_in_lane(T, SLid, 5).

change_lane_left_constraints(T) :- self_lane(SLid, T), nonmv_ahead_in_lane(T, SLid, 20).
change_lane_left_constraints(T) :- intent(stay_in_leftmost_lane, T).

neg_action_constraints(change_lane_left, T) :- not left_lane_clear(T).
left_lane_clear(T) :- self_lane(SLid, T), lanes([LeftmostLid | Lids], T), SLid \= LeftmostLid, LLid is SLid - 1, not obstacle_ahead_in_lane(T, LLid, 10).

change_lane_right_constraints(T) :- self_lane(SLid, T), nonmv_ahead_in_lane(T, SLid, 20).
change_lane_right_constraints(T) :- intent(stay_in_rightmost_lane, T).

neg_action_constraints(change_lane_right, T) :- not right_lane_clear(T).
right_lane_clear(T) :- self_lane(SLid, T), lanes(Lids, T), last(Lids, RightmostLid), SLid \= RightmostLid, RLid is SLid + 1, not obstacle_ahead_in_lane(T, RLid, 10).

obstacle_ahead_in_lane(T, Lid, Dist) :- mv_ahead_in_lane(T, Lid, Dist).
obstacle_ahead_in_lane(T, Lid, Dist) :- nonmv_ahead_in_lane(T, Lid, Dist).

nonmv_ahead_in_lane(T, Lid, Dist) :- class(OType), is_subclass(OType, non_automobile), Depth #< Dist, obj_meta(T, _, OType, Depth, Lid, none).

mv_ahead_in_lane(T, Lid, Dist) :- class(OType), is_subclass(OType, automobile), Depth #< Dist, obj_meta(T, _, OType, Depth, Lid, none).

%above_speed_limit(T) :- self_speed(S, T), speed_limit(SL, T), S #>= SL.
below_speed_limit(T) :- self_speed(S, T), speed_limit(SL, T), S #=< SL.


%%% HELPER FUNCTIONS %%%

last([X], X).
last([Y | Ls], X) :- last(Ls, X).

abs(X, X) :- X #>= 0.
abs(X, Y) :- X #< 0, Y is X * -1.

%%%

% ?- start_drive(1).

#show expected_action/2.
#show suggest_action/2.