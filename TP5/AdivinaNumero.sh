#!/bin/bash

Rango=50
Numero_Buscar=$((RANDOM % Rango + 1))
Encontrado=0

while [ $Encontrado -eq 0 ];
 do
  echo "Trata de adivinar el número"
  read -p "Introduce un número: " numero
  if [ $numero -eq $Numero_Buscar ]; then
    echo "¡Lo encontraste!"
    Encontrado=1
  else
      if [ $numero -lt $Numero_Buscar ]; then
       echo "El numero ingresado es mas chico"
      elif [ $numero -gt $Numero_Buscar ]; then
       echo "El numero ingresado es mas grande"
      fi
    echo "No era ese el número, intenta nuevamente."
  fi
done




