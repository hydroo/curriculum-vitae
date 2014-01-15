%.pdf: %.tex
	pdflatex -shell-escape -interaction=nonstopmode $< 1> /dev/null 2> /dev/null
	pdflatex -shell-escape -interaction=nonstopmode $<

all: en-cv.pdf en-ref.pdf de-cv.pdf de-ref.pdf

en-cv.pdf: pre.tex en-header.tex
en-ref.pdf: pre.tex en-header.tex
de-cv.pdf: pre.tex de-header.tex
de-ref.pdf: pre.tex de-header.tex

.PHONY: clean
clean:
	rm -f *.out *.aux *.log *.pdf
	
