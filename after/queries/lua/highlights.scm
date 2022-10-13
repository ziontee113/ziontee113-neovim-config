;; extends
((identifier) @type.qualifier (#vim-match? @type.qualifier "^__.*" ))

;; old conceals
(("return"   @keyword) (#set! conceal ""))
(("local"    @keyword) (#set! conceal "~"))
(("if"       @keyword) (#set! conceal "?"))
(("else"     @keyword) (#set! conceal "!"))
(("elseif"   @keyword) (#set! conceal "¿"))
(("function" @keyword) (#set! conceal ""))
(("for"      @keyword) (#set! conceal ""))
(("and"      @keyword) (#set! conceal "▼"))
(("end"      @keyword) (#set! conceal "–"))
(("then"     @keyword) (#set! conceal "↙"))
(("do"       @keyword) (#set! conceal ""))

(((dot_index_expression) @field (#eq? @field "vim.keymap.set")) (#set! conceal ""))
