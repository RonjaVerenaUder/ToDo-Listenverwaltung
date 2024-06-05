# ToDo-Listenverwaltung
Entwurf und Implementierung einer Rest-Schnittstelle mit Open Api
Von Ronja-Verena Uder und Lukas Gedrat

# Statische IP-Adresse auf Raspberry-Pi
1. Mit Rasberry Pi verbinden:

   Per ssh auf den Raspberry-Pi (Adresse des Pi muss bekannt sein)     
   In unseren Fall war diese 192.168.24.134  
   `ssh pi@192.168.24.134`  
2. Ermitteln des Netzwerknamens:  

   Um verfügbare Verbindungen anzuzeigen: `sudo nmcli -p connection show`  
   Entsprechenden Netzwerknamen heraussuchen, per default: "Wired connection 1"  
3. Ändern der Ip: 

   Es müssen sowohl Ip-Adresse, Gateway als auch der DNS-Server angepasst werden.  
   Die statische Ip Adresse soll 192.168.24.183 lauten, Gateway und DNS-Server sollen 192.168.24.254 lauten.  
   Dies wird mit folgenden drei Zeilen erreichen:  
   `sudo nmcli c mod "Wired connection 1" ipv4.addresses 192.168.24.183/24  ipv4.method manual`  
   `sudo nmcli con mod "Wired connection 1" ipv4.gateway 192.168.24.254`  
   `sudo nmcli con mod "Wired connection 1" ipv4.dns 192.168.24.254`  
4. Neustart des Netzwerks:  

   
   Damit die Änderungen wirksam sind muss die Verbindung des Netzwerks neu gestartet werden.
   Dies wird mit folgendem Befehl erreicht:
   (Achtung: Hierdurch wird die Verbindung getrennt und es muss sich per ssh über die neue IP verbunden werden.)  
   `sudo nmcli -p connection show "Wired connection 1"`

# Anlegen von Benutzern auf Raspberry Pi  
1. Neuen Benutzer anlegen:  

   -m steht dabei für user mit Home-Verzeichnis anlegen  
   Wir wollen sowohl willi als auch fernzugriff anlegen  
   `sudo useradd -m willi`
   `sudo useradd -m fernzugriff`

2. Neuen benutzern ein Passwort zuweisen: 

   Nach Eingabe dieses Befehls muss das Passwort zweimal unsichtbar eingegeben werden  
   `sudo passwd willi` (wir haben willi als Passwort gewählt)  
   `sudo passwd fernzugriff` (hier haben wir fernzugriff als Passwort gewählt)

3. Gruppen zuweisen: 

   Wir weisen 'willi' der Gruppe users zu:  
   `sudo usermod -g users willi` (-g steht für die Haupt-Gruppe des Benutzers )  
   Und wir weisen 'fernzugriff' der Gruppe sudo zu:  
   `sudo usermod -aG sudo fernzugriff` (-a muss mit -G geführt werden, da der Nutzer sonst aus allen anderen Gruppen entfernt wird und dadurch unter anderem aus der Gruppe admin fliegen kann und dann root Rechte verlieren würde)

4. Nur fernzugriff soll ssh-Rechte besitzen:  

   Um zu gewährleisten, dass nur der user 'fernzugriff' per ssh auf den Raspberry-Pi zugreifen kann, müssen wir die config-Datei des ssh-daemons anpassen. Dort können wir mithilfe des Schlüsselworts 'AllowUsers' bestimmten Benutzer ssh Rechte exklusiv zuteilen. Alle nicht hier gelisteten Benutzer dürfen dann nicht mehr per ssh zugreifen.  
   Der Befehl zum öffnen der Datei für den ssh Daemon lautet:  
   `sshd_config`  
   In der config Datei dann 'ferzugriff' als Benutzer hinzufügen:  
   `AllowUsers fernzugriff`

# Deployment mit Docker  
1. Auf dem Raspberry das Projekt aus Git hinzufügen  

   `git clone https://github.com/RonjaVerenaUder/ToDo-Listenverwaltung.git`  

2. In das entsprechenden Directory wechseln:  

   `cd ToDo-Listenverwaltung`  

3. Docker compose ausführen  

   `docker-compose up - d`  

4. Der Server sollte nun unter dem Port 5000 erreichbar sein.  

# IPs 
Raspberry PI: 192.168.24.183  
Gateway: 192.168.24.254  
Dns: 192.168.24.254  
# TODO Python Dokument nochmal überarbeiten
