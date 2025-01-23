/* Question: What are the top paying jobs as a Data Analyst (using Luke Barousse data)
Top 10 paying jobs.
Only jobs with mentioned salaries and that are remotely.
*/
SELECT 
job_id,
job_title,
company_dim.name AS company_name,
job_location,
job_schedule_type,
salary_year_avg
FROM
job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
job_title_short = 'Data Analyst'AND
job_location = 'Anywhere'AND 
salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

