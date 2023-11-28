#!/bin/bash

# Nombre del archivo CSV
archivo=HBBQO.csv

# Obtener una película aleatoria y guardar sus datos excepto el año
pelicula=$(shuf -n 1 "$archivo")
titulo=$(echo "$pelicula" | cut -d ',' -f1)
ratinglevel=$(echo "$pelicula" | cut -d ',' -f2)
ratingdescription=$(echo "$pelicula" | cut -d ',' -f3)
user_rating_score=$(echo "$pelicula" | cut -d ',' -f5)
user_rating_size=$(echo "$pelicula" | cut -d ',' -f6)

echo "************************"
echo $titulo
echo $rattinglevel
echo $ratingdescription
echo $user_rating_score
echo $user_rating_size
echo "***********************"

# Función para obtener dos años diferentes al de la película seleccionada
function obtener_dos_anios() {
    while true; do
        anio1=$(shuf -n 1 "$archivo" | cut -d ',' -f4)
        anio2=$(shuf -n 1 "$archivo" | cut -d ',' -f4)
        if [ "$anio1" != "$anio2" ] && [ "$anio1" != "$release_year" ] && [ "$anio2" != "$release_year" ]; then
            break
        fi
    done
}

# Guardar el año de la película seleccionada
release_year=$(echo "$pelicula" | cut -d ',' -f4)

# Obtener dos años diferentes al de la película seleccionada
obtener_dos_anios

# Mezclar los tres años en un arreglo para mostrarlos de forma aleatoria
opciones=("$release_year" "$anio1" "$anio2")
opciones_aleatorias=($(printf "%s\n" "${opciones[@]}" | shuf))

# Mostrar las opciones al usuario
echo "Selecciona el año correcto:"
echo "1. ${opciones_aleatorias[0]}"
echo "2. ${opciones_aleatorias[1]}"
echo "3. ${opciones_aleatorias[2]}"

# Leer la respuesta del usuario
read -p "Introduce el número correspondiente al año correcto: " respuesta

# Comprobar si la respuesta es correcta
if [ "$respuesta" = "1" ] && [ "${opciones_aleatorias[0]}" = "$release_year" ]; then
    echo "¡Felicidades! Has acertado."
elif [ "$respuesta" = "2" ] && [ "${opciones_aleatorias[1]}" = "$release_year" ]; then
    echo "¡Felicidades! Has acertado."
elif [ "$respuesta" = "3" ] && [ "${opciones_aleatorias[2]}" = "$release_year" ]; then
    echo "¡Felicidades! Has acertado."
else
    echo "Lo siento, no has acertado."
    echo "El año correcto es: $release_year"
fi
