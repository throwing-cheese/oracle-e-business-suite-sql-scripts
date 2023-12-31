/*
File Name: pa-project-templates.sql
Version: Oracle Release 12 / R12
Author: Throwing Cheese
URL: https://github.com/throwing-cheese/oracle-e-business-suite-sql-scripts
*/

-- ##################################################################
-- PROJECT TEMPLATES
-- ##################################################################

		select ppa_template.segment1 template_project_num
			 , ppa_template.creation_date template_creation_date
			 , count (*) ct
			 , max (ppa.creation_date) last_used
		  from pa.pa_projects_all ppa_template
		  join pa.pa_projects_all ppa on ppa_template.project_id = ppa.created_from_project_id
		 where ppa_template.template_flag = 'Y'
	  group by ppa_template.segment1
			 , ppa_template.creation_date;
