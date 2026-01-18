TEX ?= pdflatex
ALT_TEX := $(HOME)/Library/TinyTeX/bin/universal-darwin/pdflatex
PDFLATEX := $(shell command -v $(TEX) 2>/dev/null)
ifeq ($(PDFLATEX),)
PDFLATEX := $(ALT_TEX)
endif

.PHONY: build clean

build:
	@if [ -z "$(FILE)" ]; then \
		echo "Usage: make build FILE=path/to/file.tex"; \
		exit 1; \
	fi
	@$(PDFLATEX) -interaction=nonstopmode "$(FILE)"
	@$(PDFLATEX) -interaction=nonstopmode "$(FILE)"

clean:
	@if [ -z "$(DIR)" ]; then \
		echo "Usage: make clean DIR=path/to/dir"; \
		exit 1; \
	fi
	@./clean_latex.sh "$(DIR)"
