;; Line numbers in programming and text buffers (replaces old linum-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(column-number-mode 1)                 ; show column in the mode line

;; 80-character limit: vertical guide line at column 80
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Wrapping: soft-wrap long lines in text, hard-wrap with M-q / auto-fill
(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'auto-fill-mode)

;; Spaces instead of tabs, 4 wide
(setq-default indent-tabs-mode nil
              tab-width 4)
(setq c-basic-offset 4) 

;; Recognize OpenFOAM style dictionaries
(add-to-list 'auto-mode-alist
             '("/\\(system\\|constant\\|0\\)/[^/.]+\\'" . c++-mode))

;; Prevent splash screen
(setq inhibit-startup-screen t)
