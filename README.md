# os-webrtc-janus-install
OpenSim Installation Server und OpenSim Addon


Ich beschreibe die Konfiguration in zwei Szenarien:
1. Konfiguration als Grid mit mehreren OpenSim Instanzen

Grid-Konfiguration bedeutet, mehrere OpenSimulator-Instanzen (Regionen) laufen in einer vernetzten Umgebung, oft mit zentralen Diensten wie Robust (zentrale Verwaltung der Nutzer, Inventare, etc.).

Wichtige Schritte:

    Janus-Gateway-Server: Stelle sicher, dass ein zentraler Janus WebRTC Server erreichbar ist und für alle Instanzen zugänglich ist.
    Module-Installation: Das Modul os-webrtc-janus muss auf allen OpenSim-Instanzen installiert und aktiviert werden.
    Konfigurationsdateien bearbeiten: In der Konfigurationsdatei (meist OpenSim.ini oder spezifische Modul-Konfigurationsdatei wie os-webrtc-janus.ini) müssen die Parameter so gesetzt werden, dass alle Instanzen denselben Janus-Server nutzen.

Typische Konfigurationseinträge:
INI

[JanusWebRTC]
Enabled = true
JanusServerURL = "http://janus-server.example.com:8088/janus"
JanusAdminSecret = "DEIN_SECRET"
GridMode = true

    GridMode = true: Signalisiert, dass die Instanz im Grid-Modus läuft.
    JanusServerURL: Der zentrale Janus-Server, den alle Regionen verwenden.
    AdminSecret: Zugangsdaten für den Janus-Server (sicher aufbewahren!).

Zusätzliche Hinweise:

    Stelle sicher, dass alle Instanzen den gleichen Kommunikationskanal zum Janus-Server haben (Netzwerkfreigaben, Firewall).
    Es kann notwendig sein, den Janus-Server so zu konfigurieren, dass er Sessions von mehreren Regionen/Instanzen verwalten kann.

2. Konfiguration nur für OpenSim (Standalone-Modus)

Im Standalone-Modus läuft OpenSim als einzelne Instanz, oft lokal oder für kleine Projekte ohne Grid-Struktur.

Wichtige Schritte:

    Janus-Gateway-Server: Kann lokal installiert oder remote erreichbar sein.
    Module-Installation: Das Modul muss wie oben installiert und aktiviert werden.
    Konfigurationsdateien bearbeiten: Die Konfiguration ist vereinfacht, da nur eine Instanz existiert.

Typische Konfigurationseinträge:
INI

[JanusWebRTC]
Enabled = true
JanusServerURL = "http://localhost:8088/janus"
JanusAdminSecret = "DEIN_SECRET"
GridMode = false

    GridMode = false: Zeigt an, dass die Instanz im Standalone-Modus läuft.
    JanusServerURL: Kann auf localhost zeigen, wenn Janus auf derselben Maschine läuft.
    AdminSecret: Zugangsdaten für den Janus-Server.

Zusätzliche Hinweise:

    Die Kommunikation ist einfacher, da alles auf einer Maschine oder in einer Instanz läuft.
    Es sind keine speziellen Netzwerk-Freigaben oder zentralen Dienste notwendig.
