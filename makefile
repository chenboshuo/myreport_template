.PHONY : all clean help main main.tex
.ONESHELL: # Applies to every targets in the file!
.INTERMEDIATE : inkscape
## make all : regenerate all results.
all: inkscape main

## make main : genreate the main pdf
main: inkscape build/main.pdf

## make quick: quick mode, just xelatex once,it ignore the bib files
quick: inkscape main.tex build
	xelatex -output-directory="./build" main.tex

## make *.pdf : generate the pdf files
build/%.pdf: %.tex build
	xelatex -output-directory="./build" $<
	bibtex ./build/$(basename $<)
	xelatex -output-directory="./build" $<
	xelatex -output-directory="./build" $<

## make inkscape: if has inkscape svg,convert it into pdf+latex version
inkscape:
	cd figures
	for i in $$(find . -type f -name '*.svg');do
		inkscape $$i --export-filename=$$(basename $$i .svg ).pdf \
		  --export-latex --export-area-drawing
	done

clean:
	# git ls-files --others | xargs gio trash
	git clean -fXd

## make build: create directory build
build:
	mkdir build

## make help : show this message.
help :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' \
		| column -t -s ':'
