;;; early-init.el --- Early initialization. -*- lexical-binding: t -*-
(setq package-enable-at-startup nil)
(setq inhibit-default-init nil)

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

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 1)

(defun +gc-after-focus-change ()
  "Run GC when frame loses focus."
  (run-with-idle-timer
   5 nil
   (lambda () (unless (frame-focus-state) (garbage-collect)))))

(defun +reset-init-values ()
  (run-with-idle-timer
   1 nil
   (lambda ()
     (setq file-name-handler-alist default-file-name-handler-alist
           gc-cons-percentage 0.1
           gc-cons-threshold 100000000)
     (message "gc-cons-threshold & file-name-handler-alist restored")
     (when (boundp 'after-focus-change-function)
       (add-function :after after-focus-change-function #'+gc-after-focus-change)))))
(with-eval-after-load 'elpaca
  (add-hook 'elpaca-after-init-hook '+reset-init-values))

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

;; Prevent flashing of unstyled modeline at startup
(setq-default mode-line-format nil)

(set-face-attribute 'default nil :family "FiraCode Nerd Font" :height 160)

(advice-add #'x-apply-session-resources :override #'ignore)
