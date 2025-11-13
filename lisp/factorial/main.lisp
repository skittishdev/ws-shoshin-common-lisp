(in-package #:factorial)

(defun main ()
  (let ((argv (rest sb-ext:*posix-argv*)))
    (cond
      ((< (length argv) 1) (format t "usage: ./factorial <number>"))
      (t (format t "~a! = ~d~%" (elt argv 0) (factorial:fact (elt argv 0)))))))
