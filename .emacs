(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; C-c <left> and C-c <right> to undo and redo window layout changes
(winner-mode 1)

;; Auto-pair things like quotes, braces, parens, etc.
(electric-pair-mode 1)
(show-paren-mode 1)

;; Automatically notify user and give option to revert when file changes on disk
(global-auto-revert-mode 1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

;; Scroll compilation buffer as it displays output, stopping at the first error
(setq compilation-scroll-output 'first-error)

;; org-mode logs when a task is moved to done.
(setq org-log-done t)

;; Put all backup files in ~/.saves
(setq backup-directory-alist '(("." . "~/.saves/")))

;; Always copy when backing up, instead of moving.
(setq backup-by-copying t)

;; Put auto-save files in ~/.saves
(setq auto-save-file-name-transforms '((".*" "~/.saves/" t)))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package company
  :ensure t
  :hook ((after-init) . global-company-mode)
  :config
  (setq company-idle-delay 0))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

(use-package counsel
  :after ivy
  :ensure t
  :config
  (counsel-mode))

(use-package swiper
  :after ivy
  :ensure t
  :bind ("C-s" . swiper))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-c C-SPC" . ace-jump-mode))

(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
	       '(java-mode . (eglot-eclipse-jdt "jdtls"))) ;; need a special handler for jdtls
  (add-hook 'java-mode-hook #'eglot-ensure)
  (add-hook 'js-mode-hook #'eglot-ensure)
  (add-hook 'python-mode-hook #'eglot-ensure))

(use-package projectile
  :after ivy
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy)
  :bind-keymap ("C-c p" . projectile-command-map))

;; (use-package pdf-tools
;;  :ensure t
;;  :config
;;  (pdf-tools-install)
;;  (add-hook 'pdf-view-mode-hook (lambda ()
;;    			  (display-line-numbers-mode -1))))

(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook
	    (lambda () (setq indent-tabs-mode nil))))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package yaml-mode
  :ensure t)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))

(use-package dracula-theme
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(use-package monokai-theme
  :ensure t)

(use-package gruvbox-theme
  :ensure t)

(put 'upcase-region 'disabled nil)

;; M-j to join lines together
(global-set-key (kbd "M-j") 'join-line)

(enable-theme 'gruvbox)
(set-frame-font "Fira Code 14" nil t)

;; Colorize compilation buffer
(require 'ansi-color)

(defun colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region compilation-filter-start (point))))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "f9aede508e587fe21bcfc0a85e1ec7d27312d9587e686a6f5afdbb0d220eab50" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "d0fe9efeaf9bbb6f42ce08cd55be3f63d4dfcb87601a55e36c3421f2b5dc70f3" default)))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (rust-mode lsp-mode flycheck rjsx-mode spacemacs-theme gruvbox-theme monokai-theme solarized-theme solarized-dark-theme theme zenburn-theme dracula-theme emacs-dracula exec-path-from-shell magit pdf-tools projectile eglot ace-jump-mode counsel ivy company which-key use-package)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(safe-local-variable-values (quote ((sgml-basic-offset . 4)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 16777215)) (:background "#282828" :foreground "#fdf4c1")) (((class color) (min-colors 255)) (:background "#262626" :foreground "#ffffaf")))))
(put 'downcase-region 'disabled nil)
