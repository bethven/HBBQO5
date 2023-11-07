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




