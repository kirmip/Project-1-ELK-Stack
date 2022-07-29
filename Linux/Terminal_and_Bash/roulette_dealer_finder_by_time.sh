#!/bin/bash

#Message for user to get the correct format to run the script
incorrect_use() {
    echo -e "\n./roulette_dealer_finder_by_time <DAY> <TIME> <AM/PM>"
}

#Checking the number of arguments received
if [ $# -ne 3 ]; then
    incorrect_use
    exit 1
fi

#Assigned variable to the argument value received
day=$1
time=$2
ampm=$3


echo -e "\r\nRoulette Dealer on ${day}:\n"

#Get and display the time and dealer dealing at the specified time and day
grep "${time} ${ampm^^}" ${day}_Dealer_schedule | awk '{print $1, $2, $5, $6}'
