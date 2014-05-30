;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;; ===================================================================
;; 初期設定系
;; ===================================================================
;; ------------------
;; base類
;; ------------------
;; ロードパス
(setq load-path (cons "~/.emacs.d/" load-path))
;; ウィンドウ設定
(if window-system (progn
  ;; (setq initial-frame-alist '((width . 175) (height . 47) (top . 0)))
  (set-background-color "Black")
  (set-foreground-color "White")
  (set-cursor-color "Gray")))

;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

(add-to-list 'exec-path "/usr/local/bin/" "/usr/bin")

;; Command-Key and Option-Key
;; (setq ns-command-modifier (quote meta))
;; (setq ns-alternate-modifier (quote super))

;; (set-language-environment "Japanese")
;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-buffer-file-coding-system 'utf-8)

(defvar is-mac (or (eq window-system 'mac) (featurep 'ns)))

(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(cond
 (is-mac
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs)
  )
 (t
  (setq file-name-coding-system 'utf-8)
  (setq locale-coding-system 'utf-8)
  )
 )

;; ------------------
;; 表示類
;; ------------------
;; 左に行番号を表示する
(global-linum-mode t)

;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 起動時のアレを表示しない
(setq inhibit-startup-message t)

;; scratchになにも出さない
(setq initial-scratch-message "")

;; ツールバー非表示
(tool-bar-mode -1)

;; 表示までの秒数。初期値は0.125
(setq show-paren-delay 0)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; parenのスタイル: expressionは括弧内も強調表示
(setq show-paren-style 'expression)

;; 選択範囲ハイライト
(transient-mark-mode t)

;; 編集行ハイライト
(defface my-hl-line-face
  ;; 背景がdarkならば背景色を紺に
  '((((class color) (background dark))
     (:background "DarkMagenta" t))
    ;; 背景がlightならば背景色を緑に
    (((class color) (background light))
     (:background "LightGoldenrodYellow" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; 関数名表示
(which-function-mode 1)

;; 色を付ける
(global-font-lock-mode t)

;; カーソルの点滅を止める
(blink-cursor-mode 0)

;; モードラインに時間を表示する
(display-time)

;; リージョン内の行数と文字数をモードラインに表示する（範囲指定時のみ）
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375


(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))

(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;; ------------------
;; 入力/入力補助類
;; ------------------
;; タブ設定
;; TABの表示幅
(setq-default tab-width 4)
;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)
;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;;; 行の折り返しをしない
(setq truncate-lines t)
(setq truncate-partial-width-windows t)

;;; フォントの設定
(set-face-attribute 'default nil
            :family "Ricty" ;; font
            :height 180)    ;; font size
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Ricty")) ;; font

;; リージョンで削除
(delete-selection-mode t)
(put 'downcase-region 'disabled t)

;; カスタム設定
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-by-moving-to-trash t) ;; 消したらゴミ箱へ
 '(trash-directory "~/.Trash")
 '(js3-indent-level 2))  ;; jsならindentは2

;; コメントアウトをしてくれる
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)

;; *scratch*を消さない
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    ;; "*scratch*" を作成して buffer-list に放り込む
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
                   (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
          ((= arg 1) (message "another *scratch* is created")))))

(add-hook 'kill-buffer-query-functions
          ;; *scratch* バッファで kill-buffer したら内容を消去するだけにする
          (lambda ()
            (if (string= "*scratch*" (buffer-name))
                (progn (my-make-scratch 0) nil)
              t)))

(add-hook 'after-save-hook
          ;; *scratch* バッファの内容を保存したら *scratch* バッファを新しく作る
          (lambda ()
            (unless (member (get-buffer "*scratch*") (buffer-list))
              (my-make-scratch 1))))

;; ===================================================================
;; ショートカット系
;; ===================================================================
;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; Ctrl+Hでバックスペース
(load "term/bobcat")
(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;; ;; 選択範囲をインデント
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
;; その他
;; ===================================================================
;; バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; オートセーブファイル作成までの秒間隔
(setq auto-save-timeout 15)
;; オートセーブファイル作成までのタイプ間隔
(setq auto-save-interval 60)

;; ===================================================================
;; elipsの設定
;; ===================================================================
;; cl
 (require 'cl)

(when (and (>= emacs-major-version 23)
           (require 'whitespace nil t))
  (setq whitespace-style
        '(face
          tabs spaces newline trailing space-before-tab space-after-tab
          space-mark tab-mark newline-mark))
  (let ((dark (eq 'dark (frame-parameter nil 'background-mode))))
    (set-face-attribute 'whitespace-space nil
                        :foreground (if dark "pink4" "azure3")
                        :background 'unspecified)
    (set-face-attribute 'whitespace-tab nil
                        :foreground (if dark "gray20" "gray80")
                        :background 'unspecified
                        :strike-through t)
    (set-face-attribute 'whitespace-newline nil
                        :foreground (if dark "darkcyan" "darkseagreen")))
  (setq whitespace-space-regexp "\\(　+\\)")
  (setq whitespace-display-mappings
        '((space-mark   ?\xA0  [?\xA4]  [?_]) ; hard space - currency
          (space-mark   ?\x8A0 [?\x8A4] [?_]) ; hard space - currency
          (space-mark   ?\x920 [?\x924] [?_]) ; hard space - currency
          (space-mark   ?\xE20 [?\xE24] [?_]) ; hard space - currency
          (space-mark   ?\xF20 [?\xF24] [?_]) ; hard space - currency
          (space-mark   ?　    [?□]    [?＿]) ; full-width space - square
          (newline-mark ?\n    [?\xAB ?\n])   ; eol - right quote mark
          ))
  (setq whitespace-global-modes '(not dired-mode tar-mode))
  (global-whitespace-mode 1))

;; 自動補完
(add-to-list 'load-path "~/.emacs.d/elisp/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;; howm
;; howmメモ保存の場所
(setq howm-menu-lang 'ja)
(require 'howm)
(setq howm-directory (concat user-emacs-directory "howm"))
;; howm-menuの言語を日本語に
;; howmメモを1日1ファイルにする
; (setq howm-file-name-format "%Y/%m/%Y-%m-%d.howm")
;; howm-modeを読み込む
(when (require 'howm-mode nil t)
  ;; C-c,,でhowm-menuを起動
  (setq howm-menu-lang 'ja)
  (define-key global-map (kbd "C-c ,,") 'howm-menu)
  (autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)
)
;; howmメモを保存と同時に閉じる
(defun howm-save-buffer-and-kill ()
  "howmメモを保存と同時に閉じます。"
  (interactive)
  (when (and (buffer-file-name)
             (string-match "\\.howm" (buffer-file-name)))
    (save-buffer)
    (kill-buffer nil)))

;; ;; C-c C-cでメモの保存と同時にバッファを閉じる
;; (define-key howm-mode-map (kbd "C-c C-c") 'howm-save-buffer-and-kill)

;;elpaの設定
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; undo-tree
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; ;; grep-edit
;; (require 'grep-edit)

;; ;; wgrep
;; (require 'wgrep nil t)

;; 矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; 変なキーバインド禁止

;; magit
(require 'magit)

;; ag
(require 'ag)
(setq ag-highlight-search t)


;; ===================================================================
;; コーディング用設定
;; ===================================================================
(require 'ucs-normalize)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)
(setq system-uses-terminfo nil)

;; -------------------------
;; python
;; ------------------------
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
;; ;; python-mode
;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; ;; 括弧の補完
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (define-key python-mode-map "\"" 'electric-pair)
;;             (define-key python-mode-map "\'" 'electric-pair)
;;             (define-key python-mode-map "(" 'electric-pair)
;;             (define-key python-mode-map "[" 'electric-pair)
;;             (define-key python-mode-map "{" 'electric-pair)))
;; (defun electric-pair ()
;;   "Insert character pair without sournding spaces"
;;   (interactive)
;;   (let (parens-require-spaces)
;;     (insert-pair)))

;; ;; ac-python
;; (require 'ac-python) 
;; (add-hook 'python-mode-hook '(lambda () 
;;      (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; ;; flymake for python
;; (add-hook 'pytho-mode-hook
;;   '(lambda ()
;;     (add-hook 'find-file-hook 'flymake-find-file-hook)
;;     (when (load "flymake" t)
;;       (defun flymake-pyflakes-init ()
;;         (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                            'flymake-create-temp-inplace))
;;                (local-file (file-relative-name
;;                             temp-file
;;                             (file-name-directory buffer-file-name))))
;;           (list "~/.emacs.d/pycheckers"  (list local-file))))
;;       (add-to-list 'flymake-allowed-file-name-masks
;;                    '("\\.py\\'" flymake-pyflakes-init)))
;;     (load-library "flymake-cursor")
;;     (global-set-key [f10] 'flymake-goto-prev-error)
;;     (global-set-key [f11] 'flymake-goto-next-error)
;;   )
;; )

;; -------------------------
;; perl
;; ------------------------
(autoload 'cperl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\|t\\|cgi\\|psgi\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(require 'perlbrew)
(perlbrew-switch "perl-5.16.3")

;; perl-modeをcperl-modeのエイリアスにする
(defalias 'perl-mode 'cperl-mode)

;; cperl-modeのインデント設定
(setq cperl-indent-level 4 ; インデント幅を4にする
      cperl-continued-statement-offset 4 ; 継続する文のオフセット※
      cperl-brace-offset -4 ; ブレースのオフセット
      cperl-label-offset -4 ; labelのオフセット
      cperl-indent-parens-as-block t ; 括弧もブロックとしてインデント
      cperl-close-paren-offset -4 ; 閉じ括弧のオフセット
      cperl-tab-always-indent t ; TABをインデントにする
      cperl-highlight-variables-indiscriminately t) ; スカラを常にハイライトする

;; perl-completionの設定
(defun perl-completion-hook ()
  (when (require 'perl-completion nil t)
    (perl-completion-mode t)
    (when (require 'auto-complete nil t)
      (auto-complete-mode t)
      (make-variable-buffer-local 'ac-sources)
      (setq ac-sources
            '(ac-source-perl-completion)))))

(add-hook 'cperl-mode-hook
          (lambda ()
            (define-key cperl-mode-map "\"" 'electric-pair)
            (define-key cperl-mode-map "\'" 'electric-pair)
            (define-key cperl-mode-map "(" 'electric-pair)
            (define-key cperl-mode-map "[" 'electric-pair)
            (define-key cperl-mode-map "{" 'electric-pair)))

(add-hook  'cperl-mode-hook 'perl-completion-hook)

;; -------------------------
;; JSX
;; ------------------------
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

;; -------------------------
;; JS
;; ------------------------
(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
