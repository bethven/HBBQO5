#!/bin/bash

# Nombre del archivo CSV
archivo=HBBQO.csv

# Selecciona una película incógnita aleatoriamente
pelicula_incognita=$(shuf -n 1 "$archivo" | cut -d ',' -f1)
primer_mitad=$(echo "$pelicula_incognita" | cut -c1-$((${#pelicula_incognita} / 2)))
echo $primer_mitad

# Función para obtener dos películas diferentes a la película incógnita
function obtener_dos_peliculas() {
    while true; do
        pelicula1=$(shuf -n 1 "$archivo" | cut -d ',' -f1)
        pelicula2=$(shuf -n 1 "$archivo" | cut -d ',' -f1)
        if [ "$pelicula1" != "$pelicula_incognita" ] && [ "$pelicula2" != "$pelicula_incognita" ] && [ "$pelicula1" != "$pelicula2" ]; then
            break
        fi
    done
}

# Obtiene dos películas diferentes a la película incógnita
obtener_dos_peliculas

# Obtiene la segunda mitad de los títulos de las dos películas seleccionadas
segunda_mitad_pelicula1=$(echo "$pelicula1" | rev | cut -c1-$((${#pelicula1} / 2)) | rev)
segunda_mitad_pelicula2=$(echo "$pelicula2" | rev | cut -c1-$((${#pelicula2} / 2)) | rev)
segunda_mitad_incognita=$(echo "$pelicula_incognita" | rev | cut -c1-$((${#pelicula_incognita} / 2)) | rev)

# Muestra las opciones al usuario
echo "Elige la posición en la que se encuentra la segunda mitad del título de la película incógnita:"
echo "1. ($segunda_mitad_pelicula1)"
echo "2. ($segunda_mitad_pelicula2)"
echo "3. ($segunda_mitad_incognita)"

# Lee la respuesta del usuario
read -p "Ingrese el número de la opción correcta: " respuesta

# Comprueba si la respuesta es correcta
if [ "$respuesta" = "1" ] && [ "$segunda_mitad_incognita" = "$segunda_mitad_pelicula1" ]; then
    echo "¡Felicidades! Has acertado."
elif [ "$respuesta" = "2" ] && [ "$segunda_mitad_incognita" = "$segunda_mitad_pelicula2" ]; then
    echo "¡Felicidades! Has acertado."
elif [ "$respuesta" = "3" ]; then
    echo "¡Felicidades! Has acertado."
else
    echo "Lo siento, te has equivocado."
    echo "La película incógnita es: $pelicula_incognita"
fi
