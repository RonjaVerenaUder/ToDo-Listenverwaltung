#Dockerfile

#Basisimage für Python-Anwendungen herunterladen
FROM python:3.11-alpine

#Benenne Port, der von der Web-App genutzt wird
EXPOSE 5000

#Notwendige Bibliotheken installieren
RUN pip install flask

#Kopiere lokale Datei in das Container-Image
COPY src/PythonScrip_RestApi.py server.py

#Konfiguriere den Befehl, der im Container ausgeführt werden soll
#(Anwendung Python + Skriptname als Parameter)
ENTRYPOINT [ "python" ]
CMD ["webapp.py" ]

