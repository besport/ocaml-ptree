(*
 * Copyright 2012 Be Sport, Inc.
 *)

type 'a t

val create : unit -> 'a t

val bind : 'a t -> string -> 'a -> 'a t

val remove : 'a t -> string -> 'a -> 'a t

val lookup : 'a t -> string -> ('b -> 'a -> 'b * bool) -> 'b -> 'b * bool
