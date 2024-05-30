LATEXCC := xelatex
PDFS := bike.pdf coffee.pdf tech.pdf

PANDOCC := pandoc --pdf-engine=xelatex

.PHONY: all clean
all: $(PDFS)

out/%.pdf: %.tex common.tex
	@mkdir -p out
	$(LATEXCC) -output-directory out $<

out/%.pdf: %.md
	@mkdir -p out
	$(PANDOCC) $< -o $@

%.pdf: out/%.pdf
	cp $< $@

clean:
	rm -rf out $(PDFS)
