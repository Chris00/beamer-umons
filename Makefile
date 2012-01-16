WEB = math.umons.ac.be:~/html/bzr/beamerUMONS/

UMONS_IMG = $(wildcard $(HOME)/TeX/graphics/UMONS*)
BEAMER = $(wildcard *.sty)


example.pdf: example.tex $(BEAMER)
	pdflatex $< && pdflatex $<

.phony: upload
upload:
	scp -C -p $(UMONS_IMG) $(WEB)

clean:
	$(RM) $(wildcard *~ *.pdf)