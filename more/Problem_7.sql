WITH remote_job_skills AS(
    SELECT
        Skils_to_job.skill_id,
        COUNT(*) AS Skill_count
    FROM
        skills_job_dim AS Skils_to_job
    INNER JOIN job_postings_fact AS JOB_POSTING ON Skils_to_job.job_id = JOB_POSTING.job_id
    WHERE
        job_posting.job_work_from_home = TRUE AND
        job_posting.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
)

SELECT
    skills.skill_id,
    skills AS skill_name,
    Skill_count
FROM remote_job_skills
INNER JOIN skills_dim Skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY Skill_count DESC
LIMIT 5