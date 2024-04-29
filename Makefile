
compile_and_run: clean
	@ghc test.hs ; ./test

clean:
	@rm -f test
	@rm -f ApplicationsAndCompositions.hi
	@rm -f ApplicationsAndCompositions.o
	@rm -f test.hi
	@rm -f test.o
