#!/bin/bash
#TASCA 2-2
tornar=0

while [ $tornar -eq 0 ]; do
    if [ $# -ne 3 ]; then
        echo "Uso: $0 <fitxer> <Cadena> <any>"
        exit 1
    fi
  
    fitxer=$1
    cadena="$2"
    any=$3

    titol_previ=""
    grep "$cadena" "$fitxer" | grep "$any" | sort -k1 > CadenaIAny.txt

    if [ ! -s CadenaIAny.txt ]; then
        echo "*********************************************************"
        echo "Pel·lícula no trobada"
        echo "*********************************************************"
    else
        echo "*********************************************************"
        while IFS=, read -r titol level descripcio any val_usu mida_mostra; do
            if [ "$titol" != "$titol_previ" ]; then
                echo "*Títol: $titol"
                echo "*Any: $any         *Nivell de classificació: $level"
                echo "*Descripció: $descripcio"
                echo "*Valoració dels usuaris: $val_usu         *Mida de la mostra: $mida_mostra"
                echo "*********************************************************"
            fi
            titol_previ="$titol"
        done < CadenaIAny.txt
    fi
    
    echo "Vols tornar a fer una cerca (S/N) ?"
    read siono

    if [ "$siono" != "S" ] && [ "$siono" != "s" ]; then
        echo "*********************************************************"
        echo "Tornant al menu..."
        tornar=1
    else
        rm CadenaIAny.txt
        echo "Introdueix els nous arguments:"
        echo "Fitxer:"
        read fitxer
        echo "Cadena:"
        read cadena
        echo "Any:"
        read any

        # Asignar los nuevos valores a las variables para la próxima iteración
        set -- "$fitxer" "$cadena" "$any"
    fi
    
    echo ""
done


