#!/bin/bash
clear
sort -k 4 -t , -n -r $1 > "peliculas_ordenadas.txt"
archivo="peliculas_ordenadas.txt"  # Nombre del archivo ordenado
linea=1
echo "*************** HBBQO: El Nostre catàleg alfabètic es: ********************"
while [ $linea -le 1000 ] 
do
        titol=$(sed -n "${linea}p" "$archivo" | cut -d',' -f1)
        any=$(sed -n "${linea}p" "$archivo" | cut -d',' -f4)
        classificacio=$(sed -n "${linea}p" "$archivo" | cut -d',' -f2)
        descripcio=$(sed -n "${linea}p" "$archivo" | cut -d',' -f3)
        valoracio=$(sed -n "${linea}p" "$archivo" | cut -d',' -f6)
        mostra=$(sed -n "${linea}p" "$archivo" | cut -d',' -f5)

        echo "*****************************************************************************"
        echo "*Títol: $titol"

        echo "*Any: $any	 	 *Nivell de classificació: $classificacio"

        echo "*Descripció: $descripcio"

        echo "*Valoració dels usuaris: $valoracio	 	*Mida de la mostra: $mostra"

    linea=$((linea + 1))
done 
echo "*****************************************************************************"
echo "Premi enter per a continuar"
echo "*****************************************************************************"
read i
rm peliculas_ordenadas.txt
