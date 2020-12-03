;; Straight package manager bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Packages list
(straight-use-package 'use-package)

(use-package magit
  :straight t)

(use-package yascroll
  :straight t
  :config
  (setq yascroll:delay-to-hide nil)
  (set-face-attribute 'yascroll:thumb-fringe nil
                      :foreground "#221025"
                      :background "#221025")
  (set-face-attribute 'yascroll:thumb-text-area nil
                      :background "#b25025")
  (global-yascroll-bar-mode t) )

(use-package projectile
  :straight t
  :config
  (projectile-register-project-type
   'amulet '(".amulet")
   :project-file ".amulet"
   :run "amulet run.lua"
   :test-dir "game/test"
   :test "amulet test.lua") )

(use-package love-minor-mode
  :straight t)
    
(use-package helpful
  :straight t)

(use-package hungry-delete
  :straight t
  :config (global-hungry-delete-mode t))

(use-package lua-mode
  :straight t
  :config
  (load-file "~/pr-amulet/amulet.el")
  (amulet-minor-mode t))
