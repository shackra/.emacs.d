;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! hungry-delete
  :recipe (:host github :repo "nflath/hungry-delete")
  :pin "0513152525c38519a5597db2d6495b56dd9cc3f0")

(package! rego-mode
  :recipe (:host github :repo "psibi/rego-mode")
  :pin "be110e6cef5d34eef0529a8739c68e619cf15310"
  :disable (not (featurep! :lang rego)))

(package! highlight-escape-sequences
  :recipe (:host github :repo "dgutov/highlight-escape-sequences")
  :pin "fae976568c04b6fe8a9f2d854c8fe23b357a6878")

(package! pkgbuild-mode
  :recipe (:host github :repo "juergenhoetzel/pkgbuild-mode")
  :pin "8a5e95c8514315cb40c47f1acdb68a4ace921497"
  :disable (not (featurep! :lang pkgbuild)))

(package! reformatter
  :recipe (:host github :repo "purcell/reformatter.el")
  :pin "45c0add95025f53ca644a6c8b9afa05b2da3c474")

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)