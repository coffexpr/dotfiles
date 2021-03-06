  )

(use-package go-translate
  :quelpa (go-translate :fetcher github :repo "lorniu/go-translate")
  :custom
  (go-translate-token-current (cons 430675 2721866130)))

(use-package shell
  :hook
  (evil-after-load
   . (lambda () (evil-set-initial-state 'shell-mode 'emacs))))

(use-package counsel-tramp :ensure t)

(defconst my-completion-method 'ivy)

(when (eq my-completion-method 'consult)
  (use-package consult :ensure t
	:bind
	([remap org-set-tags-command] . #'counsel-org-tag)
	([remap find-file] . #'consult-find)
	([remap describe-function] . #'consult-describe-function)
	([remap describe-bindings] . #'consult-descbinds)
	([remap describe-variable] . #'consult-describe-variable)
	([remap imenu] . #'consult-imenu)
	([remap bookmark-jump] . #'consult-bookmark)
	([remap recentf-open-files] . #'consult-recent-file)
	([remap grep-find] .#'consult-ripgrep)
	([remap vc-git-grep] .#'consult-git-grep)

	:config
	;; (defalias 'my-git-find ')
	)

  (use-package consult-ghq :ensure t
	:commands (my-ghq consult-ghq-find consult-ghq-grep)
	:config
	(defalias 'my-ghq 'consult-ghq-find))

  (use-package vertico :ensure t
	:hook (after-init . vertico-mode)
	:custom (vertico-count 20))

  (use-package orderless :ensure t
	:custom (completion-styles '(orderless)))

  (use-package marginalia :ensure t
	:hook (after-init . marginalia-mode))
  )

(when (eq my-completion-method 'ivy)
  (use-package ivy :ensure t
	:diminish ivy-mode
	:hook (after-init . ivy-mode)

	:custom
	(enable-recursive-minibuffers t)
	(ivy-count-format "(%d/%d) ")
	(ivy-use-selectable-prompt t)
	(ivy-use-virtual-buffers t)

	:bind
	(:map ivy-minibuffer-map ([escape] . 'minibuffer-keyboard-quit))
	)

  (use-package all-the-icons-ivy :ensure t
	:hook (after-init . all-the-icons-ivy-setup))

  (use-package ivy-rich :ensure t
	:hook (ivy-mode . ivy-rich-mode)
	)

  (use-package counsel :ensure t
	:after ivy
	:custom
	(counsel-yank-pop-separator "\n-------\n")
	:bind
	("M-x" . counsel-M-x)
	([remap org-set-tags-command] . #'counsel-org-tag)
	([remap find-file] . #'counsel-find-file)
	([remap describe-function] . #'counsel-describe-function)
	([remap describe-bindings] . #'counsel-descbinds)
	([remap describe-variable] . #'counsel-describe-variable)
	([remap imenu] . #'counsel-imenu)
	([remap bookmark-jump] . #'counsel-bookmark)
	([remap recentf-open-files] . #'counsel-recentf)
	([remap grep-find] .#'counsel-rg)
	([remap vc-git-grep] .#'counsel-git-grep)

	:config
	(defalias 'my-git-find 'counsel-git)
	)

  (use-package swiper :ensure t
	:commands (swiper-isearch swiper-isearch-backward)
	;; :bind
	;; evil-search-next(n)が逆向き(N)になる
	;; ([remap evil-search-forward] . #'swiper-isearch)
	;; ([remap evil-search-backward] . #'swiper-isearch-backward)
	)

  (use-package ivy-ghq
	:quelpa (ivy-ghq :fetcher github :repo "analyticd/ivy-ghq")
	:commands (ivy-ghq-open my-ghq)
	:config
	(defalias 'my-ghq 'ivy-ghq-open)
	)

  (use-package wgrep :ensure t)
  )

(use-package diff-hl :ensure t)

(use-package mini-modeilne :ensure t)
