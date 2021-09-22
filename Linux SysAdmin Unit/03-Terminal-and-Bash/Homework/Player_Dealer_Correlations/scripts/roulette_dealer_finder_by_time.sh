#! /bin/bash
# usage: ./roulette_dealer_finder_by_time.sh [DATE] [TIME]
# example: ./roulette_dealer_finder_by_time.sh 0310 02p.m.
# this script outputs the name of dealer at the time and date specified

#extract the time from the argument
time=${2//[!0-9]/}
#extract AM/PM value
clock='AM'
if [[ "$2" == *'p'* ]]; then
  clock='PM'
fi

#print the corresponding fields
cat $1_Dealer_schedule | grep $time | grep $clock  | awk '{print $1,$2,$5,$6}' 