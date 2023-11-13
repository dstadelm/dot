;; extends

; Module docstring
(module . (expression_statement (string) @docstring))

; Class docstring
(class_definition
  body: (block . (expression_statement (string) @docstring)))

; Function/method docstring
(function_definition
  body: (block . (expression_statement (string) @docstring)))

; Attribute docstring
((expression_statement (assignment)) . (expression_statement (string) @docstring))
