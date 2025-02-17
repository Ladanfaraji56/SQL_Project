CREATE TABLE January_jobs AS
    SELECT *
    FROM
        job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT *
    FROM
        job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT *
    FROM
        job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT 
    COUNT (job_id) AS number_of_job,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'Canada' THEN 'Local'
        ELSE 'Onsite'
    END AS Location_category
FROM
    job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY Location_category;