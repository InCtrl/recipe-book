SRCS=recipe-book.tex
VPATH=appetizers cocktails condiments desserts game meat pasta poultry sauces seafood veg
#NAME=McGill-PCA-Draft.pdf

all: manuscript

manuscript:
	# generate aux files
	pdflatex $(SRCS)
	# generate index file
	makeindex $(SRCS:.tex=)
	# create bbl file
	#bibtex $(SRCS:.tex=.aux)
	# run latex again to include bbl
	pdflatex $(SRCS)
	# run latex one more time to update references, section numbers, etc
	pdflatex $(SRCS)
	# change name of file
	#mv $(SRCS:.tex=.pdf) $(NAME)

quick:
	# generate aux files
	pdflatex $(SRCS)
	# change name of file
	#mv $(SRCS:.tex=.pdf) $(NAME)

bib:
	# create bbl file
	bibtex $(SRCS:.tex=.aux)

clean:
	rm -f *~

clean_all:
	latexmk -c
	rm -f *~ *.aux *.bbl *.toc *.lof *.log *.lot *.out *.blg *.spl *.idx *.ilg *.ind
	#rm -f $(SRCS:.tex=.pdf) *~ *.aux *.bbl *.toc *.lof *.log *.lot *.out *.blg *.spl *.idx *.ilg *.ind
	$(foreach var,$(VPATH),rm -f $(var)/*~;)
