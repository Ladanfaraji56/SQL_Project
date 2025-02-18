# Introduction
📊 Explore the Data Job Market!
Dive into the world of Data Analyst roles to discover:
💰 The highest-paying jobs in the industry
🔥 The most in-demand skills shaping the market
📈 Where salary and demand intersect for career growth

🔍 Want to see the SQL queries driving these insights? Explore them here:[Project_SQL folder](/Project_SQL/)
# Background
This project came from my own curiosity and the need to navigate the data analyst job market more effectively. I wanted to find out which skills lead to the highest-paying jobs and which ones are in the highest demand.

Through my SQL queries, I set out to answer some key questions about the data analyst job market:

1) Which data analyst jobs offer the highest salaries?

2) What skills do these high-paying roles require?

3) Which skills are currently in the highest demand for data analysts?

4) Are there specific skills that consistently lead to higher salaries?

5) What are the best skills to learn to land a well-paying data analyst job?
# Tools I Used
 - **SQL**: helping me query the database and extract key trends.
 - **PostgreSQL**: My database of choice, perfect for managing and analyzing job posting data.
 - **Visual Studio Code**: My go-to workspace for writing and running SQL queries efficiently.
 - **Git & GitHub**: Keeping everything organized with version control, sharing my work, and making collaboration seamless.
# The Analysis
Every query in this project was designed to uncover key insights about the data analyst job market. Here’s how I tackled each question:

### 1. Top Paying Data Analyst Jobs
To find the highest-paying roles, I filtered job postings based on average yearly salary and location, with a focus on remote opportunities. This helped highlight where the best-paying data analyst jobs are and what factors might contribute to their high salaries.
```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS Company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Breakdown of the Top Data Analyst Jobs:

 - Wide Salary Range: The top paying data analyst roles offer salaries between $184,000 and $650,000, highlighting the vast earning potential in this field.
 - Diverse Employers: High salaries aren’t limited to one industry. Companies like SmartAsset, Meta, and AT&T are leading the way, proving that demand for data analysts spans multiple sectors.
 - Varied Job Titles: From Data Analyst to Director of Analytics, the job market reflects a broad spectrum of roles, showing how specialization and experience can shape career growth in data analytics.


 ![Top Paying Rols](images\1_top_paying_roles.png)
 
 *Bar graph visualizing the salary for the top 10 salaries for data analysts using python(pandas, numpy, and matplotlib)*
 ```python
 import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# Data for visualization
data = [
    {"job_id": 226942, "job_title": "Data Analyst", "salary_year_avg": 650000, "company_name": "Mantys"},
    {"job_id": 547382, "job_title": "Director of Analytics", "salary_year_avg": 336500, "company_name": "Meta"},
    {"job_id": 552322, "job_title": "Associate Director- Data Insights", "salary_year_avg": 255829.5, "company_name": "AT&T"},
    {"job_id": 99305, "job_title": "Data Analyst, Marketing", "salary_year_avg": 232423, "company_name": "Pinterest"},
    {"job_id": 1021647, "job_title": "Data Analyst (Hybrid/Remote)", "salary_year_avg": 217000, "company_name": "UCLA Health"},
    {"job_id": 168310, "job_title": "Principal Data Analyst (Remote)", "salary_year_avg": 205000, "company_name": "SmartAsset"},
    {"job_id": 731368, "job_title": "Director, Data Analyst - HYBRID", "salary_year_avg": 189309, "company_name": "Inclusively"},
    {"job_id": 310660, "job_title": "Principal Data Analyst, AV Performance Analysis", "salary_year_avg": 189000, "company_name": "Motional"},
    {"job_id": 1749593, "job_title": "Principal Data Analyst", "salary_year_avg": 186000, "company_name": "SmartAsset"},
    {"job_id": 387860, "job_title": "ERM Data Analyst", "salary_year_avg": 184000, "company_name": "Get It Recruit IT"}
]

# Convert data to DataFrame
df = pd.DataFrame(data)

# Sort data by salary
df = df.sort_values(by="salary_year_avg", ascending=False)

# Set dark background style
plt.style.use("dark_background")

# Generate colors for gradient effect
colors = plt.cm.plasma(np.linspace(0.2, 0.8, len(df)))

# Create bar chart with gradient colors
fig, ax = plt.subplots(figsize=(12, 6))
bars = ax.barh(df["job_title"], df["salary_year_avg"], color=colors)

# Labels and title
ax.set_xlabel("Average Yearly Salary ($)", color="white")
ax.set_ylabel("Job Title", color="white")
ax.set_title("10 Top Paying Data Analyst Jobs average salary", color="white")
ax.invert_yaxis()  # Highest salary on top

# Change tick color
ax.tick_params(colors="white")

# Show the chart
plt.show()
 ```

 ### 2. Skills for Top Paying Jobs
To get a clear picture of the skills that drive top-paying data analyst jobs, I connected job postings with their required skills. This helped uncover what employers prioritize when offering high salaries and which skills are truly valued in the industry.
```sql
WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        name AS Company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
Breakdown of the most demanded skills:

 A strong foundation in SQL and Python is crucial for high-paying data analyst jobs.
Data visualization tools like Tableau and Power BI are important.
Cloud platforms (Azure, Snowflake, AWS) and collaboration tools (Jira, Confluence) are becoming more relevant.


 ![Top Paying Rols](images\2_top_paying_job_skills.png)

 *Bar graph visualizing the salary for the top 10 salaries for data analysts using python(pandas, numpy, and matplotlib)*

  ### 3. In-Demand Skills for Data Analysts
Identify the most in-demand skills for remote Data Analyst jobs.
```sql
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
Breakdown of the most demanded skills for data analysts:

 SQL and Excel continue to be essential, highlighting the importance of solid data processing and spreadsheet management skills. Mastering these fundamentals remains a key requirement for data analysts.
Programming and Visualization Tools like Python, Tableau, and Power BI are now indispensable, reflecting the growing need for technical proficiency in data storytelling and decision-making. Companies increasingly rely on analysts who can not only extract insights but also communicate them effectively through visualizations and automation.

| Skill      | Demand Count |
|------------|-------------|
| SQL        | 7,291       |
| Excel      | 4,611       |
| Python     | 4,330       |
| Tableau    | 3,745       |
| Power BI   | 2,609       |

*Table of the demand for the top 5 skills in data analyst job postings*

  ### 4. Skills Based on Salary
Identify the top-paying skills for remote Data Analyst jobs based on salary.
```sql
SELECT
    skills,
   ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
   avg_salary DESC
LIMIT 25;
```
Breakdown of the results for top paying skills for Data Analysts:

 Big Data and Distributed Computing (PySpark, Databricks) are among the highest-paying skills.
Cloud Computing (GCP, Kubernetes, Linux) is a growing necessity for high-paying jobs.
DevOps & Automation (Bitbucket, GitLab, Jenkins, Airflow) skills boost salary potential.
AI & Machine Learning (DataRobot, Watson, Scikit-Learn) expertise is well-compensated.
Data Engineering & Advanced Databases (PostgreSQL, Couchbase) continue to be in demand.

| Skill          | Average Salary ($) |
|---------------|-------------------|
| Pyspark       | 208,172           |
| Bitbucket     | 189,155           |
| Couchbase     | 160,515           |
| Watson        | 160,515           |
| Datarobot     | 155,486           |
| Gitlab        | 154,500           |
| Swift         | 153,750           |
| Jupyter       | 152,777           |
| Pandas        | 151,821           |
| Elasticsearch | 145,000           |
| Golang        | 145,000           |
| Numpy         | 143,513           |
| Databricks    | 141,907           |
| Linux         | 136,508           |
| Kubernetes    | 132,500           |
| Atlassian     | 131,162           |
| Twilio        | 127,000           |
| Airflow       | 126,103           |
| Scikit-learn  | 125,781           |
| Jenkins       | 125,436           |
| Notion        | 125,000           |
| Scala         | 124,903           |
| PostgreSQL    | 123,879           |
| GCP           | 122,500           |
| Microstrategy | 121,619           |

*Table of the average salary for the top 25 paying skills for data analysts*

  ### 5. Most Optimal Skills to Learn
 Identify the most optimal skills to learn for securing a high-paying remote Data Analyst job.
```sql
WITH skills_demand AS(
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY skills_dim.skill_id
), avarage_salary AS(
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY 
        skills_job_dim.skill_id

)

SELECT
   skills_demand.skill_id,
   skills_demand.skills,
   demand_count,
   avg_salary 
FROM
    skills_demand
INNER JOIN avarage_salary ON skills_demand.skill_id = avarage_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
Breakdown of the most optimal skills for Data Analysts

 Cloud & Big Data Skills Command High Salaries

Snowflake ($112K), Hadoop ($113K), BigQuery ($109K), AWS ($108K), Azure ($111K)
These indicate a strong demand for cloud-based data warehousing and big data processing.
Cloud expertise is crucial for high-paying analytics roles.
Programming Languages & Data Science Tools are Essential

Go ($115K), Python ($101K), R ($100K), Java ($106K), C++ ($98K)
Python has high demand (236 postings) but a relatively lower salary compared to Go, Java, and R.
Go leads in salary, suggesting a niche but well-compensated skill.
BI & Data Visualization are Competitive

Tableau ($99K), Looker ($103K), Qlik ($99K), SSRS ($99K)
Data visualization tools are highly demanded but offer lower average salaries compared to engineering-focused roles.
Database & SQL-Related Skills are Key

SQL Server ($97K), Oracle ($104K), NoSQL ($101K), Redshift ($99K)
Traditional and cloud-based database skills remain relevant in high-paying data roles.
Project Management & Collaboration Tools Appear in Top Salaries

Confluence ($114K), Jira ($104K), Bitbucket (previously mentioned high-paying)
Companies value analysts with workflow and project management tool experience.

| Skill          | Demand Count | Average Salary ($) |
|---------------|-------------|-------------------|
| Go            | 27          | 115,320           |
| Confluence    | 11          | 114,210           |
| Hadoop        | 22          | 113,193           |
| Snowflake     | 37          | 112,948           |
| Azure         | 34          | 111,225           |
| BigQuery      | 13          | 109,654           |
| AWS           | 32          | 108,317           |
| Java          | 17          | 106,906           |
| SSIS          | 12          | 106,683           |
| Jira          | 20          | 104,918           |
| Oracle        | 37          | 104,534           |
| Looker        | 49          | 103,795           |
| NoSQL         | 13          | 101,414           |
| Python        | 236         | 101,397           |
| R             | 148         | 100,499           |
| Redshift      | 16          | 99,936            |
| Qlik          | 13          | 99,631            |
| Tableau       | 230         | 99,288            |
| SSRS          | 14          | 99,171            |
| Spark         | 13          | 99,077            |
| C++           | 11          | 98,958            |
| SAS           | 63          | 98,902            |
| SQL Server    | 35          | 97,786            |
| JavaScript    | 20          | 97,587            |

*Table of the most optimal skills for data analyst sorted by salary*
# Conclusions
From this analysis, several key takeaways emerged about the data analyst job market:

 - Top Paying Data Analyst Jobs: Remote data analyst roles offer a broad salary range, with the highest reaching $650,000, proving that data expertise is highly valued across industries.
 - Skills for High-Paying Jobs: Advanced proficiency in SQL remains a key requirement for top-paying roles, reinforcing its importance in data manipulation and analysis.
 - Most In-Demand Skills: SQL, Excel, Python, Tableau, and Power BI are the most important skills, highlighting the need for both technical expertise and data visualization capabilities.
 - Skills Linked to Higher Salaries: Specialized technical skills such as Pyspark, Bitbucket, and Couchbase are associated with the highest average salaries, emphasizing the value of big data processing, version control, and cloud-based technologies.
 - Optimal Skills for Career Growth: SQL emerges as the most optimal skill for job seekers, as it is both highly demanded and well-compensated, making it a must-have for aspiring data analysts looking to maximize job opportunities and salary potential.

 # Why I Built This Project?
  - This project is more than just an analysis, it's a roadmap for my journey into data analytics. By diving deep into job market trends, salary insights, and in-demand skills, I aim to:
    1. Showcase my SQL expertise, demonstrating my ability to write complex queries and extract meaningful insights from data.
    2. Clarify my career direction by identifying the most valuable skills and job opportunities in data analytics.
    3. Make informed learning choices by prioritizing high-demand and high-paying technical skills.
Build a strong foundation that will help me secure a competitive role and grow as a data analyst.