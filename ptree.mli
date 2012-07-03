(*
 * Copyright 2012 Be Sport, Inc.
 *)

type 'a t

val create : unit -> 'a t

val insert : 'a t -> string -> 'a -> unit

val remove : 'a t -> string -> 'a -> unit

val fold : string -> ('b -> 'a -> 'b * bool) -> 'b -> 'a t -> 'b

val fold_with_max : max:int -> string -> ('b -> 'a -> 'b) -> 'b -> 'a t -> 'b
