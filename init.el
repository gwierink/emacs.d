;;; init.el --- Personal Emacs configuration  -*- lexical-binding: t -*-

;;; Package setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;; Check whether package is installed, if not, install it
(setq use-package-always-ensure t)

;;; Keep ~/.emacs.d clean
(use-package no-littering
  :config
  (no-littering-theme-backups)
  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  (when (file-exists-p custom-file) (load custom-file)))

;;; Prevent splash screen
(setq inhibit-startup-screen t)

;;; Line numbers in programming and text buffers (replaces old linum-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(column-number-mode 1)                 ; show column in the mode line

;;; 80-character limit: vertical guide line at column 80
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;;; Wrapping: soft-wrap long lines in text, hard-wrap with M-q / auto-fill
;;(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'auto-fill-mode)

;;; Spaces instead of tabs, 4 wide
(setq-default indent-tabs-mode nil
              tab-width 4)
(setq c-basic-offset 4) 

;;; Recognize OpenFOAM style dictionaries
(add-to-list 'auto-mode-alist
             '("/\\(system\\|constant\\|0\\(\\.orig\\)?\\)/[^/.]+\\'" . c++-mode))

;;; Show trailing whitespace in code (keeps git diffs clean)
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))
(setq require-final-newline t)

;;; Remember minibuffer history and recent files across sessions
(use-package savehist :ensure nil :init (savehist-mode 1))
(use-package recentf  :ensure nil :init (recentf-mode 1))

;;; Git
(use-package magit
  :bind ("C-x g" . magit-status))

;;; Machine-specific settings, not tracked in git
(let ((local (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local) (load local)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit no-littering)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
