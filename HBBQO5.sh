#!/bin/bash

# Comprobar si se proporcionó un argumento para el nombre de la base de datos
if [ $# -ne 1 ]; then
  echo "Uso: $0 <nombre-base-datos>"
  exit 1
fi

base_de_datos="$1"

enDesarrollo() {
  clear
  echo "En desarrollo"
  echo "Presiona cualquier tecla para continuar..."
  read -n 1
  clear
}

# Función para mostrar el menú de listados de películas
menuListadosPeliculas() {
  subopcion=1 
  clear
  echo "--------------------------------------------------"
  echo "1 - Listados de las películas del catálogo."
  echo "--------------------------------------------------"
  echo "1-1 Mostrar catálogo alfabético."
  echo "1-2 Mostrar catálogo cronológico."
  echo "1-3 Mostrar catálogo por valoración."
  echo "0 Volver al menú anterior."
  echo -n "Selecciona una opción: "
  read subopcion
}

# Función para mostrar el catálogo alfabético
Tasca1-1() {
  clear
  echo "*************** HBBQO: El Nostre catàleg alfabètic es: ********************"
  echo "*****************************************************************************"

  # Llama al script de catálogo alfabético (catalogo_alfabetico.sh) para mostrar el catálogo
  ./Tasca1-1.sh $base_de_datos

  echo "Presiona ENTER para continuar..."
  read -n 1 -s
}




