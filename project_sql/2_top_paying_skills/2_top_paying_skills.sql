/*
Question : What are the top paying skills for Data Analysts? 
We'll elaborate on previous data from the top paying jobs for Data Analysts.
*/
WITH  top_paying_jobs AS
(SELECT 
salary_year_avg,
job_id,
job_title,
company_dim.name AS company_name
FROM
job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
job_title_short = 'Data Analyst'AND
job_location = 'Anywhere'AND 
salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10)
SELECT 
top_paying_jobs.*,
skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
ORDER BY salary_year_avg DESC;