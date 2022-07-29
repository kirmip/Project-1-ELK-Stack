#!/bin/bash

#Message for user to get the correct format to run the script
incorrect_use() {
    echo -e "\n./Dealers_Working_During_Losses_Script.sh"
}

#Making sure there are no arguments
if [ $# -ne 0 ]; then
    incorrect_use
    exit 1
fi

#Running all scripts together
echo -e "\nMarch 10 Dealer Schedule"
./Dealer_Analysis_Script.sh 05:00:00 AM 0310_Dealer_schedule
./Dealer_Analysis_Script.sh 08:00:00 AM 0310_Dealer_schedule
./Dealer_Analysis_Script.sh 02:00:00 PM 0310_Dealer_schedule
./Dealer_Analysis_Script.sh 08:00:00 PM 0310_Dealer_schedule
./Dealer_Analysis_Script.sh 11:00:00 PM 0310_Dealer_schedule

echo -e "\nMarch 12 Dealer Schedule"
./Dealer_Analysis_Script.sh 05:00:00 AM 0312_Dealer_schedule
./Dealer_Analysis_Script.sh 08:00:00 AM 0312_Dealer_schedule
./Dealer_Analysis_Script.sh 02:00:00 PM 0312_Dealer_schedule
./Dealer_Analysis_Script.sh 08:00:00 PM 0312_Dealer_schedule
./Dealer_Analysis_Script.sh 11:00:00 PM 0312_Dealer_schedule

echo -e "\nMarch 15 Dealer Schedule"
./Dealer_Analysis_Script.sh 05:00:00 AM 0315_Dealer_schedule
./Dealer_Analysis_Script.sh 08:00:00 AM 0315_Dealer_schedule
./Dealer_Analysis_Script.sh 02:00:00 PM 0315_Dealer_schedule


