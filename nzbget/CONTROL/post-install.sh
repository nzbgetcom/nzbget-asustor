#!/bin/sh

set -e

NZBGET_INSTALLER="nzbget-latest-bin-linux.run"
NZBGET_DOWNLOAD_URL="https://nzbget.com/download/$NZBGET_INSTALLER"
NZBGET_CONF="$APKG_PKG_DIR/nzbget/nzbget.conf"

install_nzbget() {
    # download and install latest nzbget linux installer package        
    wget "$NZBGET_DOWNLOAD_URL" -O "$APKG_TEMP_DIR/$NZBGET_INSTALLER" >/dev/null 2>&1
    sh "$APKG_TEMP_DIR/$NZBGET_INSTALLER" --silent --destdir "$APKG_PKG_DIR/nzbget/"
    rm "$APKG_TEMP_DIR/$NZBGET_INSTALLER"
}

case "$APKG_PKG_STATUS" in
    install)
        install_nzbget
        # adjust some values
        sed -i 's|^MainDir=.*|MainDir=/share/Download/NZBGet|' $NZBGET_CONF
        sed -i 's|^ScriptDir=.*|ScriptDir=${MainDir}/scripts|' $NZBGET_CONF
        ;;
    upgrade)
        install_nzbget
        # restore config file
        mv "$APKG_TEMP_DIR/nzbget.conf" $NZBGET_CONF
        ;;
    *)
        ;;
esac

exit 0
