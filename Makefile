.DELETE_ON_ERROR:

ASM = hack.asm
HACK = hack.sfc
ROM = soulblazer.sfc
AS = asar
ASFLAGS = --symbols=wla

all: $(HACK)

$(HACK): $(ASM)
	cp $(ROM) $(HACK)
	$(AS) $(ASFLAGS) $(ASM) $(HACK)

.PHONY:
clean:
	rm -rf $(HACK)
