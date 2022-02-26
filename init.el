(setq inhibit-startup-message t)
    (scroll-bar-mode -1)        ; Disable visible scrollbar
    (tool-bar-mode -1)          ; Disable the toolbar
    (tooltip-mode -1)           ; Disable tooltips
    (set-fringe-mode 10)        ; Give some breathing room
    (menu-bar-mode +1)            ; Disable the menu bar: use -1
    (setq visible-bell t)
    (set-face-attribute 'default nil :font "Source Code Pro" :height 260)
    (load-theme 'leuven)
    (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
    (require 'package)
    (setq package-archives '(("melpa" . "https://melpa.org/packages/")
			     ("org" . "https://orgmode.org/elpa/")
			     ("elpa" . "https://elpa.gnu.org/packages/")))
    (package-initialize)
    (unless package-archive-contents
       (package-refresh-contents))

    ;; Initialize use-package on non-Linux platforms
    (unless (package-installed-p 'use-package)
       (package-install 'use-package))

    (require 'use-package)
    (setq use-package-always-ensure t)

    (use-package command-log-mode)
    (use-package ivy
      :diminish
      :bind (("C-s" . swiper)
	     :map ivy-minibuffer-map
	     ("TAB" . ivy-alt-done)	
	     ("C-l" . ivy-alt-done)
	     ("C-j" . ivy-next-line)
	     ("C-k" . ivy-previous-line)
	     :map ivy-switch-buffer-map
	     ("C-k" . ivy-previous-line)
	     ("C-l" . ivy-done)
	     ("C-d" . ivy-switch-buffer-kill)
	     :map ivy-reverse-i-search-map
	     ("C-k" . ivy-previous-line)
	     ("C-d" . ivy-reverse-i-search-kill))
      :config
      (ivy-mode 1))

    (use-package doom-modeline
      :ensure t
      :init (doom-modeline-mode 1)
      :custom ((doom-modeline-height 5)))

  (setq org-confirm-babel-evaluate nil)

  (use-package auctex
    :defer t
    :ensure t)
  (use-package cdlatex
    :ensure t)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'cdlatex-mode)
  (use-package org-ref)
  (use-package magit)
  (use-package ivy-bibtex)
  (require 'org-ref-ivy)
  (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
	org-ref-insert-cite-function 'org-ref-cite-insert-ivy
	org-ref-insert-label-function 'org-ref-insert-label-link
	org-ref-insert-ref-function 'org-ref-insert-ref-link
	org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))
  (define-key org-mode-map (kbd "C-c )") 'org-ref-insert-ref-link)
  (define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-cite-link)

  (use-package which-key)
  (which-key-mode)
  (which-key-setup-side-window-bottom)





;; Download Evil
(unless (package-installed-p 'evil)
(package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1) ;; use -1 to switch evil-mode off.
