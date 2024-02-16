#!/bin/bash




if [ $# -ne 1 ]; then
  echo "Uso: $0 <nombre-archivo-csv>"
  exit 1
fi

archivo_csv="$1"

echo "*************** HBBQO: El Nostre catàleg alfabètic es: ********************"
echo "*****************************************************************************"

# Ordena alfabéticamente por el título de la película (columna 1)
sort -t ',' -k1,1 "$archivo_csv" | while IFS=, read -r linea; do
    titulo=$(echo "$linea" | cut -d ',' -f1)
    any=$(echo "$linea" | cut -d ',' -f4)
    clasificacion=$(echo "$linea" | cut -d ',' -f2)
    descripcion=$(echo "$linea" | cut -d ',' -f3)
    valoracion=$(echo "$linea" | cut -d ',' -f5)
    muestra=$(echo "$linea" | cut -d ',' -f6)

    # Unir los campos
    pelicula="$titulo\nAño: $any\nClasificación: $clasificacion\nDescripción: $descripcion\nValoración de usuarios: $valoracion\nMuestra: $muestra"

    # Mostrar los campos unidos
    echo -e "$pelicula"
    echo "*****************************************************************************"

    # Esperar a que el usuario presione Enter antes de mostrar la siguiente película
    read -p "Presiona Enter para ver la siguiente película..."
done




