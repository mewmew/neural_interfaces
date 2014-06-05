all: neurala_gränssnitt

neurala_gränssnitt:
	texi2pdf -q -c $@.tex

clean:
	rm -f *.aux *.log *.out *.toc
