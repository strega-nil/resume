LATEXCC := xelatex

.PHONY: all
all: resume.pdf

%.pdf: %.tex
	$(LATEXCC) $<
