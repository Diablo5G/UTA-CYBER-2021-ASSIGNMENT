<img align="left" width="320" height="90" src="https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Splunk_logo.png">

# Solution Guide: Part 1 - Master of the SOC

---


## Windows Server Logs
#### Reports: Design the following reports to assist VSI with quickly identifying specific information
 1. A report with a table of signatures with associated SignatureID.
      
```bash
source="windows_server_logs.csv"  | table signature signature_id | dedup signature
```

![Search_W_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_W_1.png)

   - Select **Save As > Report**

![Report_W_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_W_1.png)
  

2. A report that provides the count and percent of the severity.

```bash
source="windows_server_logs.csv" |  top severity
```
	
![Search_W_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_W_2.png)

   - Select **Save As > Report**

![Report_W_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_W_2.png)


3. A report that provides a comparison between the success and failure of Windows activities.

```bash
source="windows_server_logs.csv" |  top status
```
	
![Search_W_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_W_3.png)

   - Select **Save As > Report**

![Report_W_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_W_3.png)


#### Alerts: Design the following alerts to notify VSI of suspicious activity

1. Determine an appropriate baseline and threshold for hourly level of failed Windows activity. Create an alert to trigger when the threshold has been reached. The alert should trigger an email to SOC@VSI-company.com.
       
```bash
source="windows_server_logs.csv" status=failure
```

![Search_A_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_A_1.png)

   - The average activity per hour is shortly six events. Therefore the threshold is up to the individual group, so we should set it in the range of 20-25 to avoid false positives.

   - To create alert, change the search to one hour and click **Save As > Alert

     - Set to run every hour.

     - Set alert to trigger when count is greater than chosen threshold (25).

     - Add action **Send email** to SOC@VSI-company.com.

![Alert_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Alert_1.png)

          
2. Determine a baseline and threshold for hourly count of the signature **an account was successfully logged on**. Create an alert to trigger when the threshold has been reached. The alert should trigger an email to SOC@VSI-company.com.

```bash
source="windows_server_logs.csv" signature="An account was successfully logged on"
```

![Search_A_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_A_2.png)

   - The average activity per hour is around 12 events. Therefore the threshold is up to the individual group, so we should set it in the range of 30-50

   - To create alert, change the search to one hour and click **Save AS > Alert**
	
     - Set to run every hour.

     - Set alert to trigger when count is greater than chosen threshold (40).

     - Add action **Send email** to SOC@VSI-company.com.
	    
![Alert_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Alert_2.png)      

                  
3. Determine a baseline and threshold for hourly count of the signature **a user account was deleted**. Design the alert based on the corresponding SignatureID. Create an alert to trigger when the threshold has been reached. The alert should trigger an email to SOC@VSI-company.com.   
		
```bash
source="windows_server_logs.csv" signature_id=4726
```

![Search_A_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_A_3.png)

   - The average activity per hour is roughly 13 events.

   - The threshold range should be between 30-50.

   - To create alert, change the search to one hour and click **Save AS > Alert**
	
     - Set to run every hour.

     - Set alert to trigger when count is greater than 30.

     - Add action **Send email** to SOC@VSI-company.com.

![Alert_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Alert_3.png)     

                   
#### Visualizations and Dashboards: Design the following visualizations and add them to a dashboard called Windows Server Monitoring

1. A line chart that displays the different `signature` field values over time.

```bash
source="windows_server_logs.csv" | timechart span=1h count by signature
```

![Search_V_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_V_1.png)


   - Select **Visualizations** > **Line Chart**.
   - Select the following: **Save As** > **New Dashboard Panel** > **Visualizations Windows Server Monitoring** > **Save to Dashboard**

![Line_Chart_V_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Line_Chart_V_1.png)
	


2. A line chart that displays the different `user` field values over time. 

```bash
source="windows_server_logs.csv" | timechart span=1h count by user
```

![Search_V_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_V_2.png)

   - Select **Visualizations** > **Line Chart**.
   - Select the following: **Save As** > **Existing Dashboard Panel** > **Visualizations Windows Server Monitoring** > **Save to Dashboard**

![Line_Chart_V_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Line_Chart_V_2.png)
	


3. A bar, column, or pie chart that illustrates the count of different signatures.

```bash
source="windows_server_logs.csv" | top limit=10 signature
```

![Search_V_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_V_3.png)

   - Select **Visualizations** > **Bar/Column/Pie Chart**.
   - Select the following: **Save As** > **Existing Dashboard Panel** > **Visualizations Windows Server Monitoring** > **Save to Dashboard**

![Pie_Chart_V_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Pie_Chart_V_3.png)
	


4. A bar, column, or pie chart that illustrates the count of different users.

```bash
source="windows_server_logs.csv" | top limit=10 user
```

![Search_V_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_V_4.png)

   - Select **Visualizations** > **Bar/Column/Pie Chart**.
   - Select the following: **Save As** > **Existing Dashboard Panel** > **Visualizations Windows Server Monitoring** > **Save to Dashboard** 
    
![Pie_Chart_V_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Pie_Chart_V_4.png)
	

5. A statistical chart that illustrates the count of different users.

```bash
source="windows_server_logs.csv" | top limit=10 user
```

![Stats_Chart_V_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Stats_Chart_V_5.png)
	
   - Select **Statistics** > **Save As** > **Existing Dashboard Panel** > **Visualizations Windows Server Monitoring** > **Save to Dashboard**


6. One single value visualization of your choice: radial gauge, marker gauge, etc.  


```bash
source="windows_server_logs.csv" signature_id=4726 | stats count as total
```

   - Select **Visualizations** > **Radial Gauge** > **Format** > **Color Ranges** > **Manual** our custom. 

![Radial Gauge_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Radial%20Gauge_1.png)

   - Select the following: **Save As** > **Existing Dashboard Panel** > **Visualizations Windows Server Monitoring** > **Save to Dashboard**
   - On our dashboard, 

![Dashboard_V_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_1.png)
![Dashboard_V_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_2.png)
![Dashboard_V_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_3.png)

---







## Apache Web Server Logs
#### Reports: Design the following reports to assist VSI with quickly identifying specific information

1. A report that shows a table of the different HTTP methods (GET, POST, HEAD, etc).
  
```bash
source="apache_logs.txt" | top method
```

![Search_B_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_B_1.png)

   - Select **Save As > Report**

![Report_X_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_X_1.png)	

2. A report that shows the top 10 domains that referred to VSI's website.

```bash
source="apache_logs.txt" | top limit=10 referer_domain
```
	
![Search_B_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_B_2.png)
	   
   - Select **Save As > Report**

![Report_X_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_X_2.png)	

3. A report that shows the count of the HTTP response codes.
	
```bash
source="apache_logs.txt" | top status
```

![Search_B_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_B_3.png)
	
   - Select **Save As > Report**

![Report_X_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Report_X_3.png)	
	


#### Alerts: Design the following alerts:

1. Determine a baseline and threshold for hourly count of activity from a country other than the United States. Create an alert to trigger when the threshold has been reached. The alert should trigger an email to SOC@VSI-company.com.

```bash
source="apache_logs.txt"  | iplocation clientip | where Country!="United States"
```

![Search_U_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_U_1.png)		
	
  - The average activity per hour is approximately 80.

  - Therefore the threshold is set for 200.

  - To create an alert, change the search to one hour and then select **Save As** > **Alert**.

  - Set to run every hour.

  - Set alert to trigger when count is greater than 200.

  - Add action **Send email** to SOC@VSI-company.com.

![Alert_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Alert_4.png)             

2. Determine a baseline and threshold for hourly count of the HTTP POST method. Create an alert to trigger when the threshold has been reached. The alert should trigger an email to SOC@VSI-company.com.

```bash
source="apache_logs.txt" method=POST
```
	
![Search_U_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_U_2.png)

  - The average activity per hour is roughly two.

  - Therefore the threshold is set for 17.

  - To create an alert, change the search to one hour.

  - Set to run every hour.

  - Set alert to trigger when count is greater than 17.

  - Add action **Send email** to SOC@VSI-company.com.
  
![Alert_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Alert_5.png) 		


#### Visualizations and Dashboards: Design the following visualization and add them to a dashboard called Apache WebServer Monitoring

1. A line chart that displays the different HTTP `methods` field over time.

```bash
source="apache_logs.txt" | timechart span=1h count by method
```

![Search_D_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_D_1.png)	
	
  - Select **Visualizations** > **Line Chart**.
  - Select the following: **Save As** > **New Dashboard** > **Visualizations Apache WebServer Monitoring** > **Save to Dashboard**

![Line_Chart_V_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Line_Chart_V_3.png)

2. A geographical map showing the location based on the `clientip` field.

```bash
source="apache_logs.txt" | iplocation clientip | geostats count
```

![Search_D_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_D_2.png)
    
  - Select **Visualizations** > **Geostats**.
  - Select the following: **Save As** > **New Dashboard** > **Visualizations Apache WebServer Monitoring** > **Save to Dashboard**

![Geostats](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Geostats.png)

3. A bar, column, or pie chart that displays the count of different URIs.

```bash
source="apache_logs.txt" | top limit=10 uri
```

![Search_D_3](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_D_3.png)

  - Select **Visualizations** > **Bar Chart**.
  - Select the following: **Save As** > **New Dashboard** > **Visualizations Apache WebServer Monitoring** > **Save to Dashboard**

![Bar_Chart](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Bar_Chart.png)

4. A bar, column, or pie chart that displays the counts of the top 10 countries.

```bash
source="apache_logs.txt"  | iplocation clientip | top limit=10 Country
```

![Search_D_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_D_4.png)

  - Select **Visualizations** > **Pie Chart**.
  - Select the following: **Save As** > **New Dashboard** > **Visualizations Apache WebServer Monitoring** > **Save to Dashboard**

![Pie_Chart_V_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Pie_Chart_V_5.png)

5. A statistical chart that illustrates the count of different user agents.

```bash
source="apache_logs.txt"  |  top limit=10 useragent
```
    
![Search_D_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Search_D_5.png)

![Stats_Chart_V_6](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Stats_Chart_V_6.png)

   - Select **Statistics** > **Save As** > **Existing Dashboard Panel** > **Visualizations Apache WebServer Monitoring** > **Save to Dashboard**


6. One single value visualization of your choice: radial gauge, marker gauge, etc.     

```bash
source="apache_logs.txt" method=GET | stats count as total
```

   - Select **Visualizations** > **Radial Gauge** > **Format** > **Color Ranges** > **Manual** our custom. 

![Radial Gauge_2](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Radial%20Gauge_2.png)

   - Select the following: **Save As** > **Existing Dashboard Panel** > **Visualizations Apache WebServer Monitoring** > **Save to Dashboard**
   - On our dashboard, add the ability to change the time range for all your visualizations.

	
On our dashboard,  

![Dashboard_V_4](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_4.png)
![Dashboard_V_5](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_5.png)
![Dashboard_V_6](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Defensive%20Security%20Unit/19-Protecting%20VSI%20from%20Future%20Attacks/Images/Dashboard_V_6.png)


---
---
