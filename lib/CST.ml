(* Generated by ocaml-tree-sitter. *)
(*
   r grammar

   entrypoint: program
*)

open! Sexplib.Conv
open Tree_sitter_run

type pat_5e7ac5f = Token.t (* pattern [^%\\\n]+|\\\r?\n *)
[@@deriving sexp_of]

type pat_abe3ef5 = Token.t (* pattern [A-Za-z.][A-Za-z0-9_.]* *)
[@@deriving sexp_of]

type pat_de5d470 = Token.t (* pattern "[^\"\\\\\\n]+|\\\\\\r?\\n" *)
[@@deriving sexp_of]

type na = [
    `NA of Token.t (* "NA" *)
  | `NA_char_ of Token.t (* "NA_character_" *)
  | `NA_comp_ of Token.t (* "NA_complex_" *)
  | `NA_int_ of Token.t (* "NA_integer_" *)
  | `NA_real_ of Token.t (* "NA_real_" *)
]
[@@deriving sexp_of]

type pat_4ad362e = Token.t (* pattern [^`\\\n]+|\\\r?\n *)
[@@deriving sexp_of]

type float_ = Token.t
[@@deriving sexp_of]

type integer = Token.t
[@@deriving sexp_of]

type escape_sequence = Token.t
[@@deriving sexp_of]

type pat_3e57880 = Token.t (* pattern "[^'\\\\\\n]+|\\\\\\r?\\n" *)
[@@deriving sexp_of]

type special = (
    Token.t (* "%" *)
  * [
        `Pat_5e7ac5f of pat_5e7ac5f (*tok*)
      | `Esc_seq of escape_sequence (*tok*)
    ]
      list (* zero or more *)
  * Token.t (* "%" *)
)
[@@deriving sexp_of]

type identifier = [
    `Pat_abe3ef5 of pat_abe3ef5 (*tok*)
  | `BQUOT_rep_choice_pat_4ad362e_BQUOT of (
        Token.t (* "`" *)
      * [
            `Pat_4ad362e of pat_4ad362e (*tok*)
          | `Esc_seq of escape_sequence (*tok*)
        ]
          list (* zero or more *)
      * Token.t (* "`" *)
    )
]
[@@deriving sexp_of]

type string_ = [
    `DQUOT_rep_choice_pat_de5d470_DQUOT of (
        Token.t (* "\"" *)
      * [
            `Pat_de5d470 of pat_de5d470 (*tok*)
          | `Esc_seq of escape_sequence (*tok*)
        ]
          list (* zero or more *)
      * Token.t (* "\"" *)
    )
  | `SQUOT_rep_choice_pat_3e57880_SQUOT of (
        Token.t (* "'" *)
      * [
            `Pat_3e57880 of pat_3e57880 (*tok*)
          | `Esc_seq of escape_sequence (*tok*)
        ]
          list (* zero or more *)
      * Token.t (* "'" *)
    )
]
[@@deriving sexp_of]

type anon_choice_id_c711a0e = [
    `Id of identifier
  | `Str of string_
  | `Dots of Token.t (* "..." *)
]
[@@deriving sexp_of]

type argument = [
    `Exp of expression
  | `Choice_id_EQ_opt_exp of (
        anon_choice_id_c711a0e
      * Token.t (* "=" *)
      * expression option
    )
]

and arguments =
  [ `Arg of argument | `COMMA of Token.t (* "," *) ] list (* one or more *)

and assignment = [
    `Equals_assign of (expression * Token.t (* "=" *) * expression)
  | `Left_assign of (expression * Token.t (* "<-" *) * expression)
  | `Left_assign2 of (expression * Token.t (* ":=" *) * expression)
  | `Right_assign of (expression * Token.t (* "->" *) * expression)
  | `Super_assign of (expression * Token.t (* "<<-" *) * expression)
]

and binary = [
    `Exp_PLUS_exp of (expression * Token.t (* "+" *) * expression)
  | `Exp_DASH_exp of (expression * Token.t (* "-" *) * expression)
  | `Exp_STAR_exp of (expression * Token.t (* "*" *) * expression)
  | `Exp_SLASH_exp of (expression * Token.t (* "/" *) * expression)
  | `Exp_HAT_exp of (expression * Token.t (* "^" *) * expression)
  | `Exp_LT_exp of (expression * Token.t (* "<" *) * expression)
  | `Exp_GT_exp of (expression * Token.t (* ">" *) * expression)
  | `Exp_LTEQ_exp of (expression * Token.t (* "<=" *) * expression)
  | `Exp_GTEQ_exp of (expression * Token.t (* ">=" *) * expression)
  | `Exp_EQEQ_exp of (expression * Token.t (* "==" *) * expression)
  | `Exp_BANGEQ_exp of (expression * Token.t (* "!=" *) * expression)
  | `Exp_BARBAR_exp of (expression * Token.t (* "||" *) * expression)
  | `Exp_BAR_exp of (expression * Token.t (* "|" *) * expression)
  | `Exp_AMPAMP_exp of (expression * Token.t (* "&&" *) * expression)
  | `Exp_AMP_exp of (expression * Token.t (* "&" *) * expression)
  | `Exp_spec_exp of (expression * special * expression)
  | `Exp_COLON_exp of (expression * Token.t (* ":" *) * expression)
  | `Exp_TILDE_exp of (expression * Token.t (* "~" *) * expression)
]

and expression = [
    `Id of identifier
  | `Int of integer (*tok*)
  | `Float of float_ (*tok*)
  | `Comp of (float_ (*tok*) * Token.t (* "i" *))
  | `Str of string_
  | `Call of (
        expression
      * Token.t (* "(" *)
      * arguments option
      * Token.t (* ")" *)
    )
  | `Func_defi of function_definition
  | `Assign of assignment
  | `Brace_list of (Token.t (* "{" *) * program * Token.t (* "}" *))
  | `Paren_list of (
        Token.t (* "(" *)
      * expression list (* zero or more *)
      * Token.t (* ")" *)
    )
  | `Bin of binary
  | `Un of unary
  | `Subset of (
        expression
      * Token.t (* "[" *)
      * arguments option
      * Token.t (* "]" *)
    )
  | `Subset2 of (
        expression
      * Token.t (* "[[" *)
      * arguments option
      * Token.t (* "]]" *)
    )
  | `Dollar of (
        expression
      * Token.t (* "$" *)
      * [ `Id of identifier | `Str of string_ ]
    )
  | `Slot of (expression * Token.t (* "@" *) * identifier)
  | `Name_get of (identifier * Token.t (* "::" *) * identifier)
  | `Name_get_inte of (identifier * Token.t (* ":::" *) * identifier)
  | `If of (
        Token.t (* "if" *)
      * Token.t (* "(" *)
      * expression
      * Token.t (* ")" *)
      * expression
      * (Token.t (* "else" *) * expression) option
    )
  | `For of (
        Token.t (* "for" *) * Token.t (* "(" *) * identifier
      * Token.t (* "in" *) * expression * Token.t (* ")" *) * expression
    )
  | `While of (
        Token.t (* "while" *) * Token.t (* "(" *) * expression
      * Token.t (* ")" *) * expression
    )
  | `Repeat of (Token.t (* "repeat" *) * expression)
  | `Switch of (
        Token.t (* "switch" *) * Token.t (* "(" *) * expression
      * Token.t (* "," *) * arguments * Token.t (* ")" *)
    )
  | `Brk of Token.t (* "break" *)
  | `Next of Token.t (* "next" *)
  | `True of Token.t (* "TRUE" *)
  | `False of Token.t (* "FALSE" *)
  | `Null of Token.t (* "NULL" *)
  | `Inf of Token.t (* "Inf" *)
  | `Nan of Token.t (* "NaN" *)
  | `Na of na
  | `Dots of Token.t (* "..." *)
  | `SEMI of Token.t (* ";" *)
]

and formal_parameter = [
    `Id of identifier
  | `Choice_id_EQ_exp of (
        anon_choice_id_c711a0e * Token.t (* "=" *) * expression
    )
  | `Dots of Token.t (* "..." *)
]

and formal_parameters = (
    Token.t (* "(" *)
  * (
        formal_parameter
      * (Token.t (* "," *) * formal_parameter) list (* zero or more *)
      * Token.t (* "," *) option
    )
      option
  * Token.t (* ")" *)
)

and function_definition = (
    Token.t (* "function" *) * formal_parameters * expression
)

and program =
  (
      expression
    * [ `LF of Token.t (* "\n" *) | `SEMI of Token.t (* ";" *) ] option
  )
    list (* zero or more *)

and unary = [
    `DASH_exp of (Token.t (* "-" *) * expression)
  | `PLUS_exp of (Token.t (* "+" *) * expression)
  | `BANG_exp of (Token.t (* "!" *) * expression)
  | `TILDE_exp of (Token.t (* "~" *) * expression)
]
[@@deriving sexp_of]

type next (* inlined *) = Token.t (* "next" *)
[@@deriving sexp_of]

type null (* inlined *) = Token.t (* "NULL" *)
[@@deriving sexp_of]

type nan (* inlined *) = Token.t (* "NaN" *)
[@@deriving sexp_of]

type comment (* inlined *) = Token.t
[@@deriving sexp_of]

type break (* inlined *) = Token.t (* "break" *)
[@@deriving sexp_of]

type true_ (* inlined *) = Token.t (* "TRUE" *)
[@@deriving sexp_of]

type false_ (* inlined *) = Token.t (* "FALSE" *)
[@@deriving sexp_of]

type inf (* inlined *) = Token.t (* "Inf" *)
[@@deriving sexp_of]

type dots (* inlined *) = Token.t (* "..." *)
[@@deriving sexp_of]

type complex (* inlined *) = (float_ (*tok*) * Token.t (* "i" *))
[@@deriving sexp_of]

type namespace_get_internal (* inlined *) = (
    identifier * Token.t (* ":::" *) * identifier
)
[@@deriving sexp_of]

type namespace_get (* inlined *) = (
    identifier * Token.t (* "::" *) * identifier
)
[@@deriving sexp_of]

type brace_list (* inlined *) = (
    Token.t (* "{" *) * program * Token.t (* "}" *)
)
[@@deriving sexp_of]

type call (* inlined *) = (
    expression
  * Token.t (* "(" *)
  * arguments option
  * Token.t (* ")" *)
)
[@@deriving sexp_of]

type dollar (* inlined *) = (
    expression
  * Token.t (* "$" *)
  * [ `Id of identifier | `Str of string_ ]
)
[@@deriving sexp_of]

type equals_assignment (* inlined *) = (
    expression * Token.t (* "=" *) * expression
)
[@@deriving sexp_of]

type for_ (* inlined *) = (
    Token.t (* "for" *) * Token.t (* "(" *) * identifier * Token.t (* "in" *)
  * expression * Token.t (* ")" *) * expression
)
[@@deriving sexp_of]

type if_ (* inlined *) = (
    Token.t (* "if" *)
  * Token.t (* "(" *)
  * expression
  * Token.t (* ")" *)
  * expression
  * (Token.t (* "else" *) * expression) option
)
[@@deriving sexp_of]

type left_assignment (* inlined *) = (
    expression * Token.t (* "<-" *) * expression
)
[@@deriving sexp_of]

type left_assignment2 (* inlined *) = (
    expression * Token.t (* ":=" *) * expression
)
[@@deriving sexp_of]

type paren_list (* inlined *) = (
    Token.t (* "(" *)
  * expression list (* zero or more *)
  * Token.t (* ")" *)
)
[@@deriving sexp_of]

type repeat (* inlined *) = (Token.t (* "repeat" *) * expression)
[@@deriving sexp_of]

type right_assignment (* inlined *) = (
    expression * Token.t (* "->" *) * expression
)
[@@deriving sexp_of]

type slot (* inlined *) = (expression * Token.t (* "@" *) * identifier)
[@@deriving sexp_of]

type subset (* inlined *) = (
    expression
  * Token.t (* "[" *)
  * arguments option
  * Token.t (* "]" *)
)
[@@deriving sexp_of]

type subset2 (* inlined *) = (
    expression
  * Token.t (* "[[" *)
  * arguments option
  * Token.t (* "]]" *)
)
[@@deriving sexp_of]

type super_assignment (* inlined *) = (
    expression * Token.t (* "<<-" *) * expression
)
[@@deriving sexp_of]

type switch (* inlined *) = (
    Token.t (* "switch" *) * Token.t (* "(" *) * expression
  * Token.t (* "," *) * arguments * Token.t (* ")" *)
)
[@@deriving sexp_of]

type while_ (* inlined *) = (
    Token.t (* "while" *) * Token.t (* "(" *) * expression
  * Token.t (* ")" *) * expression
)
[@@deriving sexp_of]

type definition (* inlined *) = [ `Func_defi of function_definition ]
[@@deriving sexp_of]

type block (* inlined *) = (
    Token.t (* "{" *)
  * expression list (* zero or more *)
  * Token.t (* "}" *)
)
[@@deriving sexp_of]

let dump_tree root =
  sexp_of_program root
  |> Print_sexp.to_stdout