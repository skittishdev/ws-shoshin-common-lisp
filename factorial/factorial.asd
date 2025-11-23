(asdf:defsystem #:factorial
  :description "My first common lisp project with sbcl + asdf + quicklisp."
  :version "0.0.1"
  :author "crk"
  :depends-on (:clingon)
  :components ((:file "packages")
               (:module "lisp"
                :serial t
                :components ((:module "factorial"
                             :serial t
                             :components ((:file "factorial")
                                          (:file "main"))))))
  :build-operation "program-op"
  :build-pathname "factorial"
  :entry-point "factorial:main")
