#!/bin/bash
 tornar=0



, read -r titol level descripcio any val_usu mida_mostra; do
     if [ "$titol" != "$titol_previ" ];
    then
      echo "*Títol: $titol" 
      echo "*Any: $any         *Nivell de classificació: $level"
      echo "*Descripció: $descripcio"
      echo "*Valoració dels usuaris: $val_usu         *Mida de la mostra: $mida_mostra"
      echo "*********************************************************"
      fi
     titol_previ=$titol
    done < CadenaIAny.txt
  fi

echo "Vols tornar a la cerca (S/N) ?"
read siono

if [ "$siono" != "S" ] && [ "$siono" != "s" ]; then
    echo "*********************************************************"
    echo "Tornant al menu..."
    tornar=1
    else
        # Esto else deberia servir para que el usuario cambie el valor de los argumentos en el terminal
        # y asi continuar con el scrip de la Tasca2-2.
      tornar=0
     fi
  echo ""
done
