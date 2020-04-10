(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; C-c <left> and C-c <right> to undo and redo window layout changes
(winner-mode 1)

;; Auto-pair things like quotes, braces, parens, etc.
(electric-pair-mode 1)
(show-paren-mode 1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

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
 (add-hook 'js-mode-hook #'eglot-ensure))

(use-package projectile
 :after ivy
 :ensure t
 :config
 (projectile-mode)
 (setq projectile-completion-system 'ivy)
 :bind-keymap ("C-c p" . projectile-command-map))

(use-package pdf-tools
 :ensure t
 :config
 (pdf-tools-install)
 (add-hook 'pdf-view-mode-hook (lambda ()
   			  (display-line-numbers-mode -1))))

(use-package magit
 :ensure t
 :bind ("C-x g" . magit-status))

(use-package yaml-mode
 :ensure t)

(put 'upcase-region 'disabled nil)

;; M-j to join lines together
(global-set-key (kbd "M-j") 'join-line)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit pdf-tools projectile eglot ace-jump-mode counsel ivy company which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
