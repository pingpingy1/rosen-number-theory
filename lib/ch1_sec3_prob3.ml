(* Calculating the Egyptian fraction *)

type frac = Fr of int * int

let num = fst

let denom = snd

let string_of_frac frac =
  (frac |> num |> string_of_int) ^ "/" ^ (frac |> denom |> string_of_int)

let print_frac frac = frac |> string_of_frac |> print_string

let modulo x y =
  let res = x mod y in
  if res >= 0 then res else res + y

let rec gcd a b = if b = 0 then a else gcd b (modulo a b)

let simplify frac =
  let div = gcd (num frac) (denom frac) in
  (num frac / div, denom frac / div)

let subtract frac1 frac2 =
  let num1 = num frac1 in
  let denom1 = denom frac1 in
  let num2 = num frac2 in
  let denom2 = denom frac2 in
  simplify ((num1 * denom2) - (num2 * denom1), denom1 * denom2)

let greedy_egypt frac =
  let max_den = ((denom frac - 1) / num frac) + 1 in
  let greedy_res = (1, max_den) in
  (greedy_res, subtract frac greedy_res)

let rec egyptian_frac frac acc =
  if num frac = 1 then frac :: acc
  else
    let res, rem = greedy_egypt frac in
    egyptian_frac rem (res :: acc)

let print_egyptian_frac frac =
  let () = print_frac frac in
  let () = print_string " = " in
  egyptian_frac frac [] |> List.map string_of_frac |> String.concat " + "
  |> print_endline
