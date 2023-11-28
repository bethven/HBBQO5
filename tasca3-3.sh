#!/bin/bash

# Nombre del archivo CSV
archivo="tu_archivo.csv"

# Obtener una película aleatoria y guardar sus datos excepto la clasificación
pelicula=$(shuf -n 1 "$archivo")
titulo=$(echo "$pelicula" | cut -d ',' -f1)
release_year=$(echo "$pelicula" | cut -d ',' -f4)
user_rating_score=$(echo "$pelicula" | cut -d ',' -f5)
user_rating_size=$(echo "$pelicula" | cut -d ',' -f6)

# Mostrar los datos de la película seleccionada excepto la clasificación
echo "Datos de la película seleccionada (excepto clasificación):"
echo "Título: $titulo"
echo "Año de lanzamiento: $release_year"
echo "User Rating Score: $user_rating_score"
echo "User Rating Size: $user_rating_size"

# Obtener todas las clasificaciones únicas del archivo CSV y ordenarlas alfabéticamente
clasificaciones=$(tail -n +2 "$archivo" | cut -d ',' -f2 | sort -u)

# Mostrar las clasificaciones numeradas al usuario
echo "Selecciona el número correspondiente a la clasificación correcta:"
contador=1
for clasificacion in $clasificaciones; do
    echo "$contador. $clasificacion"
    ((contador++))
done

# Leer la respuesta del usuario
read -p "Introduce el número correspondiente a la clasificación correcta: " respuesta

# Obtener la clasificación correcta de la película seleccionada
clasificacion_correcta=$(echo "$pelicula" | cut -d ',' -f2)

# Verificar si la respuesta es correcta
if [ "$respuesta" -le "$contador" ] && [ "$respuesta" -gt 0 ]; then
    clasificacion_elegida=$(echo "$clasificaciones" | sed -n "${respuesta}p")
    if [ "$clasificacion_elegida" = "$clasificacion_correcta" ]; then
        echo "¡Felicidades! Has acertado."
    else
        echo "Lo siento, no has acertado."
        echo "La clasificación correcta es: $clasificacion_correcta"
    fi
else
    echo "Respuesta inválida. Introduce un número válido."
fi
