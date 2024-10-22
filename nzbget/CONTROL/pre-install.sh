#!/bin/sh

set -e

case "$APKG_PKG_STATUS" in
    install)
        ;;
    upgrade)
        # backup nzbget.conf
        cp "$APKG_PKG_DIR/nzbget/nzbget.conf" "$APKG_TEMP_DIR/"
        ;;
    *)
        ;;
esac

exit 0
