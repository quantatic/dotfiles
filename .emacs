(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

(show-paren-mode 1)

;; Put all backup files in ~/.saves
(setq backup-directory-alist '(("." . "~/.saves/")))

;; Always copy when backing up, instead of moving.
(setq backup-by-copying t)

;; Put auto-save files in ~/.saves
(setq auto-save-file-name-transforms '((".*" "~/.saves/" t)))

(ido-mode 1)

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
  :bind ("C-c SPC" . ace-jump-mode))

(use-package eglot
  :ensure t)
