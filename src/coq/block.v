Require Import Coq.Numbers.BinNums.

Record Block : Type := {
  magic_number : nat;
  timestamp : nat;
  nonce : nat;
  (* body : list Item; *)
}.
