(load-file (expand-file-name "security.el" user-emacs-directory))
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Packaging-Basics.html
(setf package-enable-at-startup nil)
(package-initialize)

;; repositorios de paquetes
(setf package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

;; revisamos si no tenemos use-package instalado, porque de ser verdadero esto,
;; lo instalamos
(when (not (package-installed-p 'use-package))
  (progn
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))

(when (not (package-installed-p 'org))
  (progn
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'org)))

(put 'downcase-region 'disabled nil)
(require 'use-package)
(setf use-package-always-ensure t)

(require 'ob-tangle)
;; cuando el archivo org es más reciente que el archivo elisp, el archivo elisp
;; se recrea a partir de los bloques de código en el archivo org. Esto deberia
;; ahorrarme unos segundos cuando Emacs se carga.
(if (file-newer-than-file-p
     (expand-file-name "configuracion.org" user-emacs-directory)
     (expand-file-name "configuracion.el" user-emacs-directory))
    ;; enreda los bloques de código en un archivo elisp
    (org-babel-load-file (expand-file-name "configuracion.org" user-emacs-directory))
  ;; en caso contrario, carga el archivo ya existente :)
  (load-file (expand-file-name "configuracion.el" user-emacs-directory)))
