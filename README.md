# Mariposas – Butterfly Image Classifier

Mariposas ist ein Java-basiertes Web-Projekt, das mithilfe der Deep Java Library (DJL) und Spring Boot Bilder von Schmetterlingen klassifizieren kann. Die Anwendung erkennt, um welche Art es sich bei einem hochgeladenen Schmetterlingsfoto handelt, und zeigt das Resultat inklusive Wahrscheinlichkeiten an.

## Features

- Klassifikation von Schmetterlingsbildern über ein eigenes Dataset
- Modelltraining mit DJL (PyTorch-Engine)
- REST-API für Bildklassifikation (Spring Boot)
- Weboberfläche zur einfachen Bildauswahl und Anzeige der Vorhersage
- Bereitstellung über Docker und Deployment auf Azure App Service

## Projektstruktur

.
├── RawData/                # Ursprüngliches Bildmaterial (nicht verarbeitet)
├── dataset/                # Vorverarbeitete Bilder, gruppiert nach Klassennamen
├── models/                 # Enthält das trainierte Modell und synset.txt
├── src/
│   └── main/
│       ├── java/           # Spring Boot App & REST Controller
│       └── resources/
│           └── static/     # Web-Oberfläche (HTML, JS, Beispielbilder)
├── Dockerfile              # Containerisierung der Anwendung
├── .gitignore
├── pom.xml                 # Maven-Projektdefinition
└── README.md

## Technologien

- Java 21
- Spring Boot 3.x
- Deep Java Library (DJL) 0.31.0
- PyTorch Engine
- Docker
- Azure App Service

## Setup

### Voraussetzungen
- Java 21
- Maven
- Docker
- Optional: Azure CLI, GitHub CLI

### Anwendung starten (lokal)

./mvnw spring-boot:run

### Docker Build & Run

docker build -t mariposas .
docker run -p 8080:8080 mariposas

### Azure Deployment (Beispiel)

az group create --name mariposa5400 --location switzerlandnorth

az appservice plan create \
  --name mariposa5400 \
  --resource-group mariposa5400 \
  --sku B1 --is-linux

az webapp create \
  --resource-group mariposa5400 \
  --plan mariposa5400 \
  --name mariposa5400 \
  --container-image-name iliasbro/mariposas:latest

az webapp config appsettings set \
  --resource-group mariposa5400 \
  --name mariposa5400 \
  --settings WEBSITES_PORT=8080

## Dataset

Die Bilder befinden sich im Ordner dataset/ mit Unterordnern pro Schmetterlingsart (wie in models/synset.txt). Pro Art existieren mehrere Bilder als Trainingsbasis.

## Lizenz

Dieses Projekt ist Teil eines Studienprojekts an der ZHAW und steht unter keiner offiziellen Lizenz.

Kontakt: iliasehrensperger@students.zhaw.ch