#!/bin/sh
pylint --disable=C0114,W0613,C0115,W1113,W0223,C0116,R0903 --max-line-length=120 $(git ls-files '*.py')
