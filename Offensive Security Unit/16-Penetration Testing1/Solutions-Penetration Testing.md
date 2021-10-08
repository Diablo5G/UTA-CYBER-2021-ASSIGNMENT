## Solutions Submission File: Penetration Testing 1

#### Step 1: Google Dorking


- Using Google, can you identify who the Chief Executive Officer of Altoro Mutual is:

  - **ANS:** Altoro Mutual is the the Chief Executive Officer of Altoro Mutual, found the information at [CEO Reveal](https://demo.testfire.net/index.jsp?content=inside_executives.htm)
 
![1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/1.png)

- How can this information be helpful to an attacker:
  
  - **ANS:** Hacker be able to send phishing email directly to the executive members.

#### Step 2: DNS and Domain Discovery

Enter the IP address for `demo.testfire.net` into Domain Dossier and answer the following questions based on the results:

-  Where is the company located: 
    
    - **ANS:** Sunnyvale CA 94085 US.

![2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/2.png)
 
-  What is the NetRange IP address:
    
    - **ANS:** 65.61.137.64 - 65.61.137.127

-  What is the company they use to store their infrastructure:
    
    - **ANS:** Rackspace Backbone Engineering San Antonio, TX.
 
![3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/3.png)
 
 
-  What is the IP address of the DNS server:
    
    - **ANS:** 65.61.137.117
 
![4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/4.png)


<img align="left" width="50" height="60" src="https://github.com/NX211/homer-icons/blob/master/png/shinobi.png" alt="shodan icon">

#### Step 3: Shodan

- What open ports and running services did Shodan find:
    
    - **ANS:** Open Ports: 80, 443, 8080 found the information at [HERE](https://www.shodan.io/host/65.61.137.117)

![5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/5.png)



<img align="left" width="50" height="40" src="https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/Ghost-Recon-logo.ico" alt="recon icon">

#### Step 4: Recon-ng

Now we will install the Recon module **`xssed`** and set the source to **`demo.testfire.net`**.


<details>
<summary> <b> Click here to view How to install the Recon. </b> </summary>

---
  
  
- Install the Recon module `xssed`. 
  
  - Search the module xssed by entering the command 
  
  
  ```
  marketplace search xssed
  ```
  
  - Install the module xssed by entering the command 
  
  
  ```
  marketplace install recon/domains-vulnerabilities/xssed
  ```

  - Load the module xssed by entering the command 
 
  
  ```
  module load recon/domains-vulnerabilities/xssed
  ``` 
 
![6](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/6.png) 
  
  
- Set the source to demo.testfire.net. 
  
  - Check the details of the module `xssed` by entering the command 
  
  ```
  info
  ```
  
  - To change the SOURCE from default to demo.testfire.net by entering the command 
  
  ```
  options set SOURCE demo.testfire.net
  ```
  
![8](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/8.png)
  
  - To change the SOURCE from default to demo.testfire.net by entering the command 
  
  ```
  run
  ```
  
![9](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/9.png)  
  
  - Is Altoro Mutual vulnerable to XSS: 
    - **ANS:** Yes, it was the only vulnerability found, as the screenshot above

  
  - Enter the following script in the search bar on browser 
  
  ```
  <script>alert("Hello")</script>
  ```

![10](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/10.png)  
  
  
  - or can enter any desire script in the search bar on browser such as
  
  ```
  <script>alert("twerking twerking when I buy the things I like-Lisa BlackPink")</script>
  ```

![11](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/11.png)  

</details>

---

 

<img align="left" width="60" height="40" src="https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/eyelogo.jpg" alt="zenmap icon">

#### Step 5: Zenmap


Your client has asked that you help identify any vulnerabilities with their file-sharing server. We are using the Metasploitable machine to act as your client's server in this demonstration.



<details>
<summary> <b> Click here to view How to look for vulnerabilities. </b> </summary>

---
  
  
- In the lab environment we will use Azure online VMs to demonstrate, consist of two VMs:

| Credentials | Username | Password |
|----------|----------|------------|
| **Kali Linux VM** | root | toor |
| **Metasploitable VM** | msfadmin | msfadmin |

- Once we are connected to both machine, launch Zenmap in Kali by running the following:

```
sudo zenmap
```

- At the Metasploitable VM, check IP address by running the following:
  
```
ifconfig
```
  

![15](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/15.png) 
  
- Input target `192.168.0.10`, profile: `quick scan`, the raw command is `nmap -T4 -A 192.168.0.10` then click the `SCAN` button to run 
  
  - The -T4 flag enables Fast Speed

  - The -A flag enables active OS detection. Nmap sends additional packets meant to specifically trigger responses revealing the OS of the target. This method is much noisier than the -O flag and more likely to be detected by an IDS.
  
![12](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/12.png) 
      
  
- Bonus command to output results into a new text file named `zenmapscan.txt`:

  - To save the results in the zenmapscan.txt add the following on the command line `-oN zenmapscan.txt` and you can also put command directly, see the capture screen picture below:
    - The -oN flag enables save output to a text file

![13](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/13.png)
  
![14](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/14.png)  

Now, you can access and review output at [zenmapscan.txt](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/zenmapscan.txt)


  
**Zenmap vulnerability script command:**  
    
So now we have identified this vulnerability then we can answer the following questions for our client:
  
  1. What is the vulnerability?
  
       - **ANS:** As per the below screenshots, Zenmap was able to identify the vulnerable service for port 139/445.

![19](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/19.png)

![20](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/20.png)

![21](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/21.png)



  
  2. Why is it dangerous?

       - **ANS:**  
      
          - This is dangerous due to the VSFTPD 2.3.4 backdoor attack can be applied on port 21 via a malicious code, if successful execution, opens the backdoor on port 6200.
              - This backdoor was introduced into the vsftpd-2.3.4.tar.gz archive between June 30th, 2011, and July 1st, 2011 according to the most recent information available. This backdoor was removed on July 3rd, 2011.
              - The concept of the attack on VSFTPD 2.3.4 is to trigger the malicious vsf_sysutil_extra(); function by sending a sequence of specific bytes on port 21, which on successful execution, results in opening the backdoor on port 6200 of the system and running as root.
      
          - The Windows Server Message Block (SMB) gets access through the organization's networks, the SMB protocols used by PCs for file and printer sharing, along with the remote access services.
              - SMB vulnerabilities allow their payloads to spread laterally through connected systems.  

  
  3. What mitigation strategies can you recommendations for the client to protect their server?
  
       - **ANS:**

          - The vsftpd-2.3.4. the patch was released on July 3, 2011, with the patch constantly monitored and updated.
              - The vsftpd-2.3.4. backdoor reported on 2011-07-04 (CVE-2011-2523).
  

          - The SMB (CVE-2017-0145) patch was released by Microsoft MS17-010, and the SAMBA (CVE-2017-0145) patches were released by Red Hat for Linux RHSA-2017:1390.



</details>

---


### Citations and References:

#### General Resources:

- vsftpd 2.3.4 - Backdoor Command Execution (Metasploit). EXPLOIT DATABASE BY OFFENSIVE SECURITY. © OffSec Services Limited 2021. [cited 2021 October 08]. Available from: [Metasploit](https://www.exploit-db.com/exploits/17491).




#### Penetration Testing Documentation:
- [Google Dorking Cheat Sheet](https://gist.github.com/sundowndev/283efaddbcf896ab405488330d1bbc06.js)
- [Recon-ng 5.1 Cheat Sheet](https://www.blackhillsinfosec.com/wp-content/uploads/2019/11/recon-ng-5.x-cheat-sheet-Sheet1-1.pdf)
- [Shodan Cheat Sheet](https://thedarksource.com/shodan-cheat-sheet/)
- [Zenmap Cheat Sheet](https://cs.lewisu.edu/~klumpra/camssem2015/nmapcheatsheet1.pdf)


#### Special thanks:
© Trilogy Education Services, a 2U, Inc., Instructor Jerry and TAs; Matt, Jansen, Micheal.

© The University of Texas at Austin Boot Camp, The Cybersecurity program.

---  

