(defconst aj-typescript-packages
  '(
    rjsx-mode
    ))

(setq typescript-indent-level 2)

(with-eval-after-load 'tide
  (spacemacs/set-leader-keys-for-minor-mode 'tide-mode "f" #'tide-fix))
