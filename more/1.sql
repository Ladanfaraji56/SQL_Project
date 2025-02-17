SELECT *
FROM
    job_postings_fact
WHERE 
    job_location = 'Canada' AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg