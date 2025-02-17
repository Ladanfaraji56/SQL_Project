SELECT 
quarter_job_posting.job_title_short,
quarter_job_posting.job_location,
quarter_job_posting.job_via,
quarter_job_posting.job_posted_date::date
FROM(
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter_job_posting
WHERE 
    quarter_job_posting.salary_year_avg > 70000 AND
    quarter_job_posting.job_title_short = 'Data Analyst'
ORDER BY
    quarter_job_posting.salary_year_avg DESC