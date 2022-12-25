;; extends

((start_tag
    ("<" @keyword)
    ((tag_name) @keyword @cap (#any-of? @cap "main" "style" "script"))
    (">" @keyword)
))
((end_tag
    ("</" @keyword)
    ((tag_name) @keyword @cap (#any-of? @cap "main" "style" "script"))
    (">" @keyword)
))
