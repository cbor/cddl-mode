(provide 'cddl-mode)

(defun cddl-comment-dwim (arg)
  "Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
  (interactive "*P")
  (require 'newcomment)
  (let (
	(comment-start ";") (comment-end "")
	)
    (comment-dwim arg)))

;; keywords for syntax coloring
(setq cddl-keywords
      `(
	( "\\(.+\\) \=" 1 font-lock-keyword-face)
;        ( ,(regexp-opt '("Sin" "Cos" "Sum") 'word) . font-lock-function-name-face)
;        ( ,(regexp-opt '("Pi" "Infinity") 'word) . font-lock-constant-face)
        )
      )


(defvar cddl-syntax-table nil "Syntax table for cddl-mode")
(setq cddl-syntax-table
      (let ((synTable (make-syntax-table)))

	(modify-syntax-entry ?\; "< b" synTable)
	(modify-syntax-entry ?\n "> b" synTable)

	synTable))

(define-derived-mode cddl-mode fundamental-mode
  "CDDL mode is a major mode for editing CDDL files."
  :syntax-table cddl-syntax-table

  (setq font-lock-defaults '(cddl-keywords))
  (setq mode-name "cddl")

  (setq indent-tabs-mode nil)
  (define-key cddl-mode-map [remap comment-dwim] 'cddl-comment-dwim)
)
