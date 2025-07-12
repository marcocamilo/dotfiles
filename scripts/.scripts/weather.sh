#!/bin/bash

# The coordinates sent to YR.
LOCATION_DATA=$(curl -s "https://ipinfo.io/json")
LATITUDE=$(echo "$LOCATION_DATA" | jq -r '.loc' | cut -d',' -f1)
LONGITUDE=$(echo "$LOCATION_DATA" | jq -r '.loc' | cut -d',' -f2)

# Fetch weather data from the MET API
weather_data_lund=$(curl -A "sb-weather/0.1" -s "https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=${LATITUDE}&lon=${LONGITUDE}")
today_weather=$(echo "${weather_data_lund}" | jq -r '.properties.timeseries[0].data.next_6_hours.summary.symbol_code')
today_temp=$(echo "${weather_data_lund}" | jq -r '.properties.timeseries[0].data.instant.details.air_temperature')

# Round temperature function
round() {
    round_n=$(echo "$1" | awk '{print ($0>0)?(($0-int($0)<0.5)?int($0):(int($0)+1)):((int($0)-$0<0.5)?int($0):int($0)-1)}')
    if [ $((round_n)) -lt 0 ]; then
        echo -n ""
    else
        echo -n "+"
    fi
    echo -n "${round_n}°C"
}

# Declare an associative array to map weather symbols to icons
declare -A symbol_map

# Map of weather icon names and human readable expressions
symbol_map["clearsky_day"]=""
symbol_map["clearsky_night"]=""
symbol_map["cloudy"]=""
symbol_map["fair_night"]=""
symbol_map["fair_day"]=""
symbol_map["fog"]=""
symbol_map["heavyrain"]=""
symbol_map["heavysleet"]=""
symbol_map["lightrain"]=""
symbol_map["lightrainshowers_day"]=""
symbol_map["lightsleet"]=""
symbol_map["partlycloudy_day"]=""
symbol_map["partlycloudy_night"]=""
symbol_map["rain"]=""
symbol_map["sleet"]=""
symbol_map["snow"]=""
symbol_map["lightsnow"]=""
symbol_map["rainshowersandthunder_night"]=""
symbol_map["rainshowersandthunder_day"]=""
symbol_map["rainandthunder"]=""
symbol_map["heavyrainandthunder"]=""
symbol_map["heavyrainshowersandthunder_night"]=""
symbol_map["sleetshowers_night"]=""
symbol_map["rainshowers_day"]=""
symbol_map["heavyrainshowers_day"]=""
symbol_map["lightrainshowers_day"]=""
symbol_map["rainshowers_night"]=""
symbol_map["heavyrainshowers_night"]=""
symbol_map["lightrainshowers_night"]=""

# Function to print the human-readable weather symbol
human_readable() {
    if [[ -v symbol_map[$1] ]]; then
        echo ${symbol_map[$1]}
    else
        echo "$1"
    fi
}

# Output temperature and weather
echo "$(human_readable "$today_weather")  $(round "$today_temp")"
