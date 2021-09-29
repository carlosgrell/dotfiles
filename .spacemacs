;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     lua
     python
     neotree
     docker
     octave
     html
     javascript
     yaml
     elixir
     csharp
     evil-commentary
     ruby
     react
     themes-megapack
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     osx
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; dotspacemacs-additional-packages '(all-the-icons)
   dotspacemacs-additional-packages '(prettier-js all-the-icons memoize spaceline-all-the-icons zerodark-theme)
   ;; dotspacemacs-additional-packages '(pretty-mode)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(company-tern flycheck-mix tern)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (set-keyboard-coding-system 'utf-8)
  (setq ruby-insert-encoding-magic-comment nil)
  (setq-default evil-escape-key-sequence "jk")

  (global-linum-mode t)
  ;; Scrolling
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil)
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; dotspacemacs-default-font '(("Fira Code"
   ;;                              :size 14
   ;;                              :weight medium
   ;;                              :width normal
   ;;                              :powerline-scale 1.1)
   ;;                             ("Fira Code Retina"
   ;;                              :size 14
   ;;                              :weight normal
   ;;                              :width normal
   ;;                              :powerline-scale 1.1)
   ;;                             ("Fira Code Regular"
   ;;                              :size 14
   ;;                              :weight normal
   ;;                              :width normal
   ;;                              :powerline-scale 1.1))


   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location nil
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq react-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun dotspacemacs/user-init ()
  ;; F11 = Full Screen
  (defun toggle-fullscreen (&optional f)
    (interactive)
    (let ((current-value (frame-parameter nil 'fullscreen)))
      (set-frame-parameter nil 'fullscreen
                           (if (equal 'fullboth current-value)
                               (if (boundp 'old-fullscreen) old-fullscreen nil)
                             (progn (setq old-fullscreen current-value)
                                    'fullboth)))))
  (global-set-key [M-up] 'toggle-fullscreen)

  ;; Disable tool-bar
  (tool-bar-mode -1)

  ;; Disable Menu Bar
  (menu-bar-mode -1)
  (setq-default dotspacemacs-themes '(spacemacs-dark))

  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (my-setup-indent 2) ; indent 2 spaces width
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq dotspacemacs-elpa-timeout 20)
  ;; (set-face-attribute 'default nil :font "Fira Code 13" :weight 'normal)
  (package-install 'spaceline-all-the-icons)
  (require 'spaceline-all-the-icons)
  (setq neo-theme 'icons)

  (package-install 'zerodark-theme)
  (require 'zerodark-theme)
  (load-theme 'zerodark t)

  (set-frame-font "Fira Code 14" nil t)

  ;; use indent-guide globally
  (spacemacs/toggle-indent-guide-globally-on)

  ;; fill column indicator on
  (spacemacs/toggle-fill-column-indicator-globally-on)

  ;; Every time when the neotree window is opened, let it find current
  ;; file and jump to node.
  (setq neo-smart-open t)

  ;; track ‘projectile-switch-project’ (C-c p p),
  (setq projectile-switch-project-action 'neotree-projectile-action)


  (setq-default evil-escape-delaynerd 0.2)
  (defadvice evil-inner-word (around underscore-as-word activate)
    (let ((table (copy-syntax-table (syntax-table))))
      (modify-syntax-entry ?_ "w" table)
      (with-syntax-table table
        ad-do-it)))
  ;; ;; Enable React syntax highlighting for .js files
  ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode))

  (evil-set-undo-system 'undo-tree)
  (define-key evil-motion-state-map (kbd "TAB") #'evil-jump-forward)

  (setq alchemist-hooks-test-on-save nil)
  (setq linum-format " %d ")

  ;;; scroll one line at a time (less "jumpy" than defaults)
  (setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; two lines at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse


  ;; Enable mouse support
  (unless window-system
    (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
    (global-set-key (kbd "<mouse-5>") 'scroll-up-line))


  ;; prettier settings
  (require 'prettier-js)
  (setq prettier-js-args '(
                           "--trailing-comma" "none"
                           "--bracket-spacing" "true"
                           "--print-width" "80"
                           "--use-tabs" "false"
                           "--tab-width" "2"
                           "--semi" "false"
                           "--single-quote" "true"
                           ))

  (add-hook 'js-mode-hook 'prettier-js-mode)
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (add-hook 'react-mode-hook 'prettier-js-mode)

  ;; Disable line-numbers minor mode for neotree
  (add-hook 'neo-after-create-hook
            (lambda (&rest _) (display-line-numbers-mode -1) (toggle-scroll-bar -1) ))

  (setq js2-mode-show-strict-warnings nil)


                                        ;; (setq prettier-js-show-errors nil)
  (setq-default dotspacemacs-configuration-layers '(
                                                    (python :variables python-formatter 'yapf)))
  )

  (setq alchemist-hooks-compile-on-save nil)
  (setq alchemist-hooks-test-on-save nil)

  (setq-default flycheck-disabled-checkers '(elixir-credo))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(spaceline-all-the-icons twittering-mode engine-mode geeknote spotify helm-spotify-plus multi elfeed-goodies ace-jump-mode elfeed-org elfeed-web elfeed wakatime-mode feature-mode projectile-rails pony-mode tern ggtags helm-gtags merlin ocp-indent tuareg caml utop geiser plantuml-mode powershell vimrc-mode dactyl-mode nasm-mode x86-lookup company-go flycheck-gometalinter go-eldoc go-guru go-mode company-quickhelp racket-mode flycheck-nim nim-mode flycheck-nimsuggest commenter epc concurrent helm-cscope stickyfunc-enhance xcscope cider-eval-sexp-fu clj-refactor inflections cider sesman seq queue parseedn parseclj a clojure-mode clojure-snippets disaster clang-format cmake-mode company-c-headers company-ycmd srefactor company-emoji emoji-cheat-sheet-plus vmd-mode auctex-latexmk company-auctex auctex typo tide typescript-mode cargo racer flycheck-rust rust-mode toml-mode psci purescript-mode psc-ide erlang fsharp-mode company-emacs-eclim eclim elm-mode reformatter flycheck-elm cmm-mode company-cabal company-ghci flycheck-haskell haskell-mode haskell-snippets helm-hoogle hindent hlint-refactor drupal-mode php-extras php-mode phpunit ein polymode anaphora arduino-mode julia-mode matlab-mode qml-mode scad-mode stan-mode thrift faust-mode company-shell fish-mode insert-shebang org-ref key-chord helm-bibtex bibtex-completion parsebib biblio biblio-core ahk-mode adoc-mode markup-faces noflet scala-mode sbt-mode swift-mode csv-mode ess-R-data-view ctable ess-smart-equals ess graphviz-dot-mode glsl-mode company-glsl ob-sml sml-mode idris-mode prop-menu company-dcd d-mode flycheck-dmd-dub common-lisp-snippets slime-company slime enh-ruby-mode sql-indent gist github-browse-file github-clone github-search magit-gh-pulls gh marshal logito pcache p4 color-identifiers-mode rainbow-identifiers rainbow-mode mu4e-alert mu4e-maildirs-extension terraform-mode hcl-mode ranger pandoc-mode ox-pandoc flycheck-ycmd ycmd request-deferred deferred esh-help eshell-prompt-extras eshell-z multi-term shell-pop xterm-color vagrant vagrant-tramp systemd spray ansible ansible-doc company-ansible jinja2-mode salt-mode mmm-jinja2 imenu-list nginx-mode command-log-mode rebox2 edit-server gmail-message-mode ham-mode html-to-markdown flymd osx-location rase sunshine theme-changer dash-at-point helm-dash counsel-dash dash-docs prodigy flycheck-ledger ledger-mode company-restclient know-your-http-well ob-http ob-restclient restclient-helm restclient puppet-mode fasd deft pdf-tools pyim xr chinese-wbim fcitx find-by-pinyin-dired ace-pinyin pinyinlib pangu-spacing youdao-dictionary names chinese-word-at-point company-nixos-options helm-nixos-options nix-mode nixos-options selectric-mode 2048-game pacmacs sudoku typit mmt xkcd rcirc-color rcirc-notify jabber srv fsm slack emojify circe oauth2 websocket ht erc-terminal-notifier erc-gitter erc-hl-nicks erc-image erc-social-graph erc-view-log erc-yt nlinum-relative nlinum counsel-projectile counsel ivy-hydra smex swiper wgrep auto-dictionary flyspell-correct-ivy ivy flyspell-correct-helm flyspell-correct-popup flyspell-correct flyspell-popup floobits gnuplot htmlize org-download org-mime org-pomodoro alert log4e gntp org-present org-projectile org-category-capture ox-twbs ox-gfm ox-reveal ibuffer-projectile bracketed-paste origami hl-anything evil-snipe evil-cleverparens paredit evil-nerd-commenter define-word zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler winum white-sand-theme which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rebecca-theme rbenv rake rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme prettier-js popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy paradox osx-trash osx-dictionary orgit organic-green-theme org-bullets open-junk-file omtose-phellack-theme omnisharp oldlace-theme occidental-theme obsidian-theme ob-elixir noctilux-theme neotree naquadah-theme mwim mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme launchctl js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flycheck-pos-tip flycheck-credo flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu espresso-theme emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-statistics company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e8830baf7d8757f15d9d02f9f91e0a9c4732f63c3f7f16439cc4fb42a1f2aa06" default))
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(package-selected-packages
   '(zerodark-theme spaceline-all-the-icons twittering-mode engine-mode geeknote spotify helm-spotify-plus multi elfeed-goodies ace-jump-mode elfeed-org elfeed-web elfeed wakatime-mode feature-mode projectile-rails pony-mode tern ggtags helm-gtags merlin ocp-indent tuareg caml utop geiser plantuml-mode powershell vimrc-mode dactyl-mode nasm-mode x86-lookup company-go flycheck-gometalinter go-eldoc go-guru go-mode company-quickhelp racket-mode flycheck-nim nim-mode flycheck-nimsuggest commenter epc concurrent helm-cscope stickyfunc-enhance xcscope cider-eval-sexp-fu clj-refactor inflections cider sesman seq queue parseedn parseclj a clojure-mode clojure-snippets disaster clang-format cmake-mode company-c-headers company-ycmd srefactor company-emoji emoji-cheat-sheet-plus vmd-mode auctex-latexmk company-auctex auctex typo tide typescript-mode cargo racer flycheck-rust rust-mode toml-mode psci purescript-mode psc-ide erlang fsharp-mode company-emacs-eclim eclim elm-mode reformatter flycheck-elm cmm-mode company-cabal company-ghci flycheck-haskell haskell-mode haskell-snippets helm-hoogle hindent hlint-refactor drupal-mode php-extras php-mode phpunit ein polymode anaphora arduino-mode julia-mode matlab-mode qml-mode scad-mode stan-mode thrift faust-mode company-shell fish-mode insert-shebang org-ref key-chord helm-bibtex bibtex-completion parsebib biblio biblio-core ahk-mode adoc-mode markup-faces noflet scala-mode sbt-mode swift-mode csv-mode ess-R-data-view ctable ess-smart-equals ess graphviz-dot-mode glsl-mode company-glsl ob-sml sml-mode idris-mode prop-menu company-dcd d-mode flycheck-dmd-dub common-lisp-snippets slime-company slime enh-ruby-mode sql-indent gist github-browse-file github-clone github-search magit-gh-pulls gh marshal logito pcache p4 color-identifiers-mode rainbow-identifiers rainbow-mode mu4e-alert mu4e-maildirs-extension terraform-mode hcl-mode ranger pandoc-mode ox-pandoc flycheck-ycmd ycmd request-deferred deferred esh-help eshell-prompt-extras eshell-z multi-term shell-pop xterm-color vagrant vagrant-tramp systemd spray ansible ansible-doc company-ansible jinja2-mode salt-mode mmm-jinja2 imenu-list nginx-mode command-log-mode rebox2 edit-server gmail-message-mode ham-mode html-to-markdown flymd osx-location rase sunshine theme-changer dash-at-point helm-dash counsel-dash dash-docs prodigy flycheck-ledger ledger-mode company-restclient know-your-http-well ob-http ob-restclient restclient-helm restclient puppet-mode fasd deft pdf-tools pyim xr chinese-wbim fcitx find-by-pinyin-dired ace-pinyin pinyinlib pangu-spacing youdao-dictionary names chinese-word-at-point company-nixos-options helm-nixos-options nix-mode nixos-options selectric-mode 2048-game pacmacs sudoku typit mmt xkcd rcirc-color rcirc-notify jabber srv fsm slack emojify circe oauth2 websocket ht erc-terminal-notifier erc-gitter erc-hl-nicks erc-image erc-social-graph erc-view-log erc-yt nlinum-relative nlinum counsel-projectile counsel ivy-hydra smex swiper wgrep auto-dictionary flyspell-correct-ivy ivy flyspell-correct-helm flyspell-correct-popup flyspell-correct flyspell-popup floobits gnuplot htmlize org-download org-mime org-pomodoro alert log4e gntp org-present org-projectile org-category-capture ox-twbs ox-gfm ox-reveal ibuffer-projectile bracketed-paste origami hl-anything evil-snipe evil-cleverparens paredit evil-nerd-commenter define-word zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler winum white-sand-theme which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rebecca-theme rbenv rake rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme prettier-js popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy paradox osx-trash osx-dictionary orgit organic-green-theme org-bullets open-junk-file omtose-phellack-theme omnisharp oldlace-theme occidental-theme obsidian-theme ob-elixir noctilux-theme neotree naquadah-theme mwim mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme launchctl js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flycheck-pos-tip flycheck-credo flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu espresso-theme emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-statistics company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
)
