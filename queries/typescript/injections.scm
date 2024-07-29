((comment) @comment (#eq? @comment "/* sql */")
(template_string
  (string_fragment) @injection.content
  (#set! injection.language "sql")))
