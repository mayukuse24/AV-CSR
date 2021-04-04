%:- include(scenarios/scenario_1).

start_drive(Scenario_file, Timestamp) :- consult(Scenario_file), start_drive(Timestamp).
start_drive(Timestamp) :- suggest_decision(Timestamp, Action), execute(Action, Timestamp), Timestamp1 is Timestamp + 1, start_drive(Timestamp1).

% TODO: consider using something like "choice rules" in CLINGO (see AV paper)
% to select one of n possible actions for each fact

suggest_decision(T, brake) :- brake_constraints(T), writeln(brake(T)), sleep(0.5), !.
suggest_decision(T, accelerate) :- acc_constraints(T), writeln(accelerate(T)), sleep(0.5), !.
suggest_decision(T, none) :- writeln(none(T)), sleep(0.5).

acc_constraints(T) :- below_speed_limit(T), not(obstacle_in_front(T)).

brake_constraints(T) :- obstacle_in_front(T).
brake_constraints(T) :- traffic_signal(red, T).

obstacle_in_front(T) :- self_lane(Lid, T), obj_meta(Oid, Depth, Lid, _, T), Depth < 10.
below_speed_limit(T) :- self_speed(S, T), speed_limit(SL, T), S =< SL.


% Simulate chosen actions
execute(accelerate, T) :- self_speed(S, T), S1 is S + 1, T1 is T + 1, assertz(self_speed(S1, T1)).
execute(brake, T) :- self_speed(S, T), S1 is S - 1, T1 is T + 1, assertz(self_speed(S1, T1)).
execute(none, T) :- self_speed(S, T), T1 is T + 1, assertz(self_speed(S, T1)).
