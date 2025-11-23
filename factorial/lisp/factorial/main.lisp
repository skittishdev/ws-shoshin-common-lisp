(in-package #:factorial)

(defun factorial/options ()
  "Returns the options for the factorial command."
  (list
   (clingon:make-option
    :string
    :description "The number for which we want to compute the factorial"
    :short-name #\n
    :long-name "number"
    :initial-value "0"
    :key :number)))

(defun factorial/handler (cmd)
  "Compute the factorial and return it."
  (let ((argv (clingon:getopt cmd :number)))
    (cond
      ((< (length argv) 1) (format t "usage: ./factorial <number>"))
      (t (format t "~a! = ~d~%" argv (factorial:fact argv))))))

(defun factorial/command ()
  "Compute the factorial of a given positive integer."
  (clingon:make-command
   :name "factorial"
   :description "compute factorial of a positive integer"
   :version "0.0.1"
   :authors '("crk")
   :options (factorial/options)
   :handler #'factorial/handler))

(defun main ()
  "The entrypoint for the factorial CLI program."
  (let ((app (factorial/command)))
    (clingon:run app)))
