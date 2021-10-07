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


#### Step 3: Shodan

- What open ports and running services did Shodan find:
    
    - **ANS:** Open Ports: 80, 443, 8080 found the information at https://www.shodan.io/host/65.61.137.117

![5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/16-Penetration%20Testing1/Images/5.png)

#### Step 4: Recon-ng

- Now we will install the Recon module **`xssed`** and set the source to **`demo.testfire.net`**.


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



#### Step 5: Zenmap

Your client has asked that you help identify any vulnerabilities with their file-sharing server. Using the Metasploitable machine to act as your client's server, complete the following:


<details>
<summary> <b> Click here to view How to Exploiting XSS with BeEF. </b> </summary>

---
  
  
- Command for Zenmap to run a service scan against the Metasploitable machine: 
 
- Bonus command to output results into a new text file named `zenmapscan.txt`:

- Zenmap vulnerability script command: 

- Once you have identified this vulnerability, answer the following questions for your client:
  1. What is the vulnerability:

  2. Why is it dangerous:

  3. What mitigation strategies can you recommendations for the client to protect their server:

</details>

---


### Citations and References:

#### General Resources:

- InfoTech News. Command Injection: What It Is And How To Prevent It. [cited 2021 September 29]. Available from: [meterpreter.org](https://meterpreter.org/command-injection-what-it-is-and-how-to-prevent-it/).
- Akshat Khare. Parth Chopra. Rahul Motwani. Web Applications Penetration Testing. Center of Excellence in Cyber Systems and Information Assurance (CoE-CSIA), IIT Delhi. [cited 2021 October 1]. Available from: [cse.iitd.ac.in](https://www.cse.iitd.ac.in/~cs1160315/WebPenetrationTesting.pdf)
- Karen Scarfone (NIST), Murugiah Souppaya (NIST), Amanda Cody (BAH), Angela Orebaugh (BAH). Technical Guide to Information Security Testing and Assessment. NIST National Institute of Standards and Technology. [cited 2021 October 1]. Available from:[nist.gov/publications](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-115.pdf).
- Robert W. Beggs. Mastering Kali Linux for Advanced Penetration Testing. ISBN 978-1-78216-312-1. Packt Publishing Ltd. [cited 2021 October 1]. Available from: [Mastering Kali Linux for Advanced Penetration Testing 3rd Edition](https://www.amazon.com/Mastering-Linux-Advanced-Penetration-Testing/dp/178934056X)


#### Special thanks:
© Trilogy Education Services, a 2U, Inc., Instructor Jerry and TAs; Matt, Jansen, Micheal.

© The University of Texas at Austin Boot Camp, The Cybersecurity program.

---  

