#!/bin/bash

function MostrarDades {

titol=`head -$i csvOrdenat | tail -1 | cut -d "," -f1`
classificacio=`head -$i csvOrdenat | tail -1 | cut -d "," -f2`
descripcio=`head -$i csvOrdenat | tail -1 | cut -d "," -f3`
any=`head -$i csvOrdenat | tail -1 | cut -d "," -f4`
valoracio=`head -$i csvOrdenat | tail -1 | cut -d "," -f5`
mida=`head -$i csvOrdenat | tail -1 | cut -d "," -f6`

echo "*****************************************************************************"
echo "*Títol:	$titol"
echo "*Any: $any	*Nivell de classificació:	$classificacio"
echo "*Descripció:	$descripcio"
echo "*Valoració dels usuaris: $valoracio	*Mida de la mostra: $mida"

}
clear
echo "*************** HBBQO: El Nostre catàleg alfabètic es: ********************"
liniesbones=`wc -l < $1`
let liniesbones=$liniesbones-1
cat $1 | tail -n $liniesbones | sort >> csvOrdenat
i=1
let i=$i+1
while [ $i -le $liniesbones ]
do
	MostrarDades
	let i=$i+1
done
echo "*****************************************************************************"
echo "Premi enter per a continuar"
echo "*****************************************************************************"
read tecla
rm csvOrdenat