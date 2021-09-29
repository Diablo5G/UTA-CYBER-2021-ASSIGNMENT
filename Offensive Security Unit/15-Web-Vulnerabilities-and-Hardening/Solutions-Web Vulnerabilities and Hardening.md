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
    * Entering the IP address `8.8.8.8` press Submit to see the results display on the web application.

![Web Application 1_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_1.png)


* Behind the scenes, when we select Submit, the IP you type in the field is injected into a command that is run against the Replicants webserver. The specific command that ran on the webserver is `ping <IP>` and `8.8.8.8` is the field value that is injected into that command.


2.  Now that we have determined that Replicants new application is vulnerable to command injection, we will tasked with using the dot-dot-slash method to design two payloads that will display the contents of the following files:

      - `/etc/passwd`
   
      - `/etc/hosts`


<details>
<summary> <b> Click here to view Payloads Configuration. </b> </summary>

---

#### How to manipulate the input to cause an unintended result 
   
- On the same webpage, enter the following command (payload) in the field: `8.8.8.8 && cat ../../../../../etc/passwd`
   
![Web Application 1_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_1.png)

```bash
ansible-playbook install-elk.yml
```
