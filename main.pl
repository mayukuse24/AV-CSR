
start_drive(Scenario_file, Timestamp) :- consult(Scenario_file), start_drive(Timestamp).
start_drive(Timestamp) :- suggest_decision(Timestamp, Action), Timestamp1 is Timestamp + 1, start_drive(Timestamp1).

% TODO: consider using something like "choice rules" in CLINGO (see AV paper)
% to select one of n possible actions

suggest_decision(T, brake) :- brake_constraints(T), writeln(accelerate(5, T)), sleep(0.5).
suggest_decision(T, accelerate) :- acc_constraints(T), writeln(accelerate(5, T)), sleep(0.5).
suggest_decision(T, none).

acc_constraints(T) :- below_speed_limit(T), not(obstacle_in_front(T)).

brake_constraints(T) :- obstacle_in_front(T).
brake_constraints(T) :- traffic_signal(red).

obstacle_in_front(T) :- self_lane(Lid, T), lane(Lid, Objs, T), member(Oid, Objs), depth(Oid, D, T), D < 10.
below_speed_limit(T) :- self_speed(S, T), speed_limit(SL, T), S =< SL.