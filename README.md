# ToDo-Listenverwaltung
Entwurf und Implementierung einer Rest-Schnittstelle mit Open Api
Von Ronja-Verena Uder und Lukas Gedrat
# Statische IP-Adresse auf Raspberry-Pi
1. Mit Rasberry Pi verbinden:

   Per ssh auf den Raspberry-Pi (Adresse des Pi muss bekannt sein)     
   In unseren Fall war dies 192.168.24.134  
   `ssh pi@192.168.24.134`  
2. Rausfinden des Netzwerknamens:  

   Um verfügbare verbindungen anzuzeigen: `sudo nmcli -p connection show`  
   Entsprechenden Netzwerknamen raussuchen, default: "Wired connection 1"  
3. Ändern der Ip 

   Nun müssen sowohl Ip-Adresse, Gateway als auch der DNS-Server angepasst werden.  
   Unsere statische Ip Adresse soll 192.168.24.183 lauten, Gateway und DNS-Server sollen 192.168.24.254 lauten.  
   Dies kann man mit folgenden drei Zeilen erreichen:  
   `sudo nmcli c mod "Wired connection 1" ipv4.addresses 192.168.24.183/24  ipv4.method manual`  
   `sudo nmcli con mod "Wired connection 1" ipv4.gateway 192.168.24.254`  
   `sudo nmcli con mod "Wired connection 1" ipv4.dns 192.168.24.254`  
4. Neustart des Netzwerks  

   Um die Änderungen wirksam zu machen müssen wir die Verbindung des Netzwerks neustarten.
   Dies erreicht man mit folgendem Befehl: (Achtung: Hierdurch wird die Verbindung getrennt und es muss sich per ssh über die neue IP verbunden werden.)  
   `nmcli -p connection show "Wired connection 1"`

# Anlegen von Benutzern auf Raspberry Pi

TODO
# IPs 
Raspberry PI: 192.168.24.183
Gateway: 192.168.24.254
Dns: 192.168.24.254

