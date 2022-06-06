# Skill Query - https://juanartiandy.github.io/skillquery.html
Tools Used : PostgreSQL, Excel, Power BI, and Google Data Studio

SKILL QUERY - LEARN THE RIGHT SKILLS: Job qualification analytics based on current job postings

How did the project created?

**STEP 1 - Web Scrapping**

I scrapped job posting ads on Jobstreet using a 3rd party software called https://webscraper.io/ to extract the job ads to a CSV file.

**STEP 2 - Data Cleanup**

I used PostgreSQL to cleanup the data. I utilized SELECT, FROM, ILIKE, CASE, WHEN, THEN, OR, END AS, UNION ALL, IS, IS NOT, ORDER BY, SubQuery, etc to proccess the data.
After the data has been cleaned, I imported the Query to Power BI. As for Google Data Studio, I extracted it to a CSV file and then uploaded the file to it. You can access the SQL file ini here > https://github.com/juanartiandy/Project1/blob/main/skillquery_data_cleanup.sql

**STEP 3 - Dashboard Creation**

I used Power BI and Google Data Studio to create the dashboard using the CSV file that was created from STEP 2. The dashboard was aimed to answer these questions :
1. What are the most on demand skills in Data Analytics right now?
2. Distributions on Data Analytics job openings based on education qualifications
3. Distributions on Data Analytics job openings based on locations
4. Distributions on Data Analytics job openings based on year of experience

**STEP 4 - Publish!**

Here is where you can access the project > https://juanartiandy.github.io/skillquery.html
