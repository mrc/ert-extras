;;; ert-extras.el --- Some extensions to ert

;; Copyright (C) 2011 Matt Curtis
;; All rights reserved.
;;
;; Author: Matt Curtis <matt.r.curtis@gmail.com>
;; Version: 0.1
;; Keywords: lisp, tools
;; URL: https://github.com/mrc/ert-extras

;; This file is NOT (yet) part of GNU Emacs.

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see `http://www.gnu.org/licenses/'.

;;; Commentary:
;; Some extra functions for ERT (Emacs Lisp Regression Testing).

(defmacro are (form &rest forms)
  "Evaluate FORM, then a list of FORMS with `should`.  If any
form evaluates to nil, abort the current test as failed.

Returns the value of the last form evaluated."
  (let ((result (make-symbol "result")))
    `(progn
       (setq ,result (should ,form))
       (unless (null ',forms)
         (setq ,result (are ,@forms)))
       ,result)))

(provide 'ert-extras)

;;; ert-extras.el ends here
