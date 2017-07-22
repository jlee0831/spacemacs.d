(defconst aj-typescript-packages
  '(
    add-node-modules-path
    rjsx-mode
    ))

(setq typescript-indent-level 2)

(with-eval-after-load 'tide
  (spacemacs/set-leader-keys-for-minor-mode 'tide-mode "f" #'tide-fix))

(defun aj-javascript/post-init-add-node-modules-path ()
  (with-eval-after-load 'rjsx-mode
    (add-hook 'rjsx-mode-hook #'add-node-modules-path)))

(defun aj-javascript/init-rjsx-mode ()
  (use-package rjsx-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

      (setq
       js2-mode-show-strict-warnings nil
       js2-mode-show-parse-errors nil
       js-indent-level 2
       js2-basic-offset 2
       js2-strict-trailing-comma-warning nil
       js2-strict-missing-semi-warning nil)

      (advice-add #'js-jsx-indent-line
                  :after
                  #'aj-javascript/js-jsx-indent-line-align-closing-bracket)
      (add-hook 'rjsx-mode-hook #'aj-javascript/eslintd-set-flycheck-executable t))
    :config
    (modify-syntax-entry ?_ "w" js2-mode-syntax-table)))
