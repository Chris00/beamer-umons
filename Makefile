WEB = math.umons.ac.be:~/html/bzr/beamerUMONS/

UMONS_IMG = $(wildcard $(HOME)/TeX/graphics/UMONS*)
BEAMER = $(wildcard *.sty)

DIST_FILES = beamercolorthemeUMONS.sty beamerouterthemeUMONS.sty \
  beamerthemeUMONS.sty example.tex

TARBALL = beamerUMONS

example.pdf: example.tex $(BEAMER)
	pdflatex $< && pdflatex $<

.PHONY: tar
tar:
	mkdir $(TARBALL)
	cp $(DIST_FILES) $(TARBALL)
	cp $(UMONS_IMG) $(TARBALL)
	tar -zcf $(TARBALL).tar.gz $(TARBALL)
	$(RM) -rf $(TARBALL)

.phony: upload
upload:
	scp -C -p $(UMONS_IMG) $(WEB)

clean:
	$(RM) $(wildcard *~ *.pdf)