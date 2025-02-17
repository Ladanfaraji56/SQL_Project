/*
# Identify the most in-demand skills for remote Data Analyst jobs.
    # Select the skill name and count the number of job postings requiring each skill. Group results by skill name to count the occurrences of each skill.
    # Use INNER JOIN:To link job postings with skills_job_dim (mapping job postings to skills). To retrieve skill names from skills_dim.
    # Apply a WHERE condition to filter:Jobs with the title 'Data Analyst' and Only remote job postings (job_work_from_home = TRUE).
    # Order the skills by demand count in descending order.
    # Limit the output to the top 5 most in-demand skills.
*/


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
LIMIT 5