
%% ENTITY HIERARCHY %%
class(entity).

class(automobile).
class(non_automobile).

%% AUTOMOBILE
class(car).
class(bike).
class(truck).
%

%% NON AUTOMOBILE %%
class(pedestrian).
class(traffic_light).
class(plastic_bag).
class(roadblock).
class(unknown).
%%

is_subclass(automobile, entity).
is_subclass(non_automobile, entity).

is_subclass(car, automobile).
is_subclass(bike, automobile).
is_subclass(truck, automobile).

is_subclass(pedestrian, non_automobile).
is_subclass(traffic_light, non_automobile).
is_subclass(plastic_bag, non_automobile).
is_subclass(roadblock, non_automobile).
is_subclass(unknown, non_automobile).

%is_subclass(X, Y) :- class(X), class(Z), class(Y), is_subclass(X, Z), is_subclass(Z, Y).

% By default, cannot drive over an entity
%-can_drive_over(X) :- class(Y), is_class(X, Y), is_subclass(Y, entity), not ab(dneg_can_drive_over(X)), not can_drive_over(X).

% By default, can swirl around a non_automobile
can_swirl_around(X) :- class(X), is_subclass(X, non_automobile), not ab(d_can_swirl_around(X)), not neg_can_swirl_around(X).

% Do not try to swirl around pedestrian
neg_can_swirl_around(pedestrian).

%% ADDITIONAL HIERARCHIES
indicator(brake_light).
indicator(turn_signals).
indicator(tail_lights).

% By default, automobiles have all indicators
%has_indicator(X, Y) :- automobile(X), indicator(Y), not ab(d_has_indicator(X, Y)), not -has_indicator(X, Y).

% Dont assume automobile has indicator (weak exception) if it is a cycle (2-wheeler?)
% ab(d_has_indicator(X, Y)) :- Y = brake_light, not -e_has_indicator(X, Y). (NOTE: can further split entity hierarchy)
%ab(d_has_indicator(X, Y)) :- not -e_has_indicator(X, Y).
