#!/bin/bash

#Message for user to get the correct format to run the script
incorrect_use() {
    echo -e "\n./Dealer_Analysis_Script.sh <TIME> <AM/PM> <Dealer_schedule_filename>"
}

#Checking the number of arguments received
if [ $# -ne 3 ]; then
    incorrect_use
    exit 1
fi

#Assigned variable to the argument value received
time=$1
ampm=$2
file=$3

#Getting and display the time and the dealer first and last name
grep "${time} ${ampm^^}" $3 | awk '{print $1, $2, $5, $6}' 
