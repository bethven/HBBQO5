#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Uso: $0 <nombre-archivo-csv>"
  exit 1
fi

archivo_csv="$1"

echo "*************** HBBQO: El Nostre catàleg alfabètic es: ********************"
echo "*****************************************************************************"

# Ordena alfabéticamente por el título de la película (columna 1)
sort -t ',' -k1,1 "$archivo_csv" | awk -F ',' 'BEGIN {
    printf "Título\nAño\nClasificación\nDescripción\nValoración de usuarios\nMuestra\n*****************************************************************************\n"
}
{
    printf "%s\nAño: %s\nClasificación: %s\nDescripción: %s\nValoración de usuarios: %s\nMuestra: %s\n*****************************************************************************\n", $1, $4, $2, $3, $5, $6
    printf "Presiona Enter para ver la siguiente película..."
    getline
}' "$archivo_csv"

echo "Gracias por revisar el catálogo de películas de HBBQO."

