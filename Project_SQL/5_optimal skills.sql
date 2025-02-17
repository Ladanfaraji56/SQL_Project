/*
# Identify the most optimal skills to learn for securing a high-paying remote Data Analyst job.
    # Use a Common Table Expression (CTE) `skills_demand` to Count the number of job postings requiring each skill (demand_count).
    # Use another CTE `average_salary` to:Calculate the average salary for jobs requiring each skill.
    # Perform an INNER JOIN between `skills_demand` and `average_salary`: Combine skill demand and salary data based on skill_id.
    # Apply a WHERE condition to filter out skills with low demand: Only include skills that appear in more than 10 job postings.
    # Order the results:By highest average salary first and if salaries are the same, prioritize skills with higher demand.
    # Limit the output to the top results to highlight the most valuable skills.
*/

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
LIMIT 25

/*
[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]

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
*/