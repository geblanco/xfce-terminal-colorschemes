#
# Global Settings
#

INSTALL = install
DESTDIR ?= /
PREFIX  ?= $(DESTDIR)/usr/share/xfce4/terminal
INSTALL_PATH = $(PREFIX)/colorschemes

OBJECTS = $(wildcard src/*)
xfce4 = $(PREFIX)-$(wildcard $(PREFIX))
xfce4_installed = $(PREFIX)-$(PREFIX)
xfce4_not_installed = $(PREFIX)-

#
# Targets
#

all:
	@echo "Nothing to do"

install: | $(xfce4)
$(xfce4_installed):
	$(INSTALL) -m0644 $(OBJECTS) $(INSTALL_PATH)

$(xfce4_not_installed):
	@echo "It seems that xfce4-terminal is not installed, nothing to do"

uninstall:
	@rm $(patsubst src/%,$(INSTALL_PATH)/%,$(OBJECTS))

.PHONY: all install uninstall
