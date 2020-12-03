(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
(cd "~/elegant-emacs")
(load-file "~/elegant-emacs/init.el")
(load-file "~/elegant-emacs/scroll.el")
;; Packages initialized now
(pdf-tools-install)

