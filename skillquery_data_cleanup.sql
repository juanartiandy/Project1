SELECT *,job_name||altered_company_name||location AS join_key FROM(
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%sql%' = true THEN 'SQL'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
		     		WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%python%' OR description ILIKE '%phyton%' OR description ILIKE '%phython%'= true  THEN 'Python'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%java%' = true THEN 'Java'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%scala%' = true THEN 'Scala'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN (description ILIKE '%r%' AND description ILIKE '%program%') OR (description ILIKE '%r%' AND description ILIKE '%language%')= true THEN 'R'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%excel%' = true THEN 'Excel'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%perl%' = true THEN 'Perl'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%C#%' OR description ILIKE '%C #%'= true THEN 'C#'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%saas%' = true THEN 'Saas'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%html%' = true THEN 'HTML'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%aws%' = true THEN 'AWS'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%azure%' = true THEN 'Azure'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%git%' = true THEN 'Git'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%tableau%' = true THEN 'Tableau'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%Qlik%' = true THEN 'Qlik'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%jira%' = true THEN 'JIRA'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%jenkins%' = true THEN 'Jenkins'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%power bi%' OR description ILIKE '%powerbi%'= true  THEN 'Power BI'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%pandas%' = true THEN 'Pandas'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%tensorflow%' = true THEN 'Tensorflow'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%mlflow%' = true THEN 'MLflow'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%kubernetes%' = true THEN 'Kubernetes'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%pytorch%' = true THEN 'Pytorch'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%spark%' = true THEN 'Spark'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%keras%' = true THEN 'Keras'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%matplotlib%' = true THEN 'Matplotlib'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%plotly%' = true THEN 'Plotly'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%ggplot%' = true THEN 'Ggplot'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%opencv%' = true THEN 'Opencv'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%ntlk%' = true THEN 'Ntlk'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%tidyverse%' = true THEN 'Tidyverse'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%statsmodels%' = true THEN 'Statsmodels'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%shell%' = true THEN 'Shell'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%php%' = true THEN 'PHP'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%sas%' = true THEN 'Sas'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%spss%' = true THEN 'SPSS'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded'
	UNION ALL
	SELECT *
		FROM(SELECT 
			job_name,
			/*Query dibawah ini bertujuan untuk clustering berbagai macam job title menjadi satu cluster*/
			CASE
				WHEN job_name ILIKE '%business%' = true THEN 'Business Analyst'
				WHEN job_name ILIKE '%science%' OR job_name ILIKE '%scientist%'= true THEN 'Data Scientist'
				WHEN job_name ILIKE '%learning%' = true THEN 'Data Scientist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analyst%'= true THEN 'Data Analyst'				
			 	WHEN job_name ILIKE '%data%' AND job_name ILIKE '%analytics%'= true THEN 'Data Analyst'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%bi%'= true THEN 'Business Intelligence Specialist'
				WHEN job_name ILIKE '%data%' AND job_name ILIKE '%engineer%'= true THEN 'Data Engineer'
				ELSE 'Should be excluded'
				END AS job_cluster, 
			/*Query dibawah ini dibuat untuk melakukan penyamaran nama perusahaan*/
			UPPER(SUBSTRING(company, 5, 2))||UPPER(SUBSTRING(company, 0, 2)) AS altered_company_name,
			location,
			/*Query dibawah ini dibuat untuk mengekstrak kualifikasi pendidikan (yang tertinggi yang diambil sebagai takaran kualifikasi, jika kosong dianggap S1)*/
			CASE
				WHEN other_notes ILIKE '%S2%' = true THEN 'S2'
				WHEN other_notes ILIKE '%S1%' = true THEN 'S1'
				WHEN other_notes ILIKE '%D4%' = true THEN 'D4'
				ELSE 'S1'
				END AS education, 
			/*Query dibawah ini dibuat untuk mengekstrak lama pengalaman pekerjaan yang dicari(jika kosong, dianggap 1 tahun)*/
			CASE
				WHEN other_notes ILIKE '%1 tahun%' = true THEN '1'
				WHEN other_notes ILIKE '%2 tahun%' = true THEN '2'
				WHEN other_notes ILIKE '%3 tahun%' = true THEN '3'
				WHEN other_notes ILIKE '%4 tahun%' = true THEN '4'
				WHEN other_notes ILIKE '%5 tahun%' = true THEN '5'
				WHEN other_notes ILIKE '%6 tahun%' = true THEN '6'
				WHEN other_notes ILIKE '%7 tahun%' = true THEN '7'
				WHEN other_notes ILIKE '%8 tahun%' = true THEN '8'
				WHEN other_notes ILIKE '%9 tahun%' = true THEN '9'
				WHEN other_notes ILIKE '%10 tahun%' = true THEN '10'
				ELSE '1'
				END AS experience,
			/*Jika pada description terdapat kata kunci dibawah ini, maka akan di ekstrak*/
			CASE
				WHEN description ILIKE '%google%' = true THEN 'Google Data Studio'
				END AS skills_and_tools
			FROM jobscrape) as Temp
		WHERE skills_and_tools IS NOT NULL AND job_cluster <> 'Should be excluded') as Temp
ORDER BY job_name ASC , altered_company_name ASC
