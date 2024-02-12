;; config for exwm
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)
;; custom exwm key bindeds
(exwm-input-set-key (kbd "s-d") #'(lambda () (interactive) (call-process "rofi" nil nil nil "-show" "drun" "-show-icons"))) ;; app loncher

(exwm-input-set-key (kbd "s-<return>") #'+vterm/here) ;; lonchis a vterm in the curnit buffer
(require 'clippy)
(defun my-run-clippy-describe-function ()
  "Run clippy-describe-function."
  (clippy-describe-function))

;; Run clippy-describe-function at random intervals between 1 and 10 minutes
(let ((random-interval (* 60 (+ 1 (random 10)))))
  (run-with-timer 0 random-interval 'my-run-clippy-describe-function))

(exwm-input-set-key (kbd "s-o") #'lsp) ;; turns of the lsp
(exwm-input-set-key (kbd "s-c") #'clippy-describe-function) ;; turns of the lsp

(exwm-input-set-key (kbd "s-r") #'doom/reload) ;;reloads my priveait config
(defun my-exwm-kill-buffer ()
  "Kill current X app or buffer."
  (interactive)
  (let ((id (exwm--buffer->id (current-buffer))))
    (if id
        (exwm-manage--kill-client id)
      (kill-buffer (current-buffer)))))
(exwm-input-set-key (kbd "s-q") #'my-exwm-kill-buffer) ;; exits emacs
(exwm-input-set-key (kbd "s-p") #'kill-emacs) ;; exits emacs
;; window spliting
(exwm-input-set-key (kbd "s-a" ) #'split-window-below)
(exwm-input-set-key (kbd "s-s" ) #'split-window-right)

(exwm-input-set-key (kbd "s-b") #'switch-to-buffer) ;; switch buffer/windows
(exwm-input-set-key (kbd "s-g" ) #'display-buffer) ;;display only emacs buffer

;; volume setup with the volume buttons
(defun set-volume (volume)
  "Set the system volume using PulseAudio."
  (shell-command-to-string (format "pactl set-sink-volume@DEFAULT_SINK@ %s" volume)))

(defun increase-volume ()
  "Increase the system volume using PulseAudio."
  (interactive)
  (set-volume "+5%"))

(defun decrease-volume ()
  "Decrease the system volume using PulseAudio."
  (interactive)
  (set-volume "-5%"))

(global-set-key (kbd "<XF86AudioRaiseVolume>") 'increase-volume)
(global-set-key (kbd "<XF86AudioLowerVolume>") 'decrease-volume)

(display-battery-mode)
(display-time)


;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Trevor .L Cox"
      user-mail-address "trevor.cox@mccurtainschools.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-outrun-electric)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
