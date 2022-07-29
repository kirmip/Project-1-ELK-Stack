#!/bin/bash

#Message for user to get the correct format to run the script
incorrect_use() {
    echo -e "\n./roulette_dealer_finder_by_time <DAY> <TIME> <AM/PM> <Game>"
}

#Checking the number of arguments received
if [ $# -ne 4 ]; then
    incorrect_use
    exit 1
fi

#Assigned variable to the argument value received
time=$1
ampm=$2
date=$3
game=$4


echo -e "\nDealer on ${date} dealing ${game}:\n"

#Getting the first line to find the position of game
gameline="$(grep -i ${game} ${date}_Dealer_schedule)"
variable=( $gameline )

#Variable to keep track of the position of the game specified
i=0

#Loop through the first line
for gameword in $gameline; do

  #Increment the counter as the game is not found
  i=$(($i+1))

  #Check if the game exists in the current data
  if grep -q "${game^^}" <<< "${gameword^^}"; then

	#Store its position/index of the game dealer first name in a variable
	gameposition=$i

	#Print the time, dealer first and last name dealing the game and the date specified
	grep -e "${time} ${ampm^^}" ${date}_Dealer_schedule | awk '{print $1, $2, $('$gameposition'), $('$gameposition+1')}'
	break
  fi
done

#Warning displayed if game not found in data
if [ $i == ${#variable[@]} ]; then
  echo "Please check your input, game cannot be found in the data"
fi


