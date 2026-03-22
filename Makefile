LIVRO ?= TCC-IFC

LATEXMK := $(shell command -v latexmk 2>/dev/null)
PDFLATEX := $(shell command -v pdflatex 2>/dev/null)

all: pdf

pdf:
ifdef LATEXMK
	$(LATEXMK) -pdf -interaction=nonstopmode -file-line-error -synctex=1 $(LIVRO).tex
else ifdef PDFLATEX
	$(PDFLATEX) -interaction=nonstopmode -file-line-error -synctex=1 $(LIVRO).tex
	bibtex $(LIVRO)
	makeindex $(LIVRO) || true
	$(PDFLATEX) -interaction=nonstopmode -file-line-error -synctex=1 $(LIVRO).tex
	$(PDFLATEX) -interaction=nonstopmode -file-line-error -synctex=1 $(LIVRO).tex
else
	@echo "Erro: nao encontrei 'pdflatex' nem 'latexmk' no PATH."
	@echo "Instale o TeX (MacTeX/TeX Live) e garanta que /Library/TeX/texbin esteja no PATH."
	@exit 1
endif

clean:
ifdef LATEXMK
	$(LATEXMK) -C $(LIVRO).tex
else
	rm -f *.aux *.soc *.toc *.lof *.lot *.blg *.bbl \
		*.ind *.out *.ilg *.idx *.glo *.gls *.log *.synctex.gz \
		*.fdb_latexmk *.fls *.brf *.nav *.snm *.vrb *.lol
endif

cleanall: clean
	rm -f $(LIVRO).pdf *~
