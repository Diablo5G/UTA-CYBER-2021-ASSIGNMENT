#!/bin/bash

# STEP 1: INVESTIGATION PREPARATION
mkdir Lucky_Duck_Investigations && cd $_
mkdir Roulette_Loss_Investigation && cd $_
mkdir Player_Analysis Dealer_Analysis Player_Dealer_Correlations
touch ./Dealer_Analysis/Notes_Dealer_Analysis
touch ./Player_Analysis/Notes_Player_Analysis
touch ./Player_Dealer_Correlations/Notes_Player_Dealer_Correlations

# STEP 2: GATHERING EVIDENCE
cd ../../
wget "https://tinyurl.com/3-HW-setup-evidence" && chmod +x ./3-HW-setup-evidence && ./3-HW-setup-evidence
mv ./Dealer_Schedules_0310/031{0,2,5}_Dealer_schedule ./Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis
mv ./Roulette_Player_WinLoss_0310/031{0,2,5}_win_loss_player_data ./Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/

# STEP 3: CORRELATING THE EVIDENCE
# Complete the player analysis.
cd ./Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis
cat 03* | grep - > Roulette_Losses
cat 03* | grep "Mylie Schmidt" | wc -l

# Complete the dealer analysis.
# Before running this part, copy the appropriate script files in the directory
cd ../Dealer_Analysis
./0310_Dealers_Loss.sh >> Dealers_working_during_losses
./0312_Dealers_Loss.sh >> Dealers_working_during_losses
./0315_Dealers_Loss.sh >> Dealers_working_during_losses

