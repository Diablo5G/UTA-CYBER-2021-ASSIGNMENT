## Web Application 1: Your Wish is My Command Injection
1.  Complete the following steps to walkthrough the intended purpose of the web application.
    * Access Vagrant and RUN 
      ```bash
         cd ./Documents/web-vulns && docker-compose up
      ```

    * Open a browser and navigate to the following webpage: http://192.168.13.25

    * The web page should look like as the figure below

    * Log in with the following credentials:
      *    Usernmae: admin
      *    Password: password

    * Select the **Command Injection** or access this page directly http://192.168.13.25/vulnerabilities/exec/
    * Entering the IP address `8.8.8.8` press **Submit** to see the results display on the web application.

![Web Application 1_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_1.png)


* Behind the scenes, when we select Submit, the IP you type in the field is injected into a command that is run against the Replicants webserver. The specific command that ran on the webserver is `ping <IP>` and `8.8.8.8` is the field value that is injected into that command.


2.  Now that we have determined that Replicants new application is vulnerable to command injection, we will tasked with using the dot-dot-slash method to design two payloads that will display the contents of the following files:

      - `/etc/passwd`
   
      - `/etc/hosts`


<details>
<summary> <b> Click here to view Design Command Injection Payloads. </b> </summary>

---

#### How to manipulate the input to cause an unintended result 
   
- In the terminal, enter the following command (payload) in the field: `8.8.8.8 && cat ../../../../../etc/passwd`
   
![Web Application 1_cat_passwd_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_cat_passwd_1.png)
![Web Application 1_cat_passwd_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_cat_passwd_2.png)

- On the same webpage, enter the following command (payload) in the field: `8.8.8.8 && cat ../../../../../etc/passwd`
   
![Web Application 1_cat_passwd_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_4.png)
   
- In the terminal, enter the following command (payload) in the field: `8.8.8.8 && cat ../../../../../etc/hosts`
   
![Web Application 1_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_2.png)

- On the web browser, enter the following command (payload) in the field: `8.8.8.8 && cat ../../../../../etc/hosts`
   
![Web Application 1_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_5.png)
   

#### Mitigation Strategies

1. **Input validation** is a method to validate the data input with a predefined logic, ensuring that the input is what the application is expecting. Input validation can be applied on the client-side or the server-side. For example,
   
|          | Function | Example    |
|----------|----------|------------|
| **Client-side**| Input validation involves coding the predefined logic into the webpage.                   | An input can only be chosen from a predefined drop-down menu.     |
| **Server-side**| Input validation involves adding the predefined logic into the code on the web server.    | If a user enters a malicious SQL code and selects submit, then the web server will check and remove it after receiving this malicious input.     |

2. **Avoid Command-Line Calls Altogether** The first prevention method you can do is avoiding command line calls. Because when we’re using command lines, it opens users to risk such as command injection. 
   
3. **Use Built-in APIs Instead of OS Commands** Another method is to shift from using Operating System (OS) commands to much-safer APIs, considering that most reputable APIs have built-in security measures. 
   
4. **Reject Unacceptable Code** We can also use server-level protection, which is blacklisting a set of codes. Simply by only allowing the codes we and our team built prevents any other code from accessing the server. Thus, creating a barrier between the malicious codes and the whole server.
   
5. **Escaping Shell Metacharacters** Also, to prevent any other characters and limit the output of commands, we can use escaping shell metacharacters. This method allows us to expressly grant access depending on the variables. Our developer can set these variables based on our needs.    
   
   
</details>

---

---

### Citations and References:

#### General Resources:

- InfoTech News. Command Injection: What It Is And How To Prevent It. [cited 2021 September 29]. Available from: [meterpreter.org](https://meterpreter.org/command-injection-what-it-is-and-how-to-prevent-it/).


#### Special thanks:
© Trilogy Education Services, a 2U, Inc., Instructor Jerry and TAs; Matt, Jansen, Micheal.

© The University of Texas at Austin Boot Camp, The Cybersecurity program.

---
