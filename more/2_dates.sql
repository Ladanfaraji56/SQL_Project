SELECT
    job_postings_fact.job_title_short AS title,
    job_postings_fact.job_location AS location,
    job_postings_fact.job_posted_date AS date
FROM
    job_postings_fact;

SELECT
    job_postings_fact.job_title_short AS title,
    job_postings_fact.job_location AS location,
    job_postings_fact.job_posted_date::DATE AS date
FROM
    job_postings_fact
LIMIT 10;

SELECT
    job_postings_fact.job_title_short AS title,
    job_postings_fact.job_location AS location,
    job_postings_fact.job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date
FROM
    job_postings_fact
LIMIT 10;    

SELECT
    job_postings_fact.job_title_short AS title,
    job_postings_fact.job_location AS location,
    job_postings_fact.job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
    EXTRACT(YEAR FROM job_posted_date) AS date_year,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
LIMIT 10;    

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS job_month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    job_month
ORDER BY
    job_posted_count DESC;

