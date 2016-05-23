(if (eq system-type 'gnu/linux)
    (load-file (expand-file-name "security.el" user-emacs-directory)))
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Packaging-Basics.html
(setf package-enable-at-startup nil)
(package-initialize)

;; repositorios de paquetes
(setf package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

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

;; Arreglo para LaTeX con Emacs en MacOS "El Capitan"
(when (eq system-type 'darwin)
  (setf exec-path (append exec-path '("/Library/TeX/texbin"))))

;; En caso de que /usr/local/bin no este agregado
(when (and (not (member "/usr/local/bin" exec-path)) (or (not (eq system-type 'windows-nt))
                                                    (not (eq system-type 'cygwin))
                                                    (not (eq system-type 'ms-dos))))
  (setf exec-path (append exec-path '("/usr/local/bin")))
  (setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t))

;; En caso que ~/.local/bin no este agregado
(when (and (not (member "/home/jorge/.local/bin" exec-path)) (eq system-type 'gnu/linux))
  (setf exec-path (append exec-path '("/home/jorge/.local/bin")))
  (setenv "PATH" (concat (getenv "PATH") ":/home/jorge/.local/bin")))

;; En caso que $GOBIN no este agregado y exista
(when (and (not (member "/home/jorge/go-workspace/bin" exec-path)) (eq system-type 'gnu/linux))
  (setf exec-path (append exec-path '("/home/jorge/go-workspace/bin")))
  (setenv "PATH" (concat (getenv "PATH") ":/home/jorge/go-workspace/bin")))

(put 'downcase-region 'disabled nil)
(require 'use-package)
(setf use-package-always-ensure t)

(require 'ob-tangle)
;; cuando el archivo org es más reciente que el archivo elisp, el archivo elisp
;; se recrea a partir de los bloques de código en el archivo org. Esto deberia
;; ahorrarme unos segundos cuando Emacs se carga.
(when (file-newer-than-file-p
       (expand-file-name "configuracion.org" user-emacs-directory)
       (expand-file-name "configuracion.el" user-emacs-directory))
  ;; enreda los bloques de código en un archivo elisp si el archivo ORG es más
  ;; nuevo que el archivo elisp 
  (org-babel-load-file (expand-file-name "configuracion.org" user-emacs-directory))) 

;; finalmente, carga la configuración
(load-file (expand-file-name "configuracion.el" user-emacs-directory))
