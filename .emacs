(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)

(scroll-bar-mode -1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

(show-paren-mode 1)

(setq backup-directory-alist '(("." . "~/.saves")))
(setq auto-save-file-name-transforms '(("." "~/.saves" t)))

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
	     :config (which-key-mode))
