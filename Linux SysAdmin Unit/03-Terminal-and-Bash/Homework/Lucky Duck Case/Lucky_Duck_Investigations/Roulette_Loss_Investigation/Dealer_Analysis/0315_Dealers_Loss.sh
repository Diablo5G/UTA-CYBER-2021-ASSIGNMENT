#! /bin/sh
# this script outputs the name of dealer at the time of major losses on march 15
echo "March 15"
awk '/0[58].+ AM|02.+ PM/ {print $1,$2,$5,$6}' 0315_Dealer_schedule
echo 