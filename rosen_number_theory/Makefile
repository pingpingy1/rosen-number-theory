MAKE=@make
DUNE=@dune
LN=@ln -sf
RM=@rm
EXE=rosen-number-theory

all:
	$(DUNE) build src/main.exe
	$(LN) _build/default/src/main.exe $(EXE)

fmt:
	$(DUNE) build @fmt --auto-promote

test: all
	$(DUNE) test

clean:
	$(DUNE) clean
	$(RM) -rf $(EXE)
