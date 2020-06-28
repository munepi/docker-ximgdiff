all: munepi/ximgdiff

munepi/ximgdiff:
	docker build -t munepi/ximgdiff .

clean:
	find  . -name "*~" | xargs rm -f

# end of file
