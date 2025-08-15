# os-webrtc-janus-install-Linux (Test)
OpenSim Installation Server und OpenSim Addon

Janus Server Starten.

```bash
bash janust.sh restart
```


## Ich beschreibe die Konfiguration in zwei Szenarien:

---

1. Konfiguration als Grid mit mehreren OpenSim Instanzen

Grid-Konfiguration bedeutet, mehrere OpenSimulator-Instanzen (Regionen) laufen in einer vernetzten Umgebung, oft mit zentralen Diensten wie Robust (zentrale Verwaltung der Nutzer, Inventare, etc.).

Wichtige Schritte:

Janus-Gateway-Server: Stelle sicher, dass ein zentraler Janus WebRTC Server erreichbar ist und für alle Instanzen zugänglich ist.

Module-Installation: Das Modul os-webrtc-janus muss auf allen OpenSim-Instanzen installiert und aktiviert werden.

Konfigurationsdateien bearbeiten: In der Konfigurationsdatei (meist OpenSim.ini oder spezifische Modul-Konfigurationsdatei wie os-webrtc-janus.ini) müssen die Parameter so gesetzt werden, dass alle Instanzen denselben Janus-Server nutzen.

Typische Konfigurationseinträge:
```INI
[JanusWebRTC]
Enabled = true
JanusServerURL = "http://janus-server.example.com:8088/janus"
JanusAdminSecret = "DEIN_SECRET"
GridMode = true
```
GridMode = true: Signalisiert, dass die Instanz im Grid-Modus läuft.

JanusServerURL: Der zentrale Janus-Server, den alle Regionen verwenden.

AdminSecret: Zugangsdaten für den Janus-Server (sicher aufbewahren!).

Zusätzliche Hinweise:

Stelle sicher, dass alle Instanzen den gleichen Kommunikationskanal zum Janus-Server haben (Netzwerkfreigaben, Firewall).

Es kann notwendig sein, den Janus-Server so zu konfigurieren, dass er Sessions von mehreren Regionen/Instanzen verwalten kann.

---

2. Konfiguration nur für OpenSim (Standalone-Modus)

Im Standalone-Modus läuft OpenSim als einzelne Instanz, oft lokal oder für kleine Projekte ohne Grid-Struktur.

Wichtige Schritte:

Janus-Gateway-Server: Kann lokal installiert oder remote erreichbar sein.

Module-Installation: Das Modul muss wie oben installiert und aktiviert werden.

Konfigurationsdateien bearbeiten: Die Konfiguration ist vereinfacht, da nur eine Instanz existiert.

Typische Konfigurationseinträge:
```INI

[JanusWebRTC]
Enabled = true
JanusServerURL = "http://localhost:8088/janus"
JanusAdminSecret = "DEIN_SECRET"
GridMode = false
```

GridMode = false: Zeigt an, dass die Instanz im Standalone-Modus läuft.

JanusServerURL: Kann auf localhost zeigen, wenn Janus auf derselben Maschine läuft.

AdminSecret: Zugangsdaten für den Janus-Server.

Zusätzliche Hinweise:

Die Kommunikation ist einfacher, da alles auf einer Maschine oder in einer Instanz läuft.

Es sind keine speziellen Netzwerk-Freigaben oder zentralen Dienste notwendig.

---

## Meldungen

    INFO  (1) - WebRtcVoice.WebRtcVoiceServerConnector [WEBRTC VOICE SERVER CONNECTOR] WebRtcVoiceServerConnector enabled
    DEBUG (1) - WebRtcVoice.WebRtcVoiceServerConnector [WEBRTC VOICE SERVER CONNECTOR] loading WebRtcVoiceServiceModule.dll:WebRtcVoiceServiceModule
    DEBUG (1) - WebRtcVoice.WebRtcVoiceServiceModule [WEBRTC VOICE SERVICE MODULE] Loading SpatialVoiceService from WebRtcJanusService.dll:WebRtcJanusService
    DEBUG (1) - WebRtcVoice.WebRtcJanusService [JANUS WEBRTC SERVICE] WebRtcJanusService version 0.0.0.0
    DEBUG (1) - WebRtcVoice.WebRtcJanusService [JANUS WEBRTC SERVICE] Enabled
    DEBUG (1) - WebRtcVoice.WebRtcJanusService [JANUS WEBRTC SERVICE] StartConnectionToJanus
    DEBUG (1) - WebRtcVoice.WebRtcVoiceServiceModule [WEBRTC VOICE SERVICE MODULE] Loading NonSpatialVoiceService from WebRtcJanusService.dll:WebRtcJanusService
    DEBUG (1) - WebRtcVoice.WebRtcVoiceServiceModule [WEBRTC VOICE SERVICE MODULE] NonSpatialVoiceService is same as SpatialVoiceService
    INFO  (1) - WebRtcVoice.WebRtcVoiceServiceModule [WEBRTC VOICE SERVICE MODULE] WebRtcVoiceService enabled
    DEBUG (.NET TP Worker) - WebRtcVoice.JanusViewerSession [JANUS VIEWER SESSION] JanusViewerSession created 3a5d67f6-1bde-4e0b-8e7e-951b76937123
    DEBUG (.NET TP Worker) - WebRtcVoice.JanusSession [JANUS SESSION] JanusSession constructor
    DEBUG (.NET TP Worker) - WebRtcVoice.JanusSession [JANUS SESSION] CreateSession. Created. ID=8244229047451123, URL=http://myweb.de:8088/janus/8244229047451123
    DEBUG (.NET TP Worker) - WebRtcVoice.JanusSession [JANUS SESSION] EventLongPoll
    DEBUG (.NET TP Worker) - WebRtcVoice.WebRtcJanusService [JANUS WEBRTC SERVICE] JanusSession created
    DEBUG (.NET TP Worker) - WebRtcVoice.JanusPlugin [JANUS PLUGIN] Activate. Plugin attached. ID=2849151892044123, URL=http://myweb.de:8088/janus/8244229047451261/2849151892044123
    DEBUG (.NET TP Worker) - WebRtcVoice.WebRtcJanusService [JANUS WEBRTC SERVICE] AudioBridgePluginHandle created
