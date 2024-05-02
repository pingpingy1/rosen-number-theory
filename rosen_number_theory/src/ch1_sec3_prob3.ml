(* Calculating the Egyptian fraction *)

type frac = Fr of int * int

let num = fst
let denom = snd

let string_of_frac frac =
    (frac |> num |> string_of_int) ^ "/" ^ (frac |> denom |> string_of_int)


let gcd a b =
    if b = 1 then a else gcd b (a - b)

let simplify frac =
    let div = gcd (num frac) (denom frac) in
    ((num frac) / div, (denom frac) / div)

let subtract frac1 frac2 =
    let num1 = num frac1 in
    let denom1 = denom frac1 in
    let num2 = num frac2 in
    let denom2 = denom frac2 in
    simplify (num1 * denom2 - num2 * denom1, denom1 * denom2)

let greedy_egypt frac =
    let max_den = (denom frac) / (num frac) in
    let greedy_res = (1, max_den) in
    greedy_res, subtract frac greedy_res

let rec egyptian_frac frac acc =
    if num frac = 1 then frac :: acc else
    let res, rem = greedy_egypt frac in
    egyptian_frac rem (res :: acc)
