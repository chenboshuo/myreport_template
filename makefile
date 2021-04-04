.PHONY : all clean help main main.tex
## make all : regenerate all results.
all: main

## make main : genreate the main pdf
main: build/main.pdf

## make *.pdf : generate the pdf files
build/%.pdf: %.tex build
	xelatex -output-directory="./build" $<
	bibtex ./build/$(basename $<)
	xelatex -output-directory="./build" $<
	xelatex -output-directory="./build" $<


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
