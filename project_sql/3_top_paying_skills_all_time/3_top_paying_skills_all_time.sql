/* Top 10 paying skills all time */

SELECT  
COUNT (skills_dim.skills) as skill_demand,
skills_dim.skills
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where 
job_title_short = 'Data Analyst' AND

job_postings_fact.salary_year_avg is NOT NULL
GROUP BY skills_dim.skills
ORDER BY skill_demand DESC
limit 10;
