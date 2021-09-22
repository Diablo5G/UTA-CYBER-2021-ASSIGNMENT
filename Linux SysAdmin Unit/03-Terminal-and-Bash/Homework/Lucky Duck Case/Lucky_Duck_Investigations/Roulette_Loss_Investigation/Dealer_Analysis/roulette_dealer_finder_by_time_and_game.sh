#! /bin/bash
# usage: ./roulette_dealer_finder_by_time_and_game.sh [DATE] [TIME] [GAME]
# example: ./roulette_dealer_finder_by_time_and_game.sh 0310 02p.m. roulette
# this script outputs the name of dealer at the time, date and game specified

#extract the time from the argument
time=${2//[!0-9]/}
#extract AM/PM value
clock='AM'
if [[ "$2" == *'p'* ]]; then
  clock='PM'
fi
# turn on case insensitive match
shopt -s nocasematch
# match the game and print corresponding fields
if [[ "BlackJack" =~ .*"$3".* ]]; then
  cat $1_Dealer_schedule | grep $time | grep $clock  | awk '{print $1,$2,$3,$4}' 
else
  if [[ "Roulette" =~ .*"$3".* ]]; then
    cat $1_Dealer_schedule | grep $time | grep $clock  | awk '{print $1,$2,$5,$6}' 
  else
    cat $1_Dealer_schedule | grep $time | grep $clock  | awk '{print $1,$2,$7,$8}'
  fi
fi
