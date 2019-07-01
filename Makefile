all: neurala_gränssnitt.pdf

%.pdf: %.tex
	latexrun --latex-cmd=xelatex -o $@ $<
	# run twice because LaTeX.
	latexrun --latex-cmd=xelatex -o $@ $<

.PHONY: all clean

clean:
	$(RM) -v -rf latex.out
	$(RM) -v neurala_gränssnitt.pdf
