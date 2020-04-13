CC=cc65
CC=ca65
LD=ld56
EMU=fceux
SRCDIR=src
INCDIR=include


PRJNAME=test


PHONY: clean all

.PRECIOUS: *.o

all: $(PRJNAME).nes

clean:
	@rm -fv *.s
	@rm -fv *.o
	@rm -fv *.nes

test: $(PRJNAME).nes
	$(EMU) $(PRJNAME).nes

%.o: %.c
	$(CC) -Oi $(SRCDIR)/$< --add-source
	$(CA) $*.s
	rm $*.s

$(PRJNAME).nes: %.o
	$(LD) -o $@ $(INCDIR)/crt0.o $< $(INCDIR)/neslib2.lib
