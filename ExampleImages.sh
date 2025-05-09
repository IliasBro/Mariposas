#!/bin/bash

# Pfade
SYNSET_FILE="models/synset.txt"
DATASET_DIR="dataset"
TARGET_DIR="src/main/resources/static/images"

# Zielverzeichnis erstellen, falls es nicht existiert
mkdir -p "$TARGET_DIR"

# Jede Zeile in synset.txt entspricht einem Klassennamen
while IFS= read -r class_name; do
    class_path="$DATASET_DIR/$class_name"
    if [ -d "$class_path" ]; then
        first_image=$(find "$class_path" -type f \( -iname '*.jpg' -o -iname '*.png' \) | sort | head -n 1)
        if [ -n "$first_image" ]; then
            cp "$first_image" "$TARGET_DIR/${class_name}.jpg"
            echo "✅ Bild für $class_name kopiert."
        else
            echo "⚠️ Kein Bild in $class_path gefunden."
        fi
    else
        echo "❌ Ordner $class_path existiert nicht."
    fi
done < "$SYNSET_FILE"
