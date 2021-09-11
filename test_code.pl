
%-can_drive_over(X) :- class(Y), is_class(X, Y), is_subclass(Y, entity), not ab(dneg_can_drive_over(X)), not can_drive_over(X).

%can_swirl_around(X) :- class(Y), is_class(X, Y), is_subclass(Y, non_automobile), not ab(d_can_swirl_around(X)), not -can_swirl_around(X).

has_indicator(X, Y) :- automobile(X), indicator(Y), not ab(d_has_indicator(X, Y)).

mv_ahead_in_lane(Lid, Dist, T) :- class(OType), is_subclass(OType, automobile), Depth #> 0, Depth #< Dist, obj_meta(_, OType, Depth, Lid, _, T).

abs(X, X) :- X #>= 0.
abs(X, Y) :- X #< 0, Y is X * -1.