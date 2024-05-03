(* Collatz conjecture *)

let collatz_step n = if n mod 2 = 0 then n / 2 else ((3 * n) + 1) / 2

let rec collatz_seq n acc =
  if n = 1 then 1 :: acc else collatz_seq (collatz_step n) (n :: acc)

let print_collatz_seq n =
  let seq = collatz_seq n [] |> List.rev in
  let len = List.length seq - 1 in
  let () =
    seq |> List.map string_of_int |> String.concat " -> " |> print_endline
  in
  "(" ^ string_of_int len ^ " steps)" |> print_endline
