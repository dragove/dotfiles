;;; early-init.el --- Early initialization. -*- lexical-binding: t -*-
(setq package-enable-at-startup nil)
(setq inhibit-default-init nil)
;; Disable startup message
(fset 'display-startup-echo-area-message 'ignore)

;; disable native comp warnings
(setq native-comp-async-report-warnings-errors nil)
;; Set eln-cache dir
(when (boundp 'native-comp-eln-load-path)
  (startup-redirect-eln-cache (expand-file-name "~/.cache/emacs/eln-cache/" user-emacs-directory)))

;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
(setq load-prefer-newer noninteractive)

;; Skipping a bunch of regular expression searching in the =file-name-handler-alist= should improve start time.
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
;;

(setenv "LSP_USE_PLISTS" "true")

(setq gc-cons-threshold 134217728) ;; 128MB
(setq read-process-output-max 1048576) ;; 1MB

;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)

;; disable startup screen and silent bell
(setq ring-bell-function #'ignore
      inhibit-startup-screen t)

;; Prevent instructions on how to close an emacsclient frame.
(setq server-client-instructions nil)

;; disable menu-bar tool-bar scroll-bar stuff
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; start the initial frame maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; start every frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Prevent flashing of unstyled modeline at startup
;; (setq-default mode-line-format nil)

(advice-add #'x-apply-session-resources :override #'ignore)
