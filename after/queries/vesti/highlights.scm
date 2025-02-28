; Tree-sitter highlighting queries for the vesti language

;; Keywords
((KEYWORD_docclass) @keyword)
((KEYWORD_importpkg) @keyword)
((KEYWORD_importmod) @keyword)
((KEYWORD_importfile) @keyword)
((KEYWORD_importves) @keyword)
((KEYWORD_useltx3) @keyword)
((KEYWORD_getfp) @keyword)
((KEYWORD_startdoc) @keyword)
((KEYWORD_useenv) @keyword)
((KEYWORD_begenv) @keyword)
((KEYWORD_endenv) @keyword)
((KEYWORD_makeatletter) @keyword)
((KEYWORD_makeatother) @keyword)
((KEYWORD_ltx3on) @keyword)
((KEYWORD_ltx3off) @keyword)
((KEYWORD_nonstopmode) @keyword)
((KEYWORD_luacode) @keyword)

;; Identifiers
((class_pkg_name) @type)
((env_name) @type)
((luacode_contents) @injection.language) @injection.content
((latex_function_name) @function)

((inline_math) @string)
((display_math) @string)

((singleline_raw_latex) @hint)
((multiline_raw_latex) @hint)

;; Options and environment arguments
((options) @constant)
((mandantory_arg) @constant)
((optional_arg) @constant)

;; Comments
((line_comment) @comment)
((multiline_comment) @comment)
