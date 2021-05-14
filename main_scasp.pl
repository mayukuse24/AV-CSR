%:- dynamic obj_meta/6, lanes/2, intent/2, traffic_light/2, expected_action/2, speed_limit/2, self_speed/2, self_lane/2.

#include 'scenarios_scasp/scenario_3.pl'.
#include 'rules/entities.pl'.

action(change_lane_left). action(change_lane_right).
action(brake). action(accelerate). action(cruise).

start_drive(FT, FT).
start_drive(ITimestamp, FTimestamp) :- ITimestamp #< FTimestamp, expected_action(EAct, ITimestamp), suggest_action(Action, ITimestamp),
                                       ITimestamp1 is ITimestamp + 1, start_drive(ITimestamp1, FTimestamp).

% Select one action for every frame/timestamp T
suggest_action(Act, T) :- action(Act), not neg_suggest_action(Act, T), action_constraints(Act, T).
neg_suggest_action(Act, T) :- action(Act), not suggest_action(Act, T).

% Default rule structure for each action
action_constraints(brake, T) :- brake_conditions(T), not ab(d_action_constraints(brake, T)).
action_constraints(accelerate, T) :- acc_conditions(T), not ab(d_action_constraints(accelerate, T)), not neg_action_constraints(accelerate, T).
action_constraints(cruise, T) :- cruise_conditions(T), not ab(d_action_constraints(cruise, T)).
action_constraints(change_lane_left, T) :- change_lane_left_conditions(T), not ab(d_action_constraints(change_lane_left, T)),
                                           not neg_action_constraints(change_lane_left, T).
action_constraints(change_lane_right, T) :- change_lane_right_conditions(T), not ab(d_action_constraints(change_lane_right, T)),
                                           not neg_action_constraints(change_lane_right, T).

% Brake conditions/constraints
brake_conditions(T) :- self_lane(SLid, T), obstacle_ahead_in_lane(T, SLid, 10, OType), neg_can_drive_over(OType).
%

% Accelerate conditions/constraints
acc_conditions(T) :- below_speed_limit(T).

neg_action_constraints(accelerate, T) :- self_lane(SLid, T), neg_lane_clear(T, SLid, 10).
neg_action_constraints(accelerate, T) :- traffic_light(red, T).
%

% Cruise conditions/constraints
cruise_conditions(T).
%

% Change lane left conditions/constraints
change_lane_left_conditions(T) :- self_lane(SLid, T), nonmv_ahead_in_lane(T, SLid, 20, OType), neg_can_drive_over(OType), can_swerve_around(OType).
change_lane_left_conditions(T) :- intent(stay_in_leftmost_lane, T).

neg_action_constraints(change_lane_left, T) :- not left_lane_clear(T).

left_lane_clear(T) :- self_lane(SLid, T), lanes([LeftmostLid | Lids], T), SLid \= LeftmostLid, LLid is SLid - 1,
                      not neg_lane_clear(T, LLid, 10).
%

% Change lane right conditions/constraints
change_lane_right_conditions(T) :- self_lane(SLid, T), nonmv_ahead_in_lane(T, SLid, 20, OType), neg_can_drive_over(OType), can_swerve_around(OType).
change_lane_right_conditions(T) :- intent(stay_in_rightmost_lane, T).

neg_action_constraints(change_lane_right, T) :- not right_lane_clear(T).

right_lane_clear(T) :- self_lane(SLid, T), lanes(Lids, T), last(Lids, RightmostLid), SLid \= RightmostLid, RLid is SLid + 1,
                       not neg_lane_clear(T, RLid, 10).
%

% Check if lane Lid is not clear for distance Dist ahead
neg_lane_clear(T, Lid, Dist) :- class(OType), Depth #> 0, Depth #< Dist, obj_meta(T, _, OType, Depth, Lid, none).


% Check if obstacle within Dist ahead in lane Lid and return Obstacle type.
% WARNING: do not use negation of this predicate directly/indirectly.
% It returns the wrong answer if OType is not passed in negated call
% Use the naf version neg_lane_clear predicate above
obstacle_ahead_in_lane(T, Lid, Dist, OType) :- mv_ahead_in_lane(T, Lid, Dist, OType).
obstacle_ahead_in_lane(T, Lid, Dist, OType) :- nonmv_ahead_in_lane(T, Lid, Dist, OType).

nonmv_ahead_in_lane(T, Lid, Dist, OType) :- class(OType), subclass(OType, non_automobile), Depth #> 0, Depth #< Dist, 
                                            obj_meta(T, _, OType, Depth, Lid, none).

mv_ahead_in_lane(T, Lid, Dist, OType) :- class(OType), subclass(OType, automobile), Depth #> 0, Depth #< Dist,
                                         obj_meta(T, _, OType, Depth, Lid, none).

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