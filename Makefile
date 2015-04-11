RED=`echo '\033[0;31m'`
YELLOW=`echo '\033[0;33m'`
BLUE=`echo '\033[0;34m'`
NOCOLOR=`echo '\033[m'`
BOLD=`echo '\033[1m'`
NORMAL=`echo '\033[0m'`

COLORIZE = \
	sed "s/Overfull/${RED}${BOLD}&${NORMAL}${NOCOLOR}/g" | \
	sed "s/Underfull/${YELLOW}${BOLD}&${NORMAL}${NOCOLOR}/g" | \
	sed "s/[0-9]*--[0-9]*/${BLUE}${BOLD}&${NORMAL}${NOCOLOR}/g" | \
	sed "s/LaTeX Warning/${YELLOW}${BOLD}&${NORMAL}${NOCOLOR}/g" | \
	sed "s/! LaTeX Error/${RED}${BOLD}&${NORMAL}${NOCOLOR}/g" | \
	sed "s/! Undefined control sequence/${RED}${BOLD}&${NORMAL}${NOCOLOR}/g" | \
	sed "s/l\.[0-9]*/${BLUE}${BOLD}&${NORMAL}${NOCOLOR}/g"

.IGNORE: $(%.pdf)
%.pdf: %.tex
	@echo ""
	@echo "${BLUE}${BOLD}>>> $@ <<<${NORMAL}"
	@echo ""
	pdflatex -shell-escape -interaction=nonstopmode $< 1> /dev/null 2> /dev/null
	pdflatex -shell-escape -interaction=nonstopmode $< | $(COLORIZE)

all: en-cv.pdf en-ref.pdf de-cv.pdf de-ref.pdf

en-cv.pdf: pre.tex en-header.tex
en-ref.pdf: pre.tex en-header.tex
de-cv.pdf: pre.tex de-header.tex
de-ref.pdf: pre.tex de-header.tex

.PHONY: clean
clean:
	rm -f *.out *.aux *.log *.pdf
	
