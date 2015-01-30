;;; flycheck-android-lint.el --- flycheck extension by using android lint

;; Copyright (C) 2015 by Yuta Yamada

;; Author: Yuta Yamada <cokesboy"at"gmail.com>
;; URL: https://github.com/yuutayamada/flycheck-android-lint-el
;; Version: 0.0.1
;; Package-Requires: ((package "version-number"))
;; Keywords: keyword

;;; License:
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;; Commentary:

;;; Code:
(require 'flycheck)

(flycheck-define-checker xml-android-lint
  "A XML syntax checker and validator using the lint utility."
  :command ("lint" source)
  :error-patterns
  ((warning line-start (file-name) ":" line ": Warning: "
            (message (one-or-more
                      (or (not (any "~"))
                          (not (any "^"))))
                     (or (any "^") (any "~")))
            line-end)
   (error   line-start (file-name) ":" line ": Error: "
            (message (one-or-more
                      (or (not (any "~"))
                          (not (any "^"))))
                     (or (any "^") (any "~")))
            line-end))
  :modes (xml-mode nxml-mode))

(provide 'flycheck-android-lint)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; flycheck-android-lint.el ends here
