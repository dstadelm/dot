;(require 'highlight-indentation)
;(set-face-background 'highlight-indentation-face "#e3e3d3")
;(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
;(add-hook 'after-change-major-mode-hook 'highlight-indentation-current-column-mode)
(global-linum-mode 1)
(setq linum-format "%d ")
(set-face-attribute 'linum nil :foreground "#444444")
(global-font-lock-mode t) 
(global-set-key "\C-cg" 'goto-line)
(global-set-key [f12] 'goto-line)
(global-set-key "\C-z" 'advertised-undo)
(global-set-key [f1] 'semantic-ia-complete-symbol)
(global-set-key [f2] 'compile)
(global-set-key [f3] 'next-error)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(setq column-number-mode t)
(put 'upcase-region 'disabled nil)
(setq-default ispell-program-name "aspell")
(setq default-truncate-lines t)
(set-background-color "black")
(set-foreground-color "white")
(set-face-background 'region "color-17")
(set-face-foreground 'region "yellow" )
(set-face-foreground 'minibuffer-prompt "yellow")
(show-paren-mode t)
(set-face-background 'show-paren-match-face "color-17")
(set-face-background 'show-paren-mismatch-face "red")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Highlight SCS naming conventions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(c-default-style (quote ((c-mode . "ellemtel") (java-mode . "java") (awk-mode . "awk") (other . "ellemtel"))))
 '(column-number-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(spice-output-local "Gnucap")
 '(spice-simulator "Gnucap")
 '(spice-waveform-viewer "Gwave")
 '(vhdl-clock-name "Clk")
 '(vhdl-clock-rising-edge t)
 '(vhdl-file-header "-----------------------------------------------------------------------------
--  Copyright (c) <year> <company>
--  All rights reserved.
-----------------------------------------------------------------------------
")
 '(vhdl-optional-labels (quote none))
 '(vhdl-reset-kind (quote none))
 '(vhdl-highlight-case-sensitive t)
 '(vhdl-highlight-special-words t)
 '(vhdl-instance-name (quote (".*" . "i_\\&")))
 '(vhdl-reset-active-high t)
 '(vhdl-reset-name "Rst")
 '(vhdl-special-syntax-alist (quote (("signal-clr" "\\<\\(Clr\\|clr\\|CLR\\|Clear\\|clear\\|CLEAR\\)[A-Za-z0-9_]*" "Tomato" "brightred") ("signal-clock" "\\<\\(Clk\\|CLK\\|clk\\|Clock\\|clock\\|CLOCK\\)[A-Za-z0-9_]*" "LimeGreen" "lightseagreen") ("signal-reset" "\\<\\(Rst\\|RST\\|rst\\|Reset\\|RESET\\|reset\\)[A-Za-z0-9_]*" "Tomato" "red3") ("type-definition" "\\<\\w+_[tT]\\>" "aquamarine3" "mediumaquamarine") ("record-definition" "\\<\\w+_[rR]\\>" "magenta2" "magenta2") ("constant" "\\<\\w+_[cC]\\>" "DodgerBlue3" "dodgerblue3") ("generic" "\\<\\w+_[gG]\\>" "DarkOrange" "darkorange") ("instance" "\\<[iI]_\\w+\\>" "Grey50" "gray30"))))
 '(vhdl-underscore-is-part-of-word t)
 '(vhdl-use-direct-instantiation (quote always)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TeX mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
;; (add-hook 'text-mode-hook 'flyspell-mode 1)
;; (eval-after-load "tex-mode" '(fset 'tex-font-lock-suscript 'ignore))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;      Track and Highlight Changes in Filebuffers
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; changes mode always on, but hide initially (would not track changes otherwise)
(global-highlight-changes-mode t)
(setq highlight-changes-visibility-initial-state nil)
;; toggle visibility
(global-set-key (kbd "<f12>")      'highlight-changes-visible-mode)
;; remove the change-highlight in region
(global-set-key (kbd "S-<f12>")    'highlight-changes-remove-highlight)
;; jump to the previous/next change (Alt-PgUp/PgDown)
(global-set-key (kbd "<M-next>") 'highlight-changes-next-change)
(global-set-key (kbd "<M-prior>")  'highlight-changes-previous-change)
;; remove tracked changes after save
(add-hook 'after-save-hook
  '(lambda()
    (if (boundp 'highlight-changes-mode)
      (highlight-changes-remove-highlight (point-min) (point-max)))))

(set-default-font "-*-courier-medium-r-*-*-12-*-*-*-*-*-*-15")
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((nil (:foreground "darkorange"))))
 '(font-lock-keyword-face ((nil (:foreground "lightblue"))))
 '(font-lock-variable-name-face ((nil (:foreground "brightyellow"))))
 '(vhdl-font-lock-instance-face ((((class color) (background light)) (:foreground "#626262"))))
 '(vhdl-font-lock-signal--clr-face ((((class color) (background light)) (:foreground "#aa0000"))))
 '(vhdl-font-lock-signal--reset-face ((nil (:foreground "darkred")))))
