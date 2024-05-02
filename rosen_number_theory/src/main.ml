open Rosen_number_theory.Ch1_sec3_prob3

let prompt_for_pos_int prompt =
  let rec try_again () =
    match read_int_opt () with
    | None ->
        let () = print_endline "Please, enter a positive integer" in
        try_again ()
    | Some n when n < 1 ->
        let () = print_endline "Please, enter a positive integer" in
        try_again ()
    | Some n -> n
  in
  let () = print_endline prompt in
  try_again ()

let ch1_sec3_prob3 () =
  let num =
    prompt_for_pos_int "Please enter a positive integer as the numerator:"
  in
  let denom =
    prompt_for_pos_int "Please enter a positive integer as the denominator:"
  in
  print_egyptian_frac (num, denom)

let main () =
  let chapter = prompt_for_pos_int "Please enter the chapter:" in
  let section = prompt_for_pos_int "Please enter the section:" in
  let problem = prompt_for_pos_int "Please enter the problem number:" in
  match (chapter, section, problem) with
  | 1, 3, 3 -> ch1_sec3_prob3 ()
  | _ -> print_endline "Sorry, I didn\'t solve that problem yet."

let () = main ()
