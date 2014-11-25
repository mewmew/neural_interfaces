all: neurala_gränssnitt.pdf

neurala_gränssnitt.pdf:
	texi2pdf -q -c neurala_gränssnitt.tex

clean:
	rm -f *.aux *.log *.out *.toc
