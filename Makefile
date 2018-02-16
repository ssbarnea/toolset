all: test
.PHONY: info test
.ONESHELL:

PYTHON_PATH := $(shell which python)
PLATFORM := $(shell uname -s | awk '{print tolower($$0)}')
DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PYTHON_VERSION := $(shell python3 -c "import sys; print('py%s%s' % sys.version_info[0:2] + ('-conda' if 'conda' in sys.version or 'Continuum' in sys.version else ''))")
PREFIX=
ifndef GIT_BRANCH
GIT_BRANCH=$(shell git branch | sed -n '/\* /s///p')
endif

info:
	@echo "INFO:	Python $(PYTHON_VERSION) from '$(PREFIX)' [$(CONDA)]"

test: info
	@echo "INFO:	test"
	@cd tests/untox && \
	cp -f tox.ini.orig tox.ini && \
	./../../bin/untox && \
	diff tox.ini tox.ini.clean
	@echo "INFO:	SUCCESS"
