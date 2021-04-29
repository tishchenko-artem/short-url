Flask URL Shortener

Task one    
file task1.sql contains the answer for task:  
"Написать SQL-запрос, который будет выводить url и description записей, у которых location это Киев или Львов."

Task two  

Project shorten long URL to short without losing its value. It gives URL better readability for the user.

POST /add_link 

endpoint for send your long URL  

`expiration_date` is optional and default value is 90 days

Example request:

`{
  "original_url": "https://www.google.com.ua/",
  "expiration_date": 32
}`

response contains unique 5 character URL.  
`<shorted_url>` - generated shorted URL

`{
    "short_url": "<shorted_url>"
}`  

Error `400 Bad request` if `expiration_date` is less than 1 day or bigger than 365 days
  
GET /<shorted_url>   

Redirect you to original URL with given short URL

Error `404 Not Found` if link expired or not exist

Testing was carried out using Postman

Use `flask run` for run the app in short_url folder

For run project please provide the .env file with  settings

`DATABASE_URL`  
`DATABASE_URL_DIRECT`  
`ADMIN_PASSWORD`  
`ADMIN_USERNAME`