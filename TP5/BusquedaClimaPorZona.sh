#!/bin/bash


API_KEY="963b5211372649538a5222915241106"


clima() {
    ciudad=$1
    respuesta=$(curl -s "http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$ciudad&aqi=no")


    if command -v jq &> /dev/null; then
        local nombre_ciudad=$(echo $respuesta | jq -r '.location.name')
        local region=$(echo $respuesta | jq -r '.location.region')
        local pais=$(echo $respuesta | jq -r '.location.country')
        local temperatura=$(echo $respuesta | jq -r '.current.temp_c')
        local condicion=$(echo $respuesta | jq -r '.current.condition.text')

        echo "En la ciudad: $nombre_ciudad, $region, $pais"
        echo "Hay una temperatura: $temperatura °C"
        echo "Condición: $condicion"
    else
        echo "Respuesta de la API: $respuesta"
    fi
}


echo "Ingresa el nombre de una ciudad para obtener el clima actual:"
read ciudad

clima $ciudad

