## Web Application 1: Your Wish is My Command Injection
1.  Complete the following to set up the activity.
    * Access Vagrant and open a browser.

    * Navigate to the following webpage: http://192.168.13.25/vulnerabilities/exec/

    * The web page should look like as the following:

![Web Application 1_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_1.png)

2.  This page is a new web application built by Replicants in order to enable their customers to ping an IP address. The web page will return the results of the ping command back to the user.
Complete the following steps to walkthrough the intended purpose of the web application.

    * Entering the IP address `8.8.8.8` Press Submit to see the results display on the web application.

![Web Application 1_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_5.png)

* Behind the scenes, when you select Submit, the IP you type in the field is injected into a command that is run against the Replicants webserver. The specific command that ran on the webserver is `ping <IP>` and `8.8.8.8` is the field value that is injected into that command.

![Web Application 1_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/15-Web-Vulnerabilities-and-Hardening/Images/Web%20Application%201_5.png)
