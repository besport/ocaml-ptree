(*
 * Copyright 2012 Be Sport, Inc.
 *)

type 'a t = 'a Radix.t ref

let create () = ref (Radix.create ())

let fold prefix f acc ptree = fst(Radix.lookup !ptree prefix f acc)

let fold_with_max ~max prefix f acc ptree =
  let g (acc,n) v = match n with
    | i when i <= 0 -> (acc,0),true
    | 1 -> ((f acc v),0),true
    | n -> ((f acc v),n-1),false in
  let (res,_) = fold prefix g (acc,max) ptree in
  res

(* insert does not behave properly when inserting several time the same object *)
let insert ptree label value =
  ptree := Radix.bind (!ptree) label value

let rec remove ptree label value =
  ptree := Radix.remove (!ptree) label value

