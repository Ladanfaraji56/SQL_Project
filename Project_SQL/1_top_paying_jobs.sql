/* 
# Retrieve the top 10 highest-paying remote data analyst jobs.
    # Using LEFT JOIN to include company names while filtering remote data analyst jobs with specified salaries.
    # Applying WHERE clause to ensure only jobs with salary information and remote positions for Data Analyst are selected.
    # Sorting results in descending order based on salary to display the highest-paying jobs first.
    # Using LIMIT to retrieve only the top 10 highest-paying remote data analyst jobs.
*/
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
LIMIT 10