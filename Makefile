.PHONY: error install uninstall

INSTALL_DIR = "/Users/andrewl/Library/Application\ Support/Anki2/addons21"

error:
	@echo "available targets: install, uninstall"
	@exit -1

install:
	@if [ -L "$(INSTALL_DIR)/anki_fen_vis" ]; then \
		echo "already installed"; \
	else \
		echo "installing"; \
		ln -s "$(PWD)" "$(INSTALL_DIR)/anki_fen_vis"; \
	fi

uninstall:
	@if [ -L "$(INSTALL_DIR)/anki_fen_vis" ]; then \
		echo "uninstalling"; \
		rm "$(INSTALL_DIR)/anki_fen_vis"; \
	else \
		echo "not installed"; \
	fi
