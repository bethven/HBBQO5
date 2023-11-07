#!/bin/bash


if [ $# -ne 1 ]; then
  echo "Uso: $0 <nombre-archivo-csv>"
  exit 1
fi

archivo_csv="$1"

# Ordena por valoración de usuarios (columna 5) de mayor a menor valoración
sort -t ',' -k5,5nr "$archivo_csv" | while read -r linea; do
    titulo=$(echo "$linea" | cut -d ',' -f1)
    any=$(echo "$linea" | cut -d ',' -f4)
    clasificacion=$(echo "$linea" | cut -d ',' -f2)
    descripcion=$(echo "$linea" | cut -d ',' -f3)
    valoracion=$(echo "$linea" | cut -d ',' -f5)
    muestra=$(echo "$linea" | cut -d ',' -f6)

    # Unir los campos
    pelicula="$titulo\nAño: $any\nClasificación: $clasificacion\nDescripción: $descripcion\nValoración de usuarios: $valoracion\nMuestra: $muestra"

    # Mostrar los campos unidos
    echo "*************** HBBQO: Catàleg de pel·lícules per valoració d'usuaris (de més alta a més baixa): ********************"
    echo "*****************************************************************************"
    echo -e "$pelicula"
    echo "*****************************************************************************"

    # Puedes realizar cualquier procesamiento adicional que necesites aquí

done

