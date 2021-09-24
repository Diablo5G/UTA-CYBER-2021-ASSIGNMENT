
## Week 14 Homework: Web Development
---
### Questions & Answers

#### HTTP Requests and Responses

1. What type of architecture does the HTTP request and response process occur in?  

    * **ANS:** HTTP is based on the client-server architecture model and a stateless request/response protocol that operates by exchanging messages across a reliable TCP/IP connection (the application layer). 
    
2. What are the different parts of an HTTP request? 
    
    * **ANS:** An HTTP client sends an HTTP request to a server in the form of a request message which includes following format:
        * Request Method
        * Request-Line
        * Request URI
        * Request Header Fields
        
            * Example:   
               ````
               POST /cgi-bin/process.cgi HTTP/1.1
               User-Agent: Mozilla/4.0 (compatible; MSIE5.01; Windows NT)
               Host: www.tutorialspoint.com
               Content-Type: text/xml; charset=utf-8
               Content-Length: length
               Accept-Language: en-us
               Accept-Encoding: gzip, deflate
               Connection: Keep-Alive

               <?xml version="1.0" encoding="utf-8"?>
               <string xmlns="http://clearforest.com/">string</string>
               ````
    
    * The request method indicates the method to be performed on the resource identified by the given Request-URI. The method is case-sensitive and should always be mentioned in uppercase.
        * Example: The Request Method
           ````
               POST /cgi-bin/process.cgi HTTP/1.1
           ````
      A POST request is used to send data to the server, for example, customer information, file upload, etc. using HTML forms.

   * The Request-Line begins with a method token, followed by the Request-URI and the protocol version, and ending with CRLF. The elements are separated by space SP characters.
        * Example: The Request-Line
           ````
               Request-Line = Method SP Request-URI SP HTTP-Version CRLF
           ````

   * The Request Header Fields is an `HTTP header` that can be used in an HTTP request to provide information about the request context, so that the server can tailor the response.
        * Example: Request Header Fields
           ````
               Accept-Language: en-us
               Accept-Encoding: gzip, deflate
               Connection: Keep-Alive
           ````    
           
3. Which part of an HTTP request is optional?
    
    * **ANS:** The Request Body is optional 

4. What are the three parts of an HTTP response?
    
    * **ANS:** 
      *  A status line - the first line in the response message.
      *  A series of HTTP headers, or header fields - The HTTP headers for a server's response contain information that a client can use to find out more about the response, and about the server that sent it  
      *  A message body, which is usually needed - the message body contains either the resource requested by the client, or some information about the status of the action requested by the client.   
    
          ![HTTP_ResponseMessageExample](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/HTTP_ResponseMessageExample.png)  
          
5. Which number class of status codes represents errors?  
    
    * **ANS:** 400 codes indicate client errors  -- [400 Client Error Codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#4xx_client_errors)
    
               500 codes indicate server errors  -- [500 Server Error Codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#5xx_server_errors)  

6. What are the two most common request `methods` that a security professional will encounter?  
    
    * **ANS:** `GET` and `POST`.  
        * `GET` method requests ask for data from a server to retrieve data.
        * `POST` method requests send data to a specified resource.  
    
    * There are several other that are used:
        * `HEAD`
        * `PUT`
        * `DELETE`
        * `CONNECT`
        * `OPTIONS`
        * `TRACE`
        * `PATCH`  

7. Which type of HTTP request method is used for sending data?  
    
    * **ANS:** `POST` is used to send data to a server to create/update a resource.  

8. Which part of an HTTP request contains the data being sent to the server?  
    
    * **ANS:** The Request Body `POST` request sends data to the server.  

9. In which part of an HTTP response does the browser receive the web code to generate and style a web page?  
    
    * **ANS:** The Response Body Data received along with the response.

#### Using curl

Answer the following questions about `curl`:

10. What are the advantages of using `curl` over the browser?
    
    * **ANS:** `curl` is a free command line tool with many advantages
        * authentication
        * HTTP post
        * SSL connections
        * proxy support
        * FTP uploads
        * Saving URL to file
        * Downloading  

11. Which `curl` option is used to change the request method?  
    
    * **ANS:** The options can be using the `-X` or `--request` command-line options

12. Which `curl` option is used to set request headers?  
    
    * **ANS:** `-H`, `--header`  

13. Which `curl` option is used to view the response header?  
    
    * **ANS:** `-i`, `--include`

14. Which request method might an attacker use to figure out which HTTP requests an HTTP server will accept?  
    
    * **ANS:** 
      * `GET` request because attacker could requests data from a server to figure out which HTTP requests that an HTTP server server will accept.
      * `Options` is another request method that the attacker might figure out since it lists out the communication options for target resource.  

#### Sessions and Cookies

Recall that HTTP servers need to be able to recognize clients from one another. They do this through sessions and cookies.

Answer the following questions about sessions and cookies:

15. Which response header sends a cookie to the client?  

    * **ANS:**
    ```HTTP
    HTTP/1.1 200 OK
    Content-type: text/html
    Set-Cookie: cart=Bob
    ```  
    
    * **_The `set-cookie` sends the `cookie` to the client, which the cookie sent in `cart=Bob`._**

16. Which request header will continue the client's session?

    * **ANS:**
    ```HTTP
    GET /cart HTTP/1.1
    Host: www.example.org
    Cookie: cart=Bob
    ```  
    
    * The `cookie` will continue the client's session. 

**Example HTTP Requests and Responses**

Look through the following example HTTP request and response and answer the following questions:

**HTTP Request**

```HTTP
POST /login.php HTTP/1.1
Host: example.com
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 34
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Mobile Safari/537.36

username=Barbara&password=password
```

17. What is the request method?
    
    * **ANS:** `POST`  

18. Which header expresses the client's preference for an encrypted response?  
    
    * **ANS:** `Upgrade-Insecure-Requests: 1`  

19. Does the request have a user session associated with it?  
    
    * **ANS:** No the Session is not restablished yet

20. What kind of data is being sent from this request body?  
    
    * **ANS:** Login credential was sent.
    ```
    username=Barbara
    password=password
    ```  

**HTTP Response**

```HTTP
HTTP/1.1 200 OK
Date: Mon, 16 Mar 2020 17:05:43 GMT
Last-Modified: Sat, 01 Feb 2020 00:00:00 GMT
Content-Encoding: gzip
Expires: Fri, 01 May 2020 00:00:00 GMT
Server: Apache
Set-Cookie: SessionID=5
Content-Type: text/html; charset=UTF-8
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type: NoSniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

[page content]
```

21. What is the response status code?  
    
    * **ANS:** `200`

22. What web server is handling this HTTP response?  
    
    * **ANS:** `Apache webserver`

23. Does this response have a user session associated to it?  
    
    * **ANS:** Yes, `Set-Cookie: SessionID=5`

24. What kind of content is likely to be in the [page content] response body?  
    
    * **ANS:** The code to the website, as seen in `Content-Type: text/html_` (Text / HTML - Detail of the page configuration)

25. If your class covered security headers, what security request headers have been included?  
    
    * **ANS:** 
      * HTTP Strict Transport Security (HSTS) - `Strict-Transport-Security:` max-age=31536000; includeSubDomains
      *  X-Content-Type-Options HTTP - `X-Content-Type:` NoSniff  
      *  X-Frame-Options HTTP - `X-Frame-Options:` DENY  
      *  Cross Site Scripting Protection (X-XSS) - `X-XSS-Protection:` 1; mode=block


#### Monoliths and Microservices

Answer the following questions about monoliths and microservices:

26. What are the individual components of microservices called?  
    
    * **ANS:** There are 8 core components of microservices, they are called _`Services`:   
       1. Clients 
       2. Identity Providers 
       3. API Gateway 
       4. Messaging Formats 
       5. Databases 
       6. Static Content 
       7. Management 
       8. Service Discovery

![Microservice-architecture](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/Microservice-architecture.png)  

27. What is a service that writes to a database and communicates to other services?  
    
   * **ANS:** `API`: Application Programming Interface 

28. What type of underlying technology allows for microservices to become scalable and have redundancy?  
    
    * **ANS:** Cointainers allow microservices to be scalable and redundant, along with Load Balancer 

#### Deploying and Testing a Container Set

Answer the following questions about multi-container deployment:

29. What tool can be used to deploy multiple containers at once?  
    
    * **ANS:** `Docker Compose` is a tool to deploy multiple containers  
        `docker-compose up` to bring up the multiple containers.
        `docker-compose down` to bring down the multiple containers.

30. What kind of file format is required for us to deploy a container set?  
    
    * **ANS:** `YAML` file

#### Databases

31. Which type of SQL query would we use to see all of the information within a table called `customers`?  
    
    * **ANS:** SELECT statements 
        Example:
          `SELECT` FROM Customers WHERE Last_Name='Smith';`  

32. Which type of SQL query would we use to enter new data into a table? (You don't need a full query, just the first part of the statement.)  
    
    * **ANS:** INSERT INTO
        Example:
          `INSERT INTO Customers (field1, field 2, ...) VALUES ('a', 'b', ...);`  

33. Why would we never run `DELETE FROM <table-name>;` by itself?  
    
    * **ANS:** It deletes the entire table since it does not have the `where` clause.  

---

### Bonus Challenge Instructions: The Cookie Jar

First, using Docker Compose, navigate to the Day 1 WordPress activity directory and bring up the container set:

- `/home/sysadmin/Documents/docker_files`

Using `curl`, you will do the following for the Ryan user:

  - Log into WordPress and save the user's cookies to a cookie jar.

  - Test a WordPress page by using a cookie from the cookie jar.

  - Pipe the output from the cookie with `grep` to check for authenticated page access.

  - Attempt to access a privileged WordPress admin page.

#### Step 1: Set Up

Create two new users: Amanda and Ryan.   

1. Navigate to `localhost:8080/wp-admin/`

2. On the left-hand toolbar, hover over **Users** and click **Add New**.

3. Enter the following information to create the new user named Amanda.

    - Username: `Amanda`
    - Email: `amanda@email.com`

4. Skip down to password:

    - Password: `password`
    - Confirm Password: Check the box to confirm use of weak password.
    - Role: `Administrator`  
  
![User Amanda Created](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/User%20Amanda%20Created.png)  

5. Create another user named Ryan.

    - Username: `Ryan`
    - Email: `ryan@email.com`

6. Skip down to password:

    - Password: `123456`
    - Confirm Password: Check the box to confirm use of weak password.
    - Role: `Editor`  

![User Ryan Created](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/User%20Ryan%20Created.png)

7. Log out and log in with the following credentials:

    - Username: `Amanda`
    - Password: `password`

#### Step 2: Baselining

For these "baselining" steps, you'll want to log into two different types of accounts to see how the WordPress site looks at the `localhost:8080/wp-admin/users.php` page.  We want to see how the Users page looks from the perspective of an administrator, vs. a regular user.

1. Using your browser, log into your WordPress site as your sysadmin account and navigate to `localhost:8080/wp-admin/users.php`, where we previously created the user Ryan. Examine this page briefly. Log out.

![All Users-login](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/All%20Users-login.png)

2. Using your browser, log into your Ryan account and attempt to navigate to `localhost:8080/wp-admin/index.php`. Note the wording on your Dashboard.

![Ryan's Page](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/Ryan's%20Page.png)

3. Attempt to navigate to `localhost:8080/wp-admin/users.php`. Note what you see now.

![Users screen under Ryan's log in](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/Users%20screen%20under%20Ryan's%20log%20in.png)

Log out in the browser.

#### Step 3: Using Forms and a Cookie Jar

Navigate to `~/Documents` in a terminal to save your cookies.

1. Construct a `curl` request that enters two forms: `"log={username}"` and `"pwd={password}"` and goes to `http://localhost:8080/wp-login.php`. Enter Ryan's credentials where there are placeholders.

- `curl -L -D cookie_test_1.txt -d "log=Ryan&pwd=12345&testcookie=1&rememberme=forever" http://localhost:8080/wp-login.php`  
    ![Cookie_test_1](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/Cookie_test_1.png)  
    
- **Question:** Did you see any obvious confirmation of a login? (Y/N) None on the Webpage - however there was code confirmation in the terminal.
      * **ANS:** Yes  
      [code confirmation](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Resources/curl_Ryan_credentials.txt)

2. Construct the same `curl` request, but this time add the option and path to save your cookie: `--cookie-jar ./ryancookies.txt`. This option tells `curl` to save the cookies to the `ryancookies.txt` text file.  

- `curl -L -D cookie2.txt -d "log=Ryan&pwd=123456&testcookie=1&rememberme=forever" --cookie-jar ./ryancookies.txt http://localhost:8080/wp-login.php`

3. Read the contents of the `ryancookies.txt` file.
   
![ryancookies](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/ryancookies.png)

- **Question:** How many items exist in this file?  
      * **ANS:** There are three.

Note that each one of these is a cookie that was granted to Ryan after logging in.

#### Step 4: Log in Using Cookies

1. Craft a new `curl` command that now uses the `--cookie` option, followed by the path to your cookies file. For the URL, use `http://localhost:8080/wp-admin/index.php`.

- `curl -L --cookie cookie_test_1.txt http://localhost:8080/wp-admin/index.php`

- **Question:** Is it obvious that we can access the Dashboard? (Y/N)
      * **ANS:** No  

2. Press the up arrow on your keyboard to run the same command, but this time, pipe `| grep Dashboard` to the end of your command to return all instances of the word `Dashboard` on the page.

- `curl -L --cookie cookie_test_1.txt http://localhost:8080/wp-admin/index.php | grep Dashboard`

- **Question:**  Look through the output where `Dashboard` is highlighted. Does any of the wording on this page seem familiar? (Y/N) If so, you should be successfully logged in to your Editor's dashboard.

      * **ANS:** Yes ![grep Dashboard](https://github.com/Diablo5G/UTA-CYBER-2021-ASSIGNMENT/blob/Master/Offensive%20Security%20Unit/14-Web-Development/Images/grep%20Dashboard.png)

#### Step 5: Test the Users.php Page

1. Finally, write a `curl` command using the same `--cookie ryancookies.txt` option, but attempt to access `http://localhost:8080/wp-admin/users.php`.

- `curl -L --cookie ./ryancookies.txt http://localhost:8080/wp-admin/index.php | grep Dashboard`

- **Question:** What happens this time?

      * **ANS:** Same as sysadmin Dashboard

---

### Citations and References:

#### General Resources:

- Chua Hock-Chuan. [cited 2021 September 22]. Available from: [HTTP (HyperText Transfer Protocol)](https://www3.ntu.edu.sg/home/ehchua/programming/webprogramming/HTTP_Basics.html).
- OptiSol Business Solutions . [cited 2021 September 22]. Available from: [8 Core Components of Microservice Architecture](https://www.optisolbusiness.com/insight/8-core-components-of-microservice-architecture).
- HTTP Tutorial. Tutorials Point India Limited. [cited 2021 September 22]. Available from: [Tutorials Point](https://www.tutorialspoint.com/http/http_requests.htm)
- HTTP Request Methods. W3Schools by Refsnes Data Copyright 1999-2021. [cited 2021 September 22]. Available from: [W3Schools: HTTP Request Methods](https://www.w3schools.com/tags/ref_httpmethods.asp)
- Command line options. © GitBook - 2021. [cited 2021 September 22]. Available from: [Everything curl: Command Line Options](https://everything.curl.dev/cmdline/options) 
- HTTP Cookies. [cited 2021 September 22]. Available from: [curl Docs: HTTP Cookies](https://curl.se/docs/http-cookies.html)
- curl.1 the man page. [cited 2021 September 22]. Available from: [curl Man Page: Cookie Option](https://curl.se/docs/manpage.html#-c)
- Use Docker Compose to deploy multiple containers. © Microsoft 2021. [cited 2021 September 22]. Available from: [Use Docker Compose to deploy multiple containers](https://docs.microsoft.com/en-us/azure/cognitive-services/containers/docker-compose-recipe)
- Tony Bradley. TechBeacon. [cited 2021 September 22]. Available from: [The challenges of scaling microservices](https://techbeacon.com/app-dev-testing/challenges-scaling-microservices).
- SQL example statements for retrieving data from a table. © 2021 The Trustees of Indiana University. [cited 2021 September 22]. Available from: [SQL example statements for retrieving data from a table](https://kb.iu.edu/d/ahux).
- SQL DELETE Statement. © 2021 365 Data Science. [cited 2021 September 22]. Available from: [SQL DELETE Statement](https://365datascience.com/tutorials/sql-tutorials/sql-delete-statement).

#### Web Development Documentation:

- [HTTP Reference Sheet](./HTTP_Reference.md)
- [curl Reference Sheet](./cURL_Reference.md)

#### Special thanks:
© Trilogy Education Services, a 2U, Inc., Instructor Jerry and TAs; Matt, Jansen, Micheal.
© The University of Texas at Austin Boot Camp, The Cybersecurity program.

---
