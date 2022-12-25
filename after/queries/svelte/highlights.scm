;; extends

((_
    ([ "<" "</" ] @keyword)
    ((tag_name) @keyword @cap (#any-of? @cap "main" "style" "script"))
    (">" @keyword)
))
