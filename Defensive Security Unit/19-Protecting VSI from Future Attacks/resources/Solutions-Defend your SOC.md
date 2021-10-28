<img align="left" width="320" height="90" src="https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Splunk_logo.png">

# Solution : Part 2 - Defend Your SOC

---
 
 
## Windows Server Logs
#### Report Analysis for Severity

Did you detect any suspicious changes in severity?

- **ANS:** Yes. The percentages changed from:

   ```
   High: 6.91%
   Informational: 93.09%
   ```

![Report_W_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_W_2.png)

to:
	
   ```
   High: 20.22%
   Informational: 79.78%
   ```

![Report_WA_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_WA_1.png)

- This indicates an increase in the high severity cases.


#### Report Analysis for Failed Activities

Did you detect any suspicious changes in failed activities?

- **ANS:** Yes. The percentages changed from:

   ```
   success: 97.02%
   failure: 2.98%
   ```

![Report_W_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_W_3.png)

to:

   ```
   success: 98.44%
   failure: 1.56%
   ```

![Report_WA_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_WA_2.png)

- This indicates that there is not a major change in the cumulative failure of events. 
   
   
---


#### Alert Analysis for Failed Windows Activity

Did you detect a suspicious volume of failed activity? If so, what was the count of events in the hour(s) it occurred? When did it occur?

![Alert_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Alert_1.png)

![Suspicious_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Suspicious_1.png)

- **ANS:** There is some potential suspicious activity for failed activity between 8 a.m. and 9 a.m. on Weds, March 25th. The count of activity is 35 events during this hour, "A privileged service was called, where the user account was deleted, Domain Policies were changed, A user account was created, An attempt was made to reset an accounts password, and A computer account was deleted."

Would your alert be triggered for this activity?

- **ANS:** Yes, it would have alerted the SOC Analyst of the suspicious logons-failed. 

After reviewing, would you change your threshold from what you you previously selected?

- **ANS:** No, it is set appropriately for the hourly settings.

                
   
#### Alert Analysis for Successful Logons

Did you detect a suspicious volume of successful logons? If so, what was the count of events in the hour(s) it occurred? Who is the primary user logging in? When did it occur?

![Alert_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Alert_2.png)
![Suspicious_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Suspicious_2.png)
![User_J](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/User_J.png)

- **ANS:** There is some potential suspicious activity for failed activity at 11 a.m and 12 p.m. on Weds, March 25th. The count of activity is 196 at 11 a.m. and 77 at 12 p.m. The primary user logging in is _**user j**_.

Would your alert be triggered for this activity?

- **ANS:** Yes, it would have alerted the SOC Analyst of the suspicious logons. 

After reviewing, would you change your threshold from what you you previously selected?

- **ANS:** No, it is set appropriately for the hourly settings, it would have also triggered an alert for the activity for the second hour from 12 p.m. to 1 p.m. on the same day.


#### Alert Analysis for Deleted Accounts

Did you detect a suspicious volume of deleted accounts?  

![Alert_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Alert_3.png)  

![Suspicious_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Suspicious_3.png)  

- **ANS:** There was no suspicious activity of deleted accounts.


   
---


#### Dashboard Analysis for Time Chart of Signatures

- Does anything stand out as suspicious? What signatures stand out?

  - **ANS:** Yes, the signatures that have suspicious activity are: an attempt was made to reset a users password (39.955%), a user account was locked out (34.003%), and an account was successfully logged on (8.111%).

**Before Windows Server Attack Dashboard**

![Dashboard_V_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_1.png)
![Dashboard_V_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_2.png)
![Dashboard_V_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_3.png)


**Dashboad after the Windows Server Attack**

![Dashboard_V_7](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_7.png)
![Dashboard_V_8](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_8.png)
![Dashboard_V_9](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_9.png)

- What time did it start and stop for each signature? What is the peak count of the different signatures?

![Suspicious_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Suspicious_4.png)

  **ANS:** 

![805](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/805.png)
![896](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/896.png)
- `A user account was locked out:` Started around `1 a.m. and ended at 3 a.m. on March 25th.` The peak count was `896`, and the total for the two hours was `(805 + 896 = 1701).`

![1258](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/1258.png)
![761](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/761.png)
  - `An attempt was made to reset a users password:` Started around `9 a.m. and ended at 11 a.m. on March 25th.` The peak count was `1,258`, and the total for the two hours was `(1258 + 761 = 2019)`.

![196](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/196.png)
![77](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/77.png) 
  - `The account was successfully logged on:` Started around `11 a.m. and ended at 1 p.m. on March 25th.` The peak count was `196`, and the total for the two hours was `(196 + 77 = 273)`.  



 #### Dashboard Analysis for Users

- Does anything stand out as suspicious? Which users stand out?

  - **ANS:** Yes, the users that have suspicious activity are users _**A**_, _**K**_, and _**J**_.

- What time did it begin and stop for each user? What is the peak count of the different user?

  **ANS:** 
  
![799](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/799.png)
![984](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/984.png)

  - **User A**: Started around `1 a.m. and ended at 3 a.m. on March 25th.` Peak count was `984`, and the total for the two hours was `(799 + 984 = 1783)`.

![1256](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/1256.png)
![761](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/761.png)

  - **User K**: Started around `9 a.m. and ended at 11 AM on March 25th.` Peak count was `1,256`, and the total for the two hours was `(1256 + 761 = 2017)`. 

![196](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/196.png)
![82](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/82.png)

  - **User J**: Started around `11 a.m. and ended at 1 p.m. on March 25th.` Peak count was `196`, and the total for the two hours was `(196 + 82 = 278)`.  

![Suspicious_4](https://github.com/)
    

#### Dashboard Analysis for Signatures with Bar, Graph, Pie Charts

- Does anything stand out as suspicious?

  - **ANS:** No.

- Do the results match your findings in your time chart for signatures?
  
  - **ANS:** All Charts are showing the same information as above for the Signatures.
			

#### Dashboard Analysis for Users with Bar, Graph, Pie Charts

- Does anything stand out as suspicious?
  
  - **ANS:** No

- Do the results match your findings in your time chart for users?

  - **ANS:** All Charts are showing the same information as above for the Users.


#### Dashboard Analysis for Users with Statistical Chart   

- What would be the advantage/disadvantage of using this report, compared to the other user panels you created?

  - **ANS:** There is only one advantage of the stats chart, as it will only give the total count of the users activity or the percentage of the activity. However, the disadvantage of the stats chart compared to a chart will show a cumulative perspective, while a time chart shows the suspicious activity over a more specific, and shorter time frame.
     
     
---


### Apache WebServer Logs 
   
#### Report Analysis for Methods

- Did you detect any suspicious changes in HTTP methods? If so, which one?

  - **ANS:** Yes, there was a suspicious change in the HTTP `POST method`, which was raised from `1%` to `29%`or the `count` jumped from `106` to `1324`.

![Report_X_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_X_1.png)
![Report_Z_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_Z_1.png)

- What is that method used for?

  - **ANS:** `POST` is used to submit or update information to a web server.
							
   
#### Report Analysis for Referrer Domains

- Did you detect any suspicious changes in referrer domains?
	
  - **ANS:** There were no major suspicious referrers during the attack. Only minor changes to the first two domains by a couple of percentages.

![Report_X_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_X_2.png)
![Report_Z_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_Z_2.png)

#### Report Analysis for HTTP Response Codes

- Did you detect any suspicious changes in HTTP response codes? 
									
  - **ANS:** There are several small changes, but the most prominent is the `404` response code, which increased from `2% to 15%`. The `200` response code went down from `91% to 83%`.

![Report_X_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_X_3.png)  
![Report_Z_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_Z_3.png)
    


---


#### Alert Analysis for International Activity

- Did you detect any suspicious volume of international activity? If so what was the count of the hour it occurred in?

  - **ANS:** There was activity in `Ukraine` between `8 p.m. and 9 p.m. on Weds, March 25th,` and had a count of `935` events.
    
- Would your alert be triggered for this activity?  
  
  - **ANS:** Yes, as the threshold was set at `200`, so this activity would be triggered as part of the alert.  
  
- After reviewing, would you change the threshold you previously selected?
  
  - **ANS:** No, as it’s above the activity set threshold.

![Report_Z_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_Z_4.png)   


#### Alert Analysis for HTTP POST Activity

- Did you detect any suspicious volume of HTTP POST activity? If so, what was the count of the hour it occurred in and when did it occur?

  - **ANS:** There was a spike in `POST` method activity between `8 p.m. and 9 p.m. on Weds, March 25th`, and had a count of `1,296` events.

- After reviewing, would you change the threshold that you previously selected?

  - **ANS:** No, the threshold set is at 15 counts, this would have been triggered.

![Report_Z_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_Z_5.png)  



---



#### Dashboard Analysis for Time Chart of HTTP Methods
  
- Does anything stand out as suspicious?

  - **ANS:** Yes, there were suspicious activities of the `POST` and `GET` method.

- What was the method that seems to be used in the attack? What time did it begin and end, and what was the peak count of the top method during the attack?
  
  - **ANS:**
    
![1296](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/1296.png)  
 
    - The `POST` method was used, starting at `8 p.m. and ending at 9 p.m.` The peak count was `1,296`.
    
![729](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/729.png)

    - The `GET` method was used, starting at `6 p.m. and ending at 7 p.m.` The peak count was `729`.    

#### Dashboard Analysis for Cluster Map
  
- Does anything stand out as suspicious? What new country, city on the map has a high volume of activity?

  - **ANS:** Yes, there is suspicious activity in `Ukraine`.

![Pie_Chart_V_6](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Pie_Chart_V_6.png)  

- What is the count of that country, city?
  
  - **ANS:** 
    - When zoomed in, we can see the cities in Ukraine are:  
      - **Kiev**: Count of `439`

![Geostats_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Geostats_1.png)

      - **Kharkiv**: Count of `433` 
      
![Geostats_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Geostats_2.png)

      - **Lvov**: Count of `5`  

![Geostats_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Geostats_3.png)

#### Dashboard Analysis for URI Data

- Does anything stand out as suspicious? What URI is being hit the most?
  
  - **ANS:** Yes, there is suspicious activity against the main VSI logon page: `/VSI_Account_logon.php`.

![Bar_Chart_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Bar_Chart_1.png)

- Based on the URI being accessed, what could the attacker potentially be doing?	
  
  - **ANS:** The attacker may be trying to brute force the VSI logon page.

**Before Apache WebServer Logs Attack Dashboard**

![Dashboard_V_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_4.png)
![Dashboard_V_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_5.png)
![Dashboard_V_6](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_6.png)

**Dashboad after the Apache WebServer Logs Attack**  

![Dashboard_V_10](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_10.png)
![Dashboard_V_11](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_11.png)
![Dashboard_V_12](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_12.png)


---
---
