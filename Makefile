CFLAGS ?= -g -O2 -Wall -Wextra -D_FORTIFY_SOURCE=2 -fstack-protector --param ssp-buffer-size=4
BINDIR ?= $(HOME)

%: %.c
	$(CC) $(CFLAGS) -o $(OUTDIR)$@ $<

all: ltunify read-dev-usbmon

.PHONY: clean install-home
clean:
	rm -f ltunify read-dev-usbmon hidraw

install-home: ltunify
	install -m755 -D ltunify $(BINDIR)/ltunify