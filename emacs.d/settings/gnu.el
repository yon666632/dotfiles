;; ------------------
;; 表示類
;; ------------------
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 電池残量を表示する
(display-battery-mode t)

;; 起動時のアレを表示しない
(setq inhibit-startup-message t)
;; ------------------
;; 表示類
;; ------------------
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 電池残量を表示する
(display-battery-mode t)

;; 起動時のアレを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; ツールバー非表示
(tool-bar-mode -1)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; 選択範囲ハイライト
(transient-mark-mode t)

;; 編集行ハイライト
(global-hl-line-mode)

;; 関数名表示
(which-function-mode 1)

;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; 色を付ける
(global-font-lock-mode t)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; モードラインに時間を表示する
(display-time)

;; タブ設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; ===================================================================
;; ショートカット系
;; ===================================================================
;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; Ctrl+Hでバックスペース
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; 選択範囲をインデント
(global-set-key "\C-x\C-i" 'indent-region)

;; C-c c を範囲指定コメントに
(global-set-key "\C-cc" 'comment-region)

;; C-c u を範囲指定コメント解除に
(global-set-key "\C-cu" 'uncomment-region)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; bufferの表示をする
(global-set-key "\C-x\C-b" 'buffer-menu)

;; ===================================================================
;; elipsの設定
;; ===================================================================
;; ;; install-elispの設定
;; ;; まず、install-elisp のコマンドを使える様にします。
;; (require 'install-elisp)
;; ;; 次に、Elisp ファイルをインストールする場所を指定します。
;; (setq install-elisp-repository-directory "~/.emacs.d/")

;; ;; auto-install.elの設定
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)

;; 空白などを表示する
(when (require 'jaspace nil t)
  (when jaspace-modes (append jaspace-modes
                              (list 'lisp-mode
                                    'yaml-mode
                                    'perl-mode
                                    'js2-mode
                                    'javascript-mode
                                    'python-mode
                                    'ruby-mode
                                    'php-mode
                                    'xml-mode
                                    'html-mode
                                    'css-mode
                                    'text-mode
                                    'tt-mode
                                    'fundamental-mode
                                    ))))
(when (boundp 'jaspace-alternate-jaspace-string)
  (setq jaspace-alternate-jaspace-string "□"))
(when (boundp 'jaspace-highlight-tabs)
  (setq jaspace-highlight-tabs ?^))
(add-hook 'jaspace-mode-off-hook
          (lambda()
            (when (boundp 'show-trailing-whitespace)
              (setq show-trailing-whitespace nil))))
(add-hook 'jaspace-mode-hook
          (lambda()
            (progn
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace t))
              (face-spec-set 'jaspace-highlight-jaspace-face
                             '((((class color) (background light))
                                (:foreground "blue"))
                               ;;(t (:foreground "green"))))
                               (t (:foreground "gray32"))))
              (face-spec-set 'jaspace-highlight-tab-face
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t))))
              (face-spec-set 'trailing-whitespace
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t)))))))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

;; ;; auto-async-byte-compile設定
;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ;; hown
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
;; (setq howm-menu-lang 'ja)
;; (require 'howm-mode)

;; ;; JSmode
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; ;; http://8-p.info/emacs-javascript.html
;; (setq-default c-basic-offset 4)
 
;; (when (load "js2" t)
;;   (setq js2-cleanup-whitespace nil
;;         js2-mirror-mode nil
;;         js2-bounce-indent-flag nil)
 
;;   (defun indent-and-back-to-indentation ()
;;     (interactive)
;;     (indent-for-tab-command)
;;     (let ((point-of-indentation
;;            (save-excursion
;;              (back-to-indentation)
;;              (point))))
;;       (skip-chars-forward "\s " point-of-indentation)))
 
;;       (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;       (define-key js2-mode-map "\C-m" nil))

;; ;; zen-coding用
;; (require 'zencoding-mode)
;; (add-hook 'xml-mode-hook 'zencoding-mode)
;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; (add-hook 'html-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "<C-return>") nil)
;; (define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)

;; ;; ===================================================================
;; ;; python専用設定
;; ;; ===================================================================
;; ;; python-mode
;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; ;; auto-complete
;; (require 'auto-complete)
;; (global-auto-complete-mode t)

;; ;;python-mode
;; (add-hook 'python-mode-hook
;;       '(lambda()
;;          (setq indent-tabs-mode t)
;;          (setq indent-level 4)
;;          (setq python-indent 4)
;;          (setq tab-width 4))) 
;; ------------------
;; 表示類
;; ------------------
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 電池残量を表示する
(display-battery-mode t)

;; 起動時のアレを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; ツールバー非表示
(tool-bar-mode -1)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; 選択範囲ハイライト
(transient-mark-mode t)

;; 編集行ハイライト
(global-hl-line-mode)

;; 関数名表示
(which-function-mode 1)

;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; 色を付ける
(global-font-lock-mode t)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; モードラインに時間を表示する
(display-time)

;; タブ設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; ===================================================================
;; ショートカット系
;; ===================================================================
;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; Ctrl+Hでバックスペース
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; 選択範囲をインデント
(global-set-key "\C-x\C-i" 'indent-region)

;; C-c c を範囲指定コメントに
(global-set-key "\C-cc" 'comment-region)

;; C-c u を範囲指定コメント解除に
(global-set-key "\C-cu" 'uncomment-region)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; bufferの表示をする
(global-set-key "\C-x\C-b" 'buffer-menu)

;; ===================================================================
;; elipsの設定
;; ===================================================================
;; ;; install-elispの設定
;; ;; まず、install-elisp のコマンドを使える様にします。
;; (require 'install-elisp)
;; ;; 次に、Elisp ファイルをインストールする場所を指定します。
;; (setq install-elisp-repository-directory "~/.emacs.d/")

;; ;; auto-install.elの設定
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)

;; 空白などを表示する
(when (require 'jaspace nil t)
  (when jaspace-modes (append jaspace-modes
                              (list 'lisp-mode
                                    'yaml-mode
                                    'perl-mode
                                    'js2-mode
                                    'javascript-mode
                                    'python-mode
                                    'ruby-mode
                                    'php-mode
                                    'xml-mode
                                    'html-mode
                                    'css-mode
                                    'text-mode
                                    'tt-mode
                                    'fundamental-mode
                                    ))))
(when (boundp 'jaspace-alternate-jaspace-string)
  (setq jaspace-alternate-jaspace-string "□"))
(when (boundp 'jaspace-highlight-tabs)
  (setq jaspace-highlight-tabs ?^))
(add-hook 'jaspace-mode-off-hook
          (lambda()
            (when (boundp 'show-trailing-whitespace)
              (setq show-trailing-whitespace nil))))
(add-hook 'jaspace-mode-hook
          (lambda()
            (progn
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace t))
              (face-spec-set 'jaspace-highlight-jaspace-face
                             '((((class color) (background light))
                                (:foreground "blue"))
                               ;;(t (:foreground "green"))))
                               (t (:foreground "gray32"))))
              (face-spec-set 'jaspace-highlight-tab-face
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t))))
              (face-spec-set 'trailing-whitespace
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t)))))))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

;; ;; auto-async-byte-compile設定
;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ;; hown
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
;; (setq howm-menu-lang 'ja)
;; (require 'howm-mode)

;; ;; JSmode
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; ;; http://8-p.info/emacs-javascript.html
;; (setq-default c-basic-offset 4)
 
;; (when (load "js2" t)
;;   (setq js2-cleanup-whitespace nil
;;         js2-mirror-mode nil
;;         js2-bounce-indent-flag nil)
 
;;   (defun indent-and-back-to-indentation ()
;;     (interactive)
;;     (indent-for-tab-command)
;;     (let ((point-of-indentation
;;            (save-excursion
;;              (back-to-indentation)
;;              (point))))
;;       (skip-chars-forward "\s " point-of-indentation)))
 
;;       (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;       (define-key js2-mode-map "\C-m" nil))

;; ;; zen-coding用
;; (require 'zencoding-mode)
;; (add-hook 'xml-mode-hook 'zencoding-mode)
;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; (add-hook 'html-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "<C-return>") nil)
;; (define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)

;; ;; ===================================================================
;; ;; python専用設定
;; ;; ===================================================================
;; ;; python-mode
;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; ;; auto-complete
;; (require 'auto-complete)
;; (global-auto-complete-mode t)

;; ;;python-mode
;; (add-hook 'python-mode-hook
;;       '(lambda()
;;          (setq indent-tabs-mode t)
;;          (setq indent-level 4)
;;          (setq python-indent 4)
;;          (setq tab-width 4))) 
;; ------------------
;; 表示類
;; ------------------
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 電池残量を表示する
(display-battery-mode t)

;; 起動時のアレを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; ツールバー非表示
(tool-bar-mode -1)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; 選択範囲ハイライト
(transient-mark-mode t)

;; 編集行ハイライト
(global-hl-line-mode)

;; 関数名表示
(which-function-mode 1)

;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; 色を付ける
(global-font-lock-mode t)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; モードラインに時間を表示する
(display-time)

;; タブ設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; ===================================================================
;; ショートカット系
;; ===================================================================
;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; Ctrl+Hでバックスペース
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))
;; ------------------
;; 表示類
;; ------------------
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 電池残量を表示する
(display-battery-mode t)

;; 起動時のアレを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; ツールバー非表示
(tool-bar-mode -1)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; 選択範囲ハイライト
(transient-mark-mode t)

;; 編集行ハイライト
(global-hl-line-mode)

;; 関数名表示
(which-function-mode 1)

;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; 色を付ける
(global-font-lock-mode t)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; モードラインに時間を表示する
(display-time)

;; タブ設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; ===================================================================
;; ショートカット系
;; ===================================================================
;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; Ctrl+Hでバックスペース
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; 選択範囲をインデント
(global-set-key "\C-x\C-i" 'indent-region)

;; C-c c を範囲指定コメントに
(global-set-key "\C-cc" 'comment-region)

;; C-c u を範囲指定コメント解除に
(global-set-key "\C-cu" 'uncomment-region)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; bufferの表示をする
(global-set-key "\C-x\C-b" 'buffer-menu)

;; ===================================================================
;; elipsの設定
;; ===================================================================
;; ;; install-elispの設定
;; ;; まず、install-elisp のコマンドを使える様にします。
;; (require 'install-elisp)
;; ;; 次に、Elisp ファイルをインストールする場所を指定します。
;; (setq install-elisp-repository-directory "~/.emacs.d/")

;; ;; auto-install.elの設定
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)

;; 空白などを表示する
(when (require 'jaspace nil t)
  (when jaspace-modes (append jaspace-modes
                              (list 'lisp-mode
                                    'yaml-mode
                                    'perl-mode
                                    'js2-mode
                                    'javascript-mode
                                    'python-mode
                                    'ruby-mode
                                    'php-mode
                                    'xml-mode
                                    'html-mode
                                    'css-mode
                                    'text-mode
                                    'tt-mode
                                    'fundamental-mode
                                    ))))
(when (boundp 'jaspace-alternate-jaspace-string)
  (setq jaspace-alternate-jaspace-string "□"))
(when (boundp 'jaspace-highlight-tabs)
  (setq jaspace-highlight-tabs ?^))
(add-hook 'jaspace-mode-off-hook
          (lambda()
            (when (boundp 'show-trailing-whitespace)
              (setq show-trailing-whitespace nil))))
(add-hook 'jaspace-mode-hook
          (lambda()
            (progn
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace t))
              (face-spec-set 'jaspace-highlight-jaspace-face
                             '((((class color) (background light))
                                (:foreground "blue"))
                               ;;(t (:foreground "green"))))
                               (t (:foreground "gray32"))))
              (face-spec-set 'jaspace-highlight-tab-face
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t))))
              (face-spec-set 'trailing-whitespace
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t)))))))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

;; ;; auto-async-byte-compile設定
;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ;; hown
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
;; (setq howm-menu-lang 'ja)
;; (require 'howm-mode)

;; ;; JSmode
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; ;; http://8-p.info/emacs-javascript.html
;; (setq-default c-basic-offset 4)
 
;; (when (load "js2" t)
;;   (setq js2-cleanup-whitespace nil
;;         js2-mirror-mode nil
;;         js2-bounce-indent-flag nil)
 
;;   (defun indent-and-back-to-indentation ()
;;     (interactive)
;;     (indent-for-tab-command)
;;     (let ((point-of-indentation
;;            (save-excursion
;;              (back-to-indentation)
;;              (point))))
;;       (skip-chars-forward "\s " point-of-indentation)))
 
;;       (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;       (define-key js2-mode-map "\C-m" nil))

;; ;; zen-coding用
;; (require 'zencoding-mode)
;; (add-hook 'xml-mode-hook 'zencoding-mode)
;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; (add-hook 'html-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "<C-return>") nil)
;; (define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)

;; ;; ===================================================================
;; ;; python専用設定
;; ;; ===================================================================
;; ;; python-mode
;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; ;; auto-complete
;; (require 'auto-complete)
;; (global-auto-complete-mode t)

;; ;;python-mode
;; (add-hook 'python-mode-hook
;;       '(lambda()
;;          (setq indent-tabs-mode t)
;;          (setq indent-level 4)
;;          (setq python-indent 4)
;;          (setq tab-width 4))) 
;; ------------------
;; 表示類
;; ------------------
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 電池残量を表示する
(display-battery-mode t)

;; 起動時のアレを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; ツールバー非表示
(tool-bar-mode -1)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; 選択範囲ハイライト
(transient-mark-mode t)

;; 編集行ハイライト
(global-hl-line-mode)

;; 関数名表示
(which-function-mode 1)

;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; 色を付ける
(global-font-lock-mode t)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; モードラインに時間を表示する
(display-time)

;; タブ設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; ===================================================================
;; ショートカット系
;; ===================================================================
;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; Ctrl+Hでバックスペース
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; 選択範囲をインデント
(global-set-key "\C-x\C-i" 'indent-region)

;; C-c c を範囲指定コメントに
(global-set-key "\C-cc" 'comment-region)

;; C-c u を範囲指定コメント解除に
(global-set-key "\C-cu" 'uncomment-region)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; bufferの表示をする
(global-set-key "\C-x\C-b" 'buffer-menu)

;; ===================================================================
;; elipsの設定
;; ===================================================================
;; ;; install-elispの設定
;; ;; まず、install-elisp のコマンドを使える様にします。
;; (require 'install-elisp)
;; ;; 次に、Elisp ファイルをインストールする場所を指定します。
;; (setq install-elisp-repository-directory "~/.emacs.d/")

;; ;; auto-install.elの設定
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)

;; 空白などを表示する
(when (require 'jaspace nil t)
  (when jaspace-modes (append jaspace-modes
                              (list 'lisp-mode
                                    'yaml-mode
                                    'perl-mode
                                    'js2-mode
                                    'javascript-mode
                                    'python-mode
                                    'ruby-mode
                                    'php-mode
                                    'xml-mode
                                    'html-mode
                                    'css-mode
                                    'text-mode
                                    'tt-mode
                                    'fundamental-mode
                                    ))))
(when (boundp 'jaspace-alternate-jaspace-string)
  (setq jaspace-alternate-jaspace-string "□"))
(when (boundp 'jaspace-highlight-tabs)
  (setq jaspace-highlight-tabs ?^))
(add-hook 'jaspace-mode-off-hook
          (lambda()
            (when (boundp 'show-trailing-whitespace)
              (setq show-trailing-whitespace nil))))
(add-hook 'jaspace-mode-hook
          (lambda()
            (progn
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace t))
              (face-spec-set 'jaspace-highlight-jaspace-face
                             '((((class color) (background light))
                                (:foreground "blue"))
                               ;;(t (:foreground "green"))))
                               (t (:foreground "gray32"))))
              (face-spec-set 'jaspace-highlight-tab-face
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t))))
              (face-spec-set 'trailing-whitespace
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t)))))))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

;; ;; auto-async-byte-compile設定
;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ;; hown
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
;; (setq howm-menu-lang 'ja)
;; (require 'howm-mode)

;; ;; JSmode
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; ;; http://8-p.info/emacs-javascript.html
;; (setq-default c-basic-offset 4)
 
;; (when (load "js2" t)
;;   (setq js2-cleanup-whitespace nil
;;         js2-mirror-mode nil
;;         js2-bounce-indent-flag nil)
 
;;   (defun indent-and-back-to-indentation ()
;;     (interactive)
;;     (indent-for-tab-command)
;;     (let ((point-of-indentation
;;            (save-excursion
;;              (back-to-indentation)
;;              (point))))
;;       (skip-chars-forward "\s " point-of-indentation)))
 
;;       (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;       (define-key js2-mode-map "\C-m" nil))

;; ;; zen-coding用
;; (require 'zencoding-mode)
;; (add-hook 'xml-mode-hook 'zencoding-mode)
;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; (add-hook 'html-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "<C-return>") nil)
;; (define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)

;; ;; ===================================================================
;; ;; python専用設定
;; ;; ===================================================================
;; ;; python-mode
;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; ;; auto-complete
;; (require 'auto-complete)
;; (global-auto-complete-mode t)

;; ;;python-mode
;; (add-hook 'python-mode-hook
;;       '(lambda()
;;          (setq indent-tabs-mode t)
;;          (setq indent-level 4)
;;          (setq python-indent 4)
;;          (setq tab-width 4))) 
;; ------------------
;; 表示類
;; ------------------
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 電池残量を表示する
(display-battery-mode t)

;; 起動時のアレを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; ツールバー非表示
(tool-bar-mode -1)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; 選択範囲ハイライト
(transient-mark-mode t)

;; 編集行ハイライト
(global-hl-line-mode)

;; 関数名表示
(which-function-mode 1)

;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; 色を付ける
(global-font-lock-mode t)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; モードラインに時間を表示する
(display-time)

;; タブ設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; ===================================================================
;; ショートカット系
;; ===================================================================
;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; Ctrl+Hでバックスペース
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; 選択範囲をインデント
(global-set-key "\C-x\C-i" 'indent-region)

;; C-c c を範囲指定コメントに
(global-set-key "\C-cc" 'comment-region)

;; C-c u を範囲指定コメント解除に
(global-set-key "\C-cu" 'uncomment-region)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; bufferの表示をする
(global-set-key "\C-x\C-b" 'buffer-menu)

;; ===================================================================
;; elipsの設定
;; ===================================================================
;; ;; install-elispの設定
;; ;; まず、install-elisp のコマンドを使える様にします。
;; (require 'install-elisp)
;; ;; 次に、Elisp ファイルをインストールする場所を指定します。
;; (setq install-elisp-repository-directory "~/.emacs.d/")

;; ;; auto-install.elの設定
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)

;; 空白などを表示する
(when (require 'jaspace nil t)
  (when jaspace-modes (append jaspace-modes
                              (list 'lisp-mode
                                    'yaml-mode
                                    'perl-mode
                                    'js2-mode
                                    'javascript-mode
                                    'python-mode
                                    'ruby-mode
                                    'php-mode
                                    'xml-mode
                                    'html-mode
                                    'css-mode
                                    'text-mode
                                    'tt-mode
                                    'fundamental-mode
                                    ))))
(when (boundp 'jaspace-alternate-jaspace-string)
  (setq jaspace-alternate-jaspace-string "□"))
(when (boundp 'jaspace-highlight-tabs)
  (setq jaspace-highlight-tabs ?^))
(add-hook 'jaspace-mode-off-hook
          (lambda()
            (when (boundp 'show-trailing-whitespace)
              (setq show-trailing-whitespace nil))))
(add-hook 'jaspace-mode-hook
          (lambda()
            (progn
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace t))
              (face-spec-set 'jaspace-highlight-jaspace-face
                             '((((class color) (background light))
                                (:foreground "blue"))
                               ;;(t (:foreground "green"))))
                               (t (:foreground "gray32"))))
              (face-spec-set 'jaspace-highlight-tab-face
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t))))
              (face-spec-set 'trailing-whitespace
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t)))))))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

;; ;; auto-async-byte-compile設定
;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ;; hown
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
;; (setq howm-menu-lang 'ja)
;; (require 'howm-mode)

;; ;; JSmode
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; ;; http://8-p.info/emacs-javascript.html
;; (setq-default c-basic-offset 4)
 
;; (when (load "js2" t)
;;   (setq js2-cleanup-whitespace nil
;;         js2-mirror-mode nil
;;         js2-bounce-indent-flag nil)
 
;;   (defun indent-and-back-to-indentation ()
;;     (interactive)
;;     (indent-for-tab-command)
;;     (let ((point-of-indentation
;;            (save-excursion
;;              (back-to-indentation)
;;              (point))))
;;       (skip-chars-forward "\s " point-of-indentation)))
 
;;       (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;       (define-key js2-mode-map "\C-m" nil))

;; ;; zen-coding用
;; (require 'zencoding-mode)
;; (add-hook 'xml-mode-hook 'zencoding-mode)
;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; (add-hook 'html-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "<C-return>") nil)
;; (define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)

;; ;; ===================================================================
;; ;; python専用設定
;; ;; ===================================================================
;; ;; python-mode
;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; ;; auto-complete
;; (require 'auto-complete)
;; (global-auto-complete-mode t)

;; ;;python-mode
;; (add-hook 'python-mode-hook
;;       '(lambda()
;;          (setq indent-tabs-mode t)
;;          (setq indent-level 4)
;;          (setq python-indent 4)
;;          (setq tab-width 4))) 
;; ------------------
;; 表示類
;; ------------------
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 電池残量を表示する
(display-battery-mode t)

;; 起動時のアレを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; ツールバー非表示
(tool-bar-mode -1)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; 選択範囲ハイライト
(transient-mark-mode t)

;; 編集行ハイライト
(global-hl-line-mode)

;; 関数名表示
(which-function-mode 1)

;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; 色を付ける
(global-font-lock-mode t)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; モードラインに時間を表示する
(display-time)

;; タブ設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; ===================================================================
;; ショートカット系
;; ===================================================================
;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; Ctrl+Hでバックスペース
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; 選択範囲をインデント
(global-set-key "\C-x\C-i" 'indent-region)

;; C-c c を範囲指定コメントに
(global-set-key "\C-cc" 'comment-region)

;; C-c u を範囲指定コメント解除に
(global-set-key "\C-cu" 'uncomment-region)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; bufferの表示をする
(global-set-key "\C-x\C-b" 'buffer-menu)

;; ===================================================================
;; elipsの設定
;; ===================================================================
;; ;; install-elispの設定
;; ;; まず、install-elisp のコマンドを使える様にします。
;; (require 'install-elisp)
;; ;; 次に、Elisp ファイルをインストールする場所を指定します。
;; (setq install-elisp-repository-directory "~/.emacs.d/")

;; ;; auto-install.elの設定
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)

;; 空白などを表示する
(when (require 'jaspace nil t)
  (when jaspace-modes (append jaspace-modes
                              (list 'lisp-mode
                                    'yaml-mode
                                    'perl-mode
                                    'js2-mode
                                    'javascript-mode
                                    'python-mode
                                    'ruby-mode
                                    'php-mode
                                    'xml-mode
                                    'html-mode
                                    'css-mode
                                    'text-mode
                                    'tt-mode
                                    'fundamental-mode
                                    ))))
(when (boundp 'jaspace-alternate-jaspace-string)
  (setq jaspace-alternate-jaspace-string "□"))
(when (boundp 'jaspace-highlight-tabs)
  (setq jaspace-highlight-tabs ?^))
(add-hook 'jaspace-mode-off-hook
          (lambda()
            (when (boundp 'show-trailing-whitespace)
              (setq show-trailing-whitespace nil))))
(add-hook 'jaspace-mode-hook
          (lambda()
            (progn
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace t))
              (face-spec-set 'jaspace-highlight-jaspace-face
                             '((((class color) (background light))
                                (:foreground "blue"))
                               ;;(t (:foreground "green"))))
                               (t (:foreground "gray32"))))
              (face-spec-set 'jaspace-highlight-tab-face
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t))))
              (face-spec-set 'trailing-whitespace
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t)))))))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

;; ;; auto-async-byte-compile設定
;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ;; hown
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
;; (setq howm-menu-lang 'ja)
;; (require 'howm-mode)

;; ;; JSmode
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; ;; http://8-p.info/emacs-javascript.html
;; (setq-default c-basic-offset 4)
 
;; (when (load "js2" t)
;;   (setq js2-cleanup-whitespace nil
;;         js2-mirror-mode nil
;;         js2-bounce-indent-flag nil)
 
;;   (defun indent-and-back-to-indentation ()
;;     (interactive)
;;     (indent-for-tab-command)
;;     (let ((point-of-indentation
;;            (save-excursion
;;              (back-to-indentation)
;;              (point))))
;;       (skip-chars-forward "\s " point-of-indentation)))
 
;;       (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;       (define-key js2-mode-map "\C-m" nil))

;; ;; zen-coding用
;; (require 'zencoding-mode)
;; (add-hook 'xml-mode-hook 'zencoding-mode)
;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; (add-hook 'html-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "<C-return>") nil)
;; (define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)

;; ;; ===================================================================
;; ;; python専用設定
;; ;; ===================================================================
;; ;; python-mode
;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; ;; auto-complete
;; (require 'auto-complete)
;; (global-auto-complete-mode t)

;; ;;python-mode
;; (add-hook 'python-mode-hook
;;       '(lambda()
;;          (setq indent-tabs-mode t)
;;          (setq indent-level 4)
;;          (setq python-indent 4)
;;          (setq tab-width 4))) 

;; 選択範囲をインデント
(global-set-key "\C-x\C-i" 'indent-region)

;; C-c c を範囲指定コメントに
(global-set-key "\C-cc" 'comment-region)

;; C-c u を範囲指定コメント解除に
(global-set-key "\C-cu" 'uncomment-region)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; bufferの表示をする
(global-set-key "\C-x\C-b" 'buffer-menu)

;; ===================================================================
;; elipsの設定
;; ===================================================================
;; ;; install-elispの設定
;; ;; まず、install-elisp のコマンドを使える様にします。
;; (require 'install-elisp)
;; ;; 次に、Elisp ファイルをインストールする場所を指定します。
;; (setq install-elisp-repository-directory "~/.emacs.d/")

;; ;; auto-install.elの設定
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)

;; 空白などを表示する
(when (require 'jaspace nil t)
  (when jaspace-modes (append jaspace-modes
                              (list 'lisp-mode
                                    'yaml-mode
                                    'perl-mode
                                    'js2-mode
                                    'javascript-mode
                                    'python-mode
                                    'ruby-mode
                                    'php-mode
                                    'xml-mode
                                    'html-mode
                                    'css-mode
                                    'text-mode
                                    'tt-mode
                                    'fundamental-mode
                                    ))))
(when (boundp 'jaspace-alternate-jaspace-string)
  (setq jaspace-alternate-jaspace-string "□"))
(when (boundp 'jaspace-highlight-tabs)
  (setq jaspace-highlight-tabs ?^))
(add-hook 'jaspace-mode-off-hook
          (lambda()
            (when (boundp 'show-trailing-whitespace)
              (setq show-trailing-whitespace nil))))
(add-hook 'jaspace-mode-hook
          (lambda()
            (progn
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace t))
              (face-spec-set 'jaspace-highlight-jaspace-face
                             '((((class color) (background light))
                                (:foreground "blue"))
                               ;;(t (:foreground "green"))))
                               (t (:foreground "gray32"))))
              (face-spec-set 'jaspace-highlight-tab-face
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t))))
              (face-spec-set 'trailing-whitespace
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t)))))))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

;; ;; auto-async-byte-compile設定
;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ;; hown
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
;; (setq howm-menu-lang 'ja)
;; (require 'howm-mode)

;; ;; JSmode
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; ;; http://8-p.info/emacs-javascript.html
;; (setq-default c-basic-offset 4)
 
;; (when (load "js2" t)
;;   (setq js2-cleanup-whitespace nil
;;         js2-mirror-mode nil
;;         js2-bounce-indent-flag nil)
 
;;   (defun indent-and-back-to-indentation ()
;;     (interactive)
;;     (indent-for-tab-command)
;;     (let ((point-of-indentation
;;            (save-excursion
;;              (back-to-indentation)
;;              (point))))
;;       (skip-chars-forward "\s " point-of-indentation)))
 
;;       (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;       (define-key js2-mode-map "\C-m" nil))

;; ;; zen-coding用
;; (require 'zencoding-mode)
;; (add-hook 'xml-mode-hook 'zencoding-mode)
;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; (add-hook 'html-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "<C-return>") nil)
;; (define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)

;; ;; ===================================================================
;; ;; python専用設定
;; ;; ===================================================================
;; ;; python-mode
;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; ;; auto-complete
;; (require 'auto-complete)
;; (global-auto-complete-mode t)

;; ;;python-mode
;; (add-hook 'python-mode-hook
;;       '(lambda()
;;          (setq indent-tabs-mode t)
;;          (setq indent-level 4)
;;          (setq python-indent 4)
;;          (setq tab-width 4))) 

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; ツールバー非表示
(tool-bar-mode -1)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; 選択範囲ハイライト
(transient-mark-mode t)

;; 編集行ハイライト
(global-hl-line-mode)

;; 関数名表示
(which-function-mode 1)

;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; 色を付ける
(global-font-lock-mode t)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; モードラインに時間を表示する
(display-time)

;; タブ設定
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; ===================================================================
;; ショートカット系
;; ===================================================================
;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; Ctrl+Hでバックスペース
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; 選択範囲をインデント
(global-set-key "\C-x\C-i" 'indent-region)

;; C-c c を範囲指定コメントに
(global-set-key "\C-cc" 'comment-region)

;; C-c u を範囲指定コメント解除に
(global-set-key "\C-cu" 'uncomment-region)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; bufferの表示をする
(global-set-key "\C-x\C-b" 'buffer-menu)

;; ===================================================================
;; elipsの設定
;; ===================================================================
;; ;; install-elispの設定
;; ;; まず、install-elisp のコマンドを使える様にします。
;; (require 'install-elisp)
;; ;; 次に、Elisp ファイルをインストールする場所を指定します。
;; (setq install-elisp-repository-directory "~/.emacs.d/")

;; ;; auto-install.elの設定
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)

;; 空白などを表示する
(when (require 'jaspace nil t)
  (when jaspace-modes (append jaspace-modes
                              (list 'lisp-mode
                                    'yaml-mode
                                    'perl-mode
                                    'js2-mode
                                    'javascript-mode
                                    'python-mode
                                    'ruby-mode
                                    'php-mode
                                    'xml-mode
                                    'html-mode
                                    'css-mode
                                    'text-mode
                                    'tt-mode
                                    'fundamental-mode
                                    ))))
(when (boundp 'jaspace-alternate-jaspace-string)
  (setq jaspace-alternate-jaspace-string "□"))
(when (boundp 'jaspace-highlight-tabs)
  (setq jaspace-highlight-tabs ?^))
(add-hook 'jaspace-mode-off-hook
          (lambda()
            (when (boundp 'show-trailing-whitespace)
              (setq show-trailing-whitespace nil))))
(add-hook 'jaspace-mode-hook
          (lambda()
            (progn
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace t))
              (face-spec-set 'jaspace-highlight-jaspace-face
                             '((((class color) (background light))
                                (:foreground "blue"))
                               ;;(t (:foreground "green"))))
                               (t (:foreground "gray32"))))
              (face-spec-set 'jaspace-highlight-tab-face
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t))))
              (face-spec-set 'trailing-whitespace
                             '((((class color) (background light))
                                (:foreground "red"
                                             :background "unspecified"
                                             :strike-through nil
                                             :underline t))
                               ;;(t (:foreground "purple"
                               (t (:foreground "gray16"
                                               :background "unspecified"
                                               :strike-through nil
                                               :underline t)))))))

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)

;; ;; auto-async-byte-compile設定
;; (require 'auto-async-byte-compile)
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; ;; hown
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/howm/")
;; (setq howm-menu-lang 'ja)
;; (require 'howm-mode)

;; ;; JSmode
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; ;; http://8-p.info/emacs-javascript.html
;; (setq-default c-basic-offset 4)
 
;; (when (load "js2" t)
;;   (setq js2-cleanup-whitespace nil
;;         js2-mirror-mode nil
;;         js2-bounce-indent-flag nil)
 
;;   (defun indent-and-back-to-indentation ()
;;     (interactive)
;;     (indent-for-tab-command)
;;     (let ((point-of-indentation
;;            (save-excursion
;;              (back-to-indentation)
;;              (point))))
;;       (skip-chars-forward "\s " point-of-indentation)))
 
;;       (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;       (define-key js2-mode-map "\C-m" nil))

;; ;; zen-coding用
;; (require 'zencoding-mode)
;; (add-hook 'xml-mode-hook 'zencoding-mode)
;; (add-hook 'sgml-mode-hook 'zencoding-mode)
;; (add-hook 'html-mode-hook 'zencoding-mode)
;; (define-key zencoding-mode-keymap (kbd "<C-return>") nil)
;; (define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)

;; ;; ===================================================================
;; ;; python専用設定
;; ;; ===================================================================
;; ;; python-mode
;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; ;; auto-complete
;; (require 'auto-complete)
;; (global-auto-complete-mode t)

;; ;;python-mode
;; (add-hook 'python-mode-hook
;;       '(lambda()
;;          (setq indent-tabs-mode t)
;;          (setq indent-level 4)
;;          (setq python-indent 4)
;;          (setq tab-width 4))) 