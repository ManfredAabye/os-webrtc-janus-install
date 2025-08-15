#!/bin/bash

# bash janus_instal.sh

# Benötigte Pakete für Janus Gateway
DEPENDENCIES=(
    build-essential cmake git pkg-config
    libmicrohttpd-dev libjansson-dev libssl-dev libsofia-sip-ua-dev libglib2.0-dev
    libopus-dev libogg-dev libcurl4-openssl-dev liblua5.3-dev libwebsockets-dev
    libsrtp2-dev libnice-dev libsqlite3-dev
)

echo "Prüfe und installiere benötigte Pakete..."
for pkg in "${DEPENDENCIES[@]}"; do
    if ! dpkg -s "$pkg" &> /dev/null; then
        echo "$pkg wird installiert..."
        sudo apt-get install -y "$pkg"
    else
        echo "$pkg ist bereits installiert."
    fi
done

echo "Sourcecode von Janus Gateway wird heruntergeladen..."
if [ ! -d janus-gateway ]; then
    #git clone https://github.com/meetecho/janus-gateway.git
    git clone https://github.com/ManfredAabye/janus-gateway.git    
fi

cd janus-gateway || exit
echo "Erstelle Janus Gateway..."
sh autogen.sh
./configure --prefix=/opt/janus
make -j"$(nproc)"
sudo make install

echo "Konfiguriere Janus für OpenSim..."
sudo mkdir -p /opt/janus/etc/janus
sudo cp -r config/* /opt/janus/etc/janus/

echo ""
echo "Bitte Passwort für Janus API eingeben (wird in der Janus-Konfiguration verwendet):"
read -r JANUS_SECRET
echo ""
echo "Bitte Passwort für OpenSim Verbindung eingeben (wird in der OpenSim-Konfiguration verwendet):"
read -r OPENSIM_SECRET

# Beispielhafte Eintragungen in Konfigurationsdateien:
echo "JANUS_SECRET=$JANUS_SECRET" > ~/janus_opensim_secrets.env
echo "OPENSIM_SECRET=$OPENSIM_SECRET" >> ~/janus_opensim_secrets.env

# Anpassung in Janus-Konfigurationsdatei (nur Beispiel, anpassen nach Bedarf!):
JANUS_CFG="/opt/janus/etc/janus/janus.transport.http.cfg"
if grep -q "admin_secret" "$JANUS_CFG"; then
    sudo sed -i "s/^admin_secret.*/admin_secret = \"$JANUS_SECRET\"/" "$JANUS_CFG"
else
    echo "admin_secret = \"$JANUS_SECRET\"" | sudo tee -a "$JANUS_CFG"
fi

echo ""
echo "Trage das OpenSim-Passwort (OPENSIM_SECRET) in die OpenSim-Konfiguration an der entsprechenden Stelle ein."
echo "Das Passwort wurde auch in ~/janus_opensim_secrets.env gespeichert."
echo ""
echo "Installation und Konfiguration abgeschlossen!"
echo "Du kannst Janus starten mit: /opt/janus/bin/janus -C /opt/janus/etc/janus"