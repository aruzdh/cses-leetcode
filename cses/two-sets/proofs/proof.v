Require Import Arith.
Require Import List.
Require Import Lia.
Require Import Sorting.Permutation.
Import ListNotations.

Definition is_missing (n x : nat) (l : list nat) : Prop :=
  Permutation (x::l) (seq 1 n).

Definition sum_formula (n : nat) : nat := (n * (n + 1))/2.
Definition sum_list (l : list nat) : nat := list_sum l.

Theorem missing_number_correct : forall (n x : nat) (l : list nat),
  is_missing n x l -> sum_formula n - sum_list l = x.
Proof.
