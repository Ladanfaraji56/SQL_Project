/*
# Retrieve the required skills for the top 10 highest-paying remote Data Analyst jobs.
    # Use a WITH clause (Common Table Expression - CTE) to first filter the top 10 highest-paying Data Analyst job postings with available salary information.
    # Join the results with skills_job_dim and skills_dim tables to retrieve the required skills for each of these high-paying roles.
    #  Order the final output by salary in descending order.
*/

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
    salary_year_avg DESC

/*
A strong foundation in SQL and Python is crucial for high-paying data analyst jobs.
Data visualization tools like Tableau and Power BI are important.
Cloud platforms (Azure, Snowflake, AWS) and collaboration tools (Jira, Confluence) are becoming more relevant.
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "company_name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "company_name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "company_name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "company_name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "company_name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "company_name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "company_name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "company_name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "company_name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  }
]
*/