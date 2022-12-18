; extends
(
    (line_comment) @_first 
    (_) @rust
    (line_comment) @_last 
    (#match? @_first "^/// ```$") 
    (#match? @_last "^/// ```$")
    (#offset! @rust 0 4 0 4)
)


; (
;   (macro_invocation
;     macro: ((identifier) @_html_def)
;     (token_tree) @vue)
;
;     (#eq? @_html_def "view")
; )
