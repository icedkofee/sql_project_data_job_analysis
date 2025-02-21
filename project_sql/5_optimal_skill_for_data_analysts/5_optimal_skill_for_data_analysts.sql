/* Optimal skill for data analysts */

WITH demand AS (SELECT  
COUNT (skills_dim.skills) as skill_demand,
skills_dim.skills,
skills_dim.skill_id
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where 
(job_title_short = 'Data Analyst' OR job_title_short = 'Data Scientist') AND

job_postings_fact.salary_year_avg is NOT NULL
GROUP BY skills_dim.skill_id)

, salary AS (SELECT  
ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS AVG_salary_per_skill,
skills_dim.skills,
skills_dim.skill_id
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where 
(job_title_short = 'Data Analyst' OR job_title_short = 'Data Scientist') AND
job_postings_fact.salary_year_avg is NOT NULL
GROUP BY skills_dim.skill_id
)


SELECT  
demand.skill_demand,
demand.skills,
salary.AVG_salary_per_skill
FROM demand
INNER JOIN salary ON demand.skill_id = salary.skill_id
ORDER BY skill_demand DESC , AVG_salary_per_skill DESC 
limit 10;