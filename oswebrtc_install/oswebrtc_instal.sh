#!/bin/bash

# bash oswebrtc_instal.sh

function webRTCinstall() {
    cd /opt || exit

    # Überprüfe, ob das Verzeichnis existiert
    if [ ! -d "os-webrtc-janus" ]; then
		git clone https://github.com/opensim/opensim.git opensim
        git clone https://github.com/Misterblue/os-webrtc-janus.git os-webrtc-janus
    else
        echo "Das Repository 'os-webrtc-janus' ist bereits vorhanden."
    fi

	cp -r /opt/os-webrtc-janus/ /opt/opensim/addon-modules/os-webrtc-janus

    cp -r /opt/os-webrtc-janus/WebRTC-Sandbox/OpenSim /opt/opensim/OpenSim
    cp -r /opt/os-webrtc-janus/WebRTC-Sandbox/bin /opt/opensim/bin

 	echo "Running pre-build scripts..."
	cd opensim || exit
	bash runprebuild.sh
	dotnet build --configuration Release OpenSim.sln
	cd ..
}

webRTCinstall
