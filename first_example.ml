open Core.Std
open Biocaml

(* To build:
$ ocamlfind ocamlc -linkpkg -thread \
-package core \
-package biocaml \
first_example.ml -o first_example.native

OR

(create first_example.ocp)
$ ocp-build root
$ ocp-build build
*)

let toy_bam_file = "data/toy.bam"

let print_bam_file bam_file =
  Stream.iter
    (fun item ->
      print_endline (
	Sexplib.Sexp.to_string_hum (
	  Sam.sexp_of_item (
	    Core.Option.value_exn (Core.Result.ok item)
	  )
	)
      )
    )
    bam_file

let () =
  print_bam_file (Bam.in_channel_to_item_stream (open_in toy_bam_file))


