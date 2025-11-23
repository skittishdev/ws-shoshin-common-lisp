LISP ?= sbcl

install:
	$(LISP) --load build.lisp

install-with-asdf:
	$(LISP) --load factorial.asd \
		--eval '(ql:quickload :factorial)' \
		--eval '(asdf:make :factorial)' \
		--eval '(quit)'
