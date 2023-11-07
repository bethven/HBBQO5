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

Tasca1-2() {
  clear
  echo "*************** HBBQO: Catàleg cronològic de pel·lícules (de més modernes a més antigues): ********************"
  echo "*****************************************************************************"

  ./Tasca1-2.sh $base_de_datos

  echo "Presiona ENTER para continuar..."
  read -n 1 -s
}

Tasca1-3() {
  clear
  echo "*************** HBBQO: Catàleg de pel·lícules per valoració d'usuaris (de més alta a més baixa):********************"
  echo "*****************************************************************************"

  ./Tasca1-3.sh $base_de_datos

  echo "Presiona ENTER para continuar..."
  read -n 1 -s
}

opcioNoValida() {
  echo "Opción incorrecta, debe ser un valor de 0 a 4"
  sleep 2
  clear
}

opcio=1

while [ $opcio -ne 0 ]; do
  clear

  echo "----------------------------------"
  echo "Base de Datos del Catálogo de HBBQO"
  echo "----------------------------------"
  echo "1.- Llistats de les pel·lícules del catàleg."
  echo "2.- Cerca d’una pel·lícula al catàleg."
  echo "3.- Joc de preguntes sobre les pel·lícules."
  echo "4.- Gestió de la base de dades de pel·lícules."
  echo "0.- Sortir"
  echo -n "Escull una opcio: "
  read opcio

  case $opcio in
    1)
      subopcion=1  # Reinicializa subopcion antes de mostrar el submenú
      while [ $subopcion -ne 0 ]; do
        menuListadosPeliculas
        case $subopcion in
          1) Tasca1-1 ;;
          2) Tasca1-2 ;;
          3) Tasca1-3 ;;
          0) ;;
          *) opcioNoValida ;;
        esac

        if [ $subopcion != 0 ]; then
          echo "Presiona ENTER para volver al menú anterior..."
          read -n 1 -s
        fi
      done
      ;;
    2) enDesarrollo ;;
    3) enDesarrollo ;;
    4) enDesarrollo ;;
    0)
      echo "Gràcies per la vostra visita a HBBQO..."
      sleep 2
      ;;
    *) opcioNoValida ;;
  esac

  if [ $opcio -ne 0 ]; then
    echo "Presiona ENTER para continuar"
    read tecla
  fi
done



