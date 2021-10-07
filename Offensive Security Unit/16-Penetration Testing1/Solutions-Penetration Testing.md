## Week 16 Homework Submission File: Penetration Testing 1

#### Step 1: Google Dorking


- Using Google, can you identify who the Chief Executive Officer of Altoro Mutual is:
  - ANS: Altoro Mutual is the the Chief Executive Officer of Altoro Mutual, found the information at https://demo.testfire.net/index.jsp?content=inside_executives.htm 

- How can this information be helpful to an attacker:
  - ANS: Hacker be able to send phishing email directly to the executive members.

#### Step 2: DNS and Domain Discovery

Enter the IP address for `demo.testfire.net` into Domain Dossier and answer the following questions based on the results:

  1. Where is the company located: 
  - ANS: Sunnyvale CA 94085 US.
 
  2. What is the NetRange IP address:
  - ANS: 65.61.137.64 - 65.61.137.127
 
  3. What is the company they use to store their infrastructure:
  - ANS: Rackspace Backbone Engineering San Antonio, TX.
 
  4. What is the IP address of the DNS server:
  - ANS: 65.61.137.117


#### Step 3: Shodan

- What open ports and running services did Shodan find:
  - ANS: Open Ports: 80, 443, 8080 found the information at https://www.shodan.io/host/65.61.137.117



#### Step 4: Recon-ng

<details>
<summary> <b> Click here to view How to Exploiting XSS with BeEF. </b> </summary>

---
  
  
- Install the Recon module `xssed`. 
- Set the source to `demo.testfire.net`. 
- Run the module. 

Is Altoro Mutual vulnerable to XSS: 


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
