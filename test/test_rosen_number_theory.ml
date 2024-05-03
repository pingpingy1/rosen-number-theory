open OUnit2
open Rosen_number_theory.Ch1_sec3_prob3

let tests =
  "test suite for ch1_sec3_prob3"
  >::: [
         ("modulo1" >:: fun _ -> assert_equal 3 (modulo 30 9));
         ("modulo2" >:: fun _ -> assert_equal 3 (modulo ~-6 9));
         ("gcd" >:: fun _ -> assert_equal 2 (gcd 6 22));
         ("simplify" >:: fun _ -> assert_equal (2, 5) (simplify (6, 15)));
         ( "egyptian_frac1" >:: fun _ ->
           assert_equal [ (1, 6); (1, 2) ] (egyptian_frac (2, 3) []) );
         ( "egyptian_frac2" >:: fun _ ->
           assert_equal [ (1, 238); (1, 7); (1, 2) ] (egyptian_frac (11, 17) [])
         );
         ( "egyptian_frac3" >:: fun _ ->
           assert_equal
             [ (1, 1311990); (1, 433); (1, 10); (1, 3) ]
             (egyptian_frac (44, 101) []) );
       ]

let _ = run_test_tt_main tests
