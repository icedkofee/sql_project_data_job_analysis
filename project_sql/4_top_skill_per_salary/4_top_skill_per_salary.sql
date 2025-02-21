/* Top 10 paying skills all time for data science and data analysis*/

SELECT  
ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS AVG_salary_per_skill,
skills_dim.skills
FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where 
(job_title_short = 'Data Analyst' OR job_title_short = 'Data Scientist') AND
job_postings_fact.salary_year_avg is NOT NULL
GROUP BY skills_dim.skills
ORDER BY AVG_salary_per_skill DESC
limit 10;
