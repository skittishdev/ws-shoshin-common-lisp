(in-package #:factorial)

(defun fact (n)
  "Given an integer (expressed as an integer, or a string), compute it's factorial."
  (cond
    ((integerp n) (fact-impl n))
    ((stringp n) (handler-case
                     (fact-impl (parse-integer n :junk-allowed nil))
                   (parse-error ()
                     (progn
                       (format t "Cannot parse integer from string: ~a~%" n)
                       0))))
    (t (format t "Only integer arguments are allowed. Got: ~a~%" n))
    ))

(defun fact-impl (num)
  "Given an integer, compute it's factorial."
  (cond
    ((< num 0) 0)
    ((zerop num) 1)
    (t (* num (fact (- num 1))))))
