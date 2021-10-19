
<img align="left" width="80" height="80" src="https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/Splunk%20icon.svg" alt="hacker icon">

## Unit 18 Homework: Lets go Splunking!



### Scenario

We have just been hired as an SOC Analyst by Vandalay Industries, an importing and exporting company.
 
- Vandalay Industries uses Splunk for security monitoring and have been experiencing a variety of security issues against their online systems over the past few months. 
 
- We are tasked with developing searches, custom reports and alerts to monitor Vandalay's security environment in order to protect them from future attacks.


### System Requirements 

Using the Splunk app located in the Ubuntu VM.


### Our Objective 

Utilize Splunk skills to design a powerful monitoring solution to protect Vandaly from security attacks.

After we complete the assignment we are asked to provide the following:

- Screen shots where indicated.
- Custom report results where indicated.

---


## Vandalay Industries Monitoring Activity Instructions


### Step 1: The Need for Speed 

**Background**: As the worldwide leader of importing and exporting, Vandalay Industries has been the target of many adversaries attempting to disrupt their online business. Recently, Vandaly has been experiencing DDOS attacks against their web servers.

Not only were web servers taken offline by a DDOS attack, but upload and download speed were also significantly impacted after the outage. Your networking team provided results of a network speed run around the time of the latest DDOS attack.

**Task:** Create a report to determine the impact that the DDOS attack had on download and upload speed. Additionally, create an additional field to calculate the ratio of the upload speed to the download speed.


1.  Upload the following file of the system speeds around the time of the attack.
    
    - [Speed Test File](resources/server_speedtest.csv)

  -  **ANS:** 
     ```bash
     source="server_speedtest.csv" host="server_speedtest" sourcetype="csv" | eval ratio='DOWNLOAD_MEGABITS'/'UPLOAD_MEGABITS'
     ```

2. Using the `eval` command, create a field called `ratio` that shows the ratio between the upload and download speeds.

  -  **ANS:** 
       ```bash
       source="server_speedtest.csv" host="server_speedtest" | eval ratio ='DOWNLOAD_MEGABITS' / 'UPLOAD_MEGABITS'
       ```

   ![step1_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step1_1.png)
      
3. Create a report using the Splunk's `table` command to display the following fields in a statistics report:
    - `_time`
    - `IP_ADDRESS`
    - `DOWNLOAD_MEGABITS`
    - `UPLOAD_MEGABITS`
    - `ratio`  
  -  **ANS:** 
  ```bash
  source="server_speedtest.csv"| eval ratio ='DOWNLOAD_MEGABITS' / 'UPLOAD_MEGABITS' | table _time IP_ADDRESS DOWNLOAD_MEGABITS UPLOAD_MEGABITS ratio
  ```
  
  ![step1_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step1_2.png)
  ![step1_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step1_3.png)
  ![step1_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step1_4.png)
  
  
4. Answer the following questions:

    - Based on the report created, what is the approximate date and time of the attack?
      -  **ANS:** Based on report above, the attack began at 02/23/2020 at 14:30. 
    
    - How long did it take your systems to recover?
      -  **ANS:** Systems recovered and were operation normal at 23:30. It took about about 9 hours for system to recover. 



 
### Step 2: Are We Vulnerable? 

**Background:**  Due to the frequency of attacks, our manager needs to be sure that sensitive customer data on their servers is not vulnerable. Since Vandalay uses Nessus vulnerability scanners, we have pulled the last 24 hours of scans to see if there are any critical vulnerabilities.

**Task:** Create a report determining how many critical vulnerabilities exist on the customer data server. Then, build an alert to notify our team if a critical vulnerability reappears on this server.

1. Upload the following file from the Nessus vulnerability scan.
   - [Nessus Scan Results](resources/nessus_logs.csv)

   -  **ANS:** 
   ```bash
   source="nessus_logs.csv" host="nessus_logs" sourcetype="nessus_logs"
   ```

![step2_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step2_1.png)


2. Create a report that shows the `count` of critical vulnerabilities from the customer database server.
   - The database server IP is `10.11.36.23`. 
   - The field that identifies the level of vulnerabilities is `severity`.

   -  **ANS:** 
   ```bash
   source="nessus_logs.csv" host="nessus_logs" sourcetype="nessus_logs" dest_ip="10.11.36.23" severity="critical" | stats count by Critical
   ```
   There are 49 Critical database server vulnerabilities.
   
![step2_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step2_2.png)

      
3. Build an alert that monitors every day to see if this server has any critical vulnerabilities. If a vulnerability exists, have an alert emailed to `soc@vandalay.com`.
                           
![step2_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step2_3.png)
![step2_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step2_4.png)
![step2_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step2_5.png)




### Step 3: Drawing the (base)line

**Background:**  A Vandaly server is also experiencing brute force attacks into their administrator account. Management would like you to set up monitoring to notify the SOC team if a brute force attack occurs again.

**Task:** Analyze administrator logs that document a brute force attack. Then, create a baseline of the ordinary amount of administrator bad logins and determine a threshold to indicate if a brute force attack is occurring.

1. Upload the administrator login logs.
   - [Admin Logins](resources/Administrator_logs.csv)

2. When did the brute force attack occur? 

3. Determine a baseline of normal activity and a threshold that would alert if a brute force attack is occurring.

  -  **ANS:** 
  
  ```bash
  source="Administrator_logs.csv" host="Administrator_logs" sourcetype="cvs" | stats count by name | sort -count | eval Bruteforce=if(name="An account failed to log on" AND count>10, "Potential Brute Force", "Not Brute Force")
  ```

![step3_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step3_2.png)
![step3_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step3_3.png)
![step3_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step3_4.png)

  -  **ANS:** I found the baseline and threshold, the attack happened between 9 AM to 2 PM on 2/21/2020 for 5 hours, by examining the 'name' field for "An account failed to log on".    

4. Design an alert to check the threshold every hour and email the SOC team at SOC@vandalay.com if triggered.  

![step3_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step3_5.png)
![step3_6](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/18-Lets%20Go%20Splunking!/Images/step3_6.png)

---

### Citations and References:

#### Splunk Documentation:
- Splunk Enterprise: [eval-command](https://docs.splunk.com/Documentation/Splunk/8.2.2/SearchReference/Eval)

#### Special thanks:
© Trilogy Education Services, a 2U, Inc., Instructor Jerry and TAs; Matt, Jansen, Micheal.

© The University of Texas at Austin Boot Camp, The Cybersecurity program.

---
