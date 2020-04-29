WEB = san-bzr@math.umons.ac.be:~/public_html/beamerUMONS/

VERSION = 0.3
UMONS_IMG = $(wildcard $(HOME)/TeX/graphics/UMONS*)
BEAMER = $(wildcard *.sty)

DIST_FILES = beamercolorthemeUMONS.sty beamerouterthemeUMONS.sty \
  beamerthemeUMONS.sty example.tex

TARBALL = beamerUMONS-$(VERSION)

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
upload: tar
	scp -C -p $(UMONS_IMG) $(WEB)
	scp -C -p $(TARBALL).tar.gz $(WEB)

clean:
	$(RM) $(wildcard *~ *.pdf)
