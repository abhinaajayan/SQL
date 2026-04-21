CREATE DATABASE STUDY;
USE STUDY;
CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int );
INSERT INTO studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATTRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000;

SELECT * FROM studies;

CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int);
INSERT INTO software VALUES 
('MARY','README','CPP',300, 1200, 84),
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
('QADIR','VACCINES','C',1900, 3100, 21),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73),
('REMITHA','PC UTILITIES','C',725, 5000, 51),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2),
('VIJAYA','TSR EDITOR','C',900, 700, 6);

SELECT * FROM software;

CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int);

INSERT INTO programmer VALUES
('ANAND','1966-04-12','1992-04-21','M','PASCAL','BASIC',3200),
('ALTAF','1964-07-07','1990-11-09','M','CLIPPER','COBOL',2800),
('JULIANA','1960-01-30','1990-04-21','F','COBOL','DBASE',3000),
('KAMALA','1968-10-30','1993-01-17','F','C','DBASE',2900),
('MARY','1970-06-24','1991-02-23','F','CPP','ORACLE',4500),
('NELSON','1985-09-11','1989-10-12','M','COBOL','DBASE',2500),
('PATTRICK','1965-11-14','1990-04-10','M','PASCAL','CLIPPER',2800),
('QADIR','1965-08-08','1991-04-11','M','ASSEMBLY','C',3000),
('RAMESH','1967-05-16','1991-02-26','M','PASCAL','DBASE',3200),
('REBECCA','1967-01-30','1990-12-18','F','BASIC','COBOL',2500),
('REMITHA','1970-04-06','1993-04-09','F','C','ASSEMBLY',3600),
('REVATHI','1969-12-20','1992-01-12','F','PASCAL','BASIC',3700),
('VIJAYA','1965-12-19','1992-05-22','F','FOXPRO','C',3500);

SELECT * FROM programmer;

# Find out the selling cost AVG for packages developed in Pascal.
SELECT AVG(SCOST) AS avg_selling_cost
FROM software 
WHERE DEVELOPIN = 'PASCAL';

# Display Names, Ages of all Programmers.
SELECT PNAME,
TIMESTAMPDIFF (YEAR,DOB,DOJ) AS AGE
FROM programmer;

# Display the Names of those who have done the DAP Course.
SELECT PNAME
FROM studies
WHERE COURSE = 'DAP';

# Display the Names and Date of Births of all Programmers Born in January.
SELECT PNAME,DOB
FROM programmer
WHERE MONTH(DOB) ='1';

# What is the Highest Number of copies sold by a Package?
SELECT * FROM software
ORDER BY sold DESC 
LIMIT 1;

# Display lowest course Fee.
SELECT * FROM studies
ORDER BY course_fee ASC
LIMIT 1;

# How many programmers done the PGDCA Course?
SELECT pname FROM studies
WHERE course = 'PGDCA';

# How much revenue has been earned thru sales of Packages Developed in C
SELECT SUM(SCOST*SOLD) AS total_revenue
FROM software
WHERE developin ='C';

# Display the Details of the Software Developed by Ramesh
SELECT DEVELOPIN FROM software
WHERE PNAME = 'Ramesh';

# How many Programmers Studied at Sabhari?
SELECT PNAME FROM studies
WHERE INSTITUTE = 'SABHARI';

# Display details of Packages whose sales crossed the 2000 Mark.
SELECT DEVELOPIN FROM software
WHERE SCOST*SOLD>2000;

# Display the Details of Packages for which Development Cost have been recovered.
SELECT DEVELOPIN FROM software
WHERE DCOST<=SCOST*SOLD;

# How many Packages Developed in DBASE?
SELECT COUNT(*) AS Total_packages
FROM software
WHERE DEVELOPIN = 'DBASE';

# How many programmers studied in Pragathi?
SELECT PNAME FROM Studies
WHERE INSTITUTE = 'Pragathi';

# How many Programmers Paid 5000 to 10000 for their course?
SELECT pname FROM Studies
WHERE COURSE_FEE BETWEEN 5000 AND 10000;

# What is AVG Course Fee
SELECT AVG(COURSE_FEE) AS avg_course_fee
FROM studies;

# Display the details of the Programmers Knowing C.
SELECT * FROM programmer
WHERE PROF1 = 'C' OR PROF2 = 'C';

# How many Programmers know either COBOL or PASCAL.
SELECT COUNT(*) AS total_programmers
FROM programmer 
WHERE PROF1 IN ('COBOL','PASCAL')
OR
PROF2 IN ('COBOL','PASCAL');

# How many Programmers Don’t know PASCAL and C
SELECT COUNT(*) AS total_programmers
FROM programmer
WHERE PROF1 NOT IN ('PASCAL', 'C')
AND
PROF2 NOT IN('PASCAL', 'C');

# How old is the Oldest Male Programmer.
SELECT * FROM programmer
WHERE DOB = (SELECT MIN(DOB) FROM programmer WHERE gender = 'M');

# What is the AVG age of Female Programmers?
SELECT AVG(TIMESTAMPDIFF(YEAR,DOB,CURDATE())) AS avg_age
FROM programmer
WHERE GENDER = 'F';

# Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
SELECT PNAME, TIMESTAMPDIFF(YEAR,DOJ,CURDATE()) AS experience 
FROM programmer
ORDER BY experience DESC;

# Who are the Programmers who celebrate their Birthday’s During the Current Month?
SELECT PNAME FROM programmer
WHERE MONTH(DOB) = MONTH(CURDATE());

# How many Female Programmers are there?
SELECT COUNT(*) AS total_females
FROM programmer
WHERE gender = 'F';

# What are the Languages studied by Male Programmers.
SELECT PROF1 AS Languages
FROM programmer
WHERE gender = 'M'
UNION
SELECT PROF2
FROM programmer
WHERE gender = 'M';

# What is the AVG Salary?
SELECT AVG(salary) as avg_salary
FROM programmer;

# How many people draw salary 2000 to 4000?
SELECT COUNT(*) AS total
FROM programmer
WHERE salary BETWEEN 2000 AND 4000;

# Display the details of those who don’t know Clipper, COBOL or PASCAL.
SELECT * FROM Programmer 
WHERE PROF1 NOT IN ('Clipper', 'COBOL', 'PASCAL')
OR PROF2 NOT IN ('Clipper', 'COBOL', 'PASCAL');

# Display the Cost of Package Developed By each Programmer.
SELECT PNAME,DCOST FROM software;

# Display the sales values of the Packages Developed by the each Programmer.
SELECT PNAME, TITLE, (SCOST*SOLD) AS sales_values 
FROM software;

# Display the Number of Packages sold by Each Programmer.
SELECT PNAME, SUM(SOLD) AS number_of_packages
FROM software
GROUP BY PNAME;

# Display the sales cost of the packages Developed by each Programmer Language wise.
SELECT PNAME, DEVELOPIN, SUM(SCOST) AS total_cost
FROM software
GROUP BY PNAME, DEVELOPIN;

# Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
SELECT DEVELOPIN,  
AVG(DCOST) AS AVG_Development_Cost,
AVG(SCOST) AS AVG_Selling_Cost, 
AVG(SCOST) AS AVG_Price_per_copy
FROM software
GROUP BY DEVELOPIN;

# Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
SELECT PNAME,
MAX(SCOST) AS costliest_package,
MIN(SCOST) AS cheapest_Packages
FROM software
GROUP BY PNAME; 

# Display each institute name with number of Courses, Average Cost per Course.
SELECT INSTITUTE, COUNT(COURSE) AS number_of_courses, AVG(COURSE_FEE) AS avg_cost_per_course
FROM studies
GROUP BY Institute;

# Display each institute Name with Number of Students.
SELECT INSTITUTE, COUNT(PNAME) AS number_of_students
FROM studies
GROUP BY INSTITUTE;

# Display Names of Male and Female Programmers. Gender also.
SELECT PNAME, GENDER FROM programmer;

# Display the Name of Programmers and Their Packages.
SELECT PNAME, TITLE FROM software;

# Display the Number of Packages in Each Language Except C and C++
SELECT DEVELOPIN, COUNT(TITLE) AS number_of_packages
FROM software
WHERE DEVELOPIN NOT IN ('C','CPP')
GROUP BY DEVELOPIN ;

# Display the Number of Packages in Each Language for which Development Cost is less than 1000.
SELECT DEVELOPIN, COUNT(TITLE) AS number_of_packages 
FROM software
WHERE DCOST<1000
GROUP BY DEVELOPIN;

# Display AVG Difference between SCOST, DCOST for Each Package.
SELECT TITLE, AVG(SCOST-DCOST) AS difference_scost_dcost
FROM software
GROUP BY TITLE;

# Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
SELECT PNAME,
SUM(SCOST) AS total_scost,
SUM(DCOST) AS total_dcost,
SUM(DCOST-SCOST*SOLD) AS amount_to_be_recovered
FROM software
GROUP BY PNAME
HAVING SUM(SCOST*SOLD) < SUM(DCOST);

# Display Highest, Lowest and Average Salaries for those earning more than 2000.
SELECT
MAX(salary) AS highest_salary,
MIN(salary) AS lowest_salary,
AVG(salary) AS avg_salary
FROM programmer
WHERE SALARY > 2000;

# Who is the Highest Paid C Programmers?
SELECT PNAME, SALARY
FROM programmer 
WHERE SALARY = (SELECT MAX(SALARY) FROM programmer
WHERE PROF1 = 'C' OR PROF2 = 'C');

# Who is the Highest Paid Female COBOL Programmer?
SELECT PNAME, SALARY
FROM programmer
WHERE gender = 'F' AND (PROF1 = 'COBOL' OR PROF2 = 'COBOL')
AND SALARY = (SELECT MAX(SALARY) FROM programmer 
WHERE gender = 'F' AND PROF1 = 'COBOL' OR PROF2 = 'COBOL');

# Display the names of the highest paid programmers for each Language.
SELECT p.PNAME, p.SALARY, l.LANGUAGE
FROM (SELECT PNAME, SALARY, PROF1 AS LANGUAGE FROM programmer
UNION ALL
SELECT PNAME, SALARY, PROF2 FROM programmer) l
JOIN programmer p ON p.PNAME = l.PNAME AND p.SALARY = l.SALARY
WHERE (l.LANGUAGE, p.SALARY) 
IN (SELECT LANGUAGE, MAX(SALARY)
FROM (SELECT PROF1 AS LANGUAGE, SALARY FROM programmer
UNION ALL
SELECT PROF2, SALARY FROM programmer) x
GROUP BY LANGUAGE);

# Who is the least experienced Programmer.
SELECT PNAME,TIMESTAMPDIFF(YEAR,DOJ,CURDATE()) AS experience
FROM programmer 
ORDER BY experience ASC
LIMIT 1;

# Who is the most experienced male programmer knowing PASCAL.
SELECT PNAME,TIMESTAMPDIFF(YEAR,DOJ,CURDATE()) AS experience
FROM programmer 
WHERE gender = 'M' AND (PROF1 = 'PASCAL' OR PROF2 = 'PASCAL')
ORDER BY experience DESC
LIMIT 1;

# Which Language is known by only one Programmer?
SELECT LANGUAGES
FROM (SELECT PROF1 AS LANGUAGES, PNAME FROM programmer
UNION ALL 
SELECT PROF2, PNAME FROM programmer)c
GROUP BY LANGUAGES
HAVING COUNT(DISTINCT PNAME) = 1;

# Who is the Above Programmer Referred in 50?
SELECT PNAME, LANGUAGES
FROM (SELECT PNAME, PROF1 AS LANGUAGES FROM programmer
UNION ALL 
SELECT PNAME, PROF2 FROM programmer)c
WHERE LANGUAGES IN (SELECT LANGUAGES 
FROM (SELECT PROF1 AS LANGUAGES, PNAME FROM programmer
UNION ALL
SELECT PROF2, PNAME FROM programmer) x
GROUP BY LANGUAGES
HAVING COUNT(DISTINCT PNAME) = 1);

#Who is the Youngest Programmer knowing DBASE?
SELECT PNAME, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) AS age
FROM programmer
WHERE PROF1 = 'DBASE' OR PROF2 = 'DBASE'
ORDER BY age ASC
LIMIT 1;

# Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
SELECT PNAME 
FROM programmer
WHERE gender = 'F'
AND salary > 3000
AND PROF1 NOT IN ('C','CPP','ORACLE','DBASE')
AND PROF2 NOT IN ('C','CPP','ORACLE','DBASE');                            


# Which Institute has most number of Students?
SELECT INSTITUTE, COUNT(PNAME) AS number_of_students
FROM studies
GROUP BY INSTITUTE
ORDER BY number_of_students DESC
LIMIT 1;                                     

# What is the Costliest course?
SELECT PNAME, COURSE_FEE
FROM studies
ORDER BY COURSE_FEE DESC
LIMIT 1;

# Which course has been done by the most of the Students?
SELECT COURSE, COUNT(PNAME) AS total_students
from studies
GROUP BY course 
ORDER BY total_students DESC
LIMIT 1;

# Which Institute conducts costliest course.
SELECT course, course_fee, institute
FROM studies
ORDER BY course_fee DESC
LIMIT 1;

# Display the name of the Institute and Course, which has below AVG course fee.
SELECT institute, course, course_fee
FROM studies 
WHERE course_fee < (SELECT AVG(course_fee) FROM studies);

# Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,
 SELECT course, course_fee
 FROM studies
 WHERE course_fee BETWEEN
 (SELECT AVG(course_fee) - 1000 FROM studies) AND
 (SELECT AVG(course_fee) + 1000 FROM studies);
 
# Which package has the Highest Development cost?
SELECT title, dcost
FROM software
ORDER BY dcost DESC
LIMIT 1;

# Which course has below AVG number of Students?
SELECT course
FROM studies
GROUP BY course 
HAVING COUNT(pname) < (SELECT AVG(course_count) FROM (SELECT COUNT(pname) AS course_count FROM studies GROUP BY course) AS i);

# Which Package has the lowest selling cost?
SELECT title, scost
FROM software 
ORDER BY scost ASC
LIMIT 1;

# Who Developed the Package that has sold the least number of copies?
SELECT pname
FROM software 
ORDER BY sold ASC
LIMIT 1;

# Which language has used to develop the package, which has the highest sales amount?
SELECT developin
FROM software
ORDER BY sold DESC
LIMIT 1;

# How many copies of package that has the least difference between development and selling cost where sold.
SELECT SOLD
FROM software
ORDER BY (DCOST - SCOST) ASC
LIMIT 1;

# Which is the costliest package developed in PASCAL.
SELECT TITLE
FROM software
WHERE DEVELOPIN = 'PASCAL'
ORDER BY SCOST DESC
LIMIT 1;

# Which language was used to develop the most number of Packages.
SELECT DEVELOPIN
FROM software
GROUP BY DEVELOPIN
ORDER BY COUNT(*) DESC
LIMIT 1;

# Which programmer has developed the highest number of Packages?
SELECT PNAME
FROM software
GROUP BY PNAME
ORDER BY COUNT(*) DESC
LIMIT 1;

# Who is the Author of the Costliest Package?
SELECT PNAME
FROM software
ORDER BY SCOST DESC
LIMIT 1;

# Display the names of the packages, which have sold less than the AVG number of copies.
SELECT TITLE
FROM software
WHERE SOLD < (SELECT AVG(SOLD) FROM software);

# Display the programmer Name and the cheapest packages developed by them in each language.
SELECT PNAME, DEVELOPIN, TITLE, SCOST
FROM software s1
WHERE SCOST = (
SELECT MIN(SCOST)
FROM software s2
WHERE s1.PNAME = s2.PNAME
AND s1.DEVELOPIN = s2.DEVELOPIN);
      
# Display the language used by each programmer to develop the Highest Selling and Lowestselling package.
SELECT PNAME, DEVELOPIN, SOLD
FROM software s1
WHERE SOLD = (
SELECT MAX(SOLD)
FROM software s2
WHERE s1.PNAME = s2.PNAME
)
OR SOLD = (
SELECT MIN(SOLD)
FROM software s3
WHERE s1.PNAME = s3.PNAME
)
ORDER BY PNAME; 

# Who is the youngest male Programmer born in 1965?
SELECT PNAME
FROM programmer
WHERE GENDER = 'M'
AND YEAR(DOB) = 1965
ORDER BY DOB DESC
LIMIT 1;

# Who is the oldest Female Programmer who joined in 1992?
SELECT PNAME
FROM programmer
WHERE GENDER = 'F'
  AND YEAR(DOJ) = 1992
ORDER BY DOB ASC
LIMIT 1;

# In which year was the most number of Programmers born.
SELECT YEAR(DOB) AS birth_year
FROM programmer
GROUP BY YEAR(DOB)
ORDER BY COUNT(*) DESC
LIMIT 1;

# In which month did most number of programmers join?
SELECT MONTH(DOJ) AS join_month
FROM programmer
GROUP BY MONTH(DOJ)
ORDER BY COUNT(*) DESC
LIMIT 1;

# In which language are most of the programmer’s proficient.
SELECT language
FROM (
SELECT PROF1 AS language FROM programmer
UNION ALL
SELECT PROF2 FROM programmer
) AS all_langs
GROUP BY language
ORDER BY COUNT(*) DESC
LIMIT 1;

# Who are the male programmers earning below the AVG salary of Female Programmers?
SELECT PNAME
FROM programmer
WHERE GENDER = 'M'
AND SALARY < (
SELECT AVG(SALARY)
FROM programmer
WHERE GENDER = 'F'
);

# Who are the Female Programmers earning more than the Highest Paid?
SELECT PNAME
FROM programmer
WHERE GENDER = 'F'
AND SALARY > (
SELECT MAX(SALARY)
FROM programmer);

# Which language has been stated as the proficiency by most of the Programmers?
SELECT language
FROM (
SELECT PROF1 AS language FROM programmer
UNION ALL
SELECT PROF2 FROM programmer) AS langs
GROUP BY language
ORDER BY COUNT(*) DESC
LIMIT 1;

# Display the details of those who are drawing the same salary.
SELECT *
FROM programmer
WHERE SALARY IN (
SELECT SALARY
FROM programmer
GROUP BY SALARY
HAVING COUNT(*) > 1);

# Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
SELECT *
FROM software
WHERE PNAME IN (
SELECT PNAME
FROM programmer
WHERE GENDER = 'M'
AND SALARY > 3000);

# Display the details of the packages developed in Pascal by the Female Programmers.
SELECT *
FROM software
WHERE DEVELOPIN = 'PASCAL'
AND PNAME IN (
SELECT PNAME
FROM programmer
WHERE GENDER = 'F');

# Display the details of the Programmers who joined before 1990.
SELECT *
FROM programmer
WHERE DOJ < '1990-01-01';

# Display the details of the Software Developed in C By female programmers of Pragathi.
SELECT *
FROM software
WHERE DEVELOPIN = 'C'
AND PNAME IN (
SELECT s.PNAME
FROM studies s
JOIN programmer p ON s.PNAME = p.PNAME
WHERE s.INSTITUTE = 'PRAGATHI'
AND p.GENDER = 'F');

# Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
SELECT *
FROM software
WHERE DEVELOPIN = 'DBASE'
AND PNAME IN (
SELECT p.PNAME
FROM programmer p
JOIN studies s ON p.PNAME = s.PNAME
WHERE p.GENDER = 'M'
AND s.INSTITUTE = (
SELECT INSTITUTE
FROM studies
GROUP BY INSTITUTE
ORDER BY COUNT(*) DESC
LIMIT 1));

# Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.
SELECT *
FROM software
WHERE PNAME IN (
SELECT PNAME
FROM programmer
WHERE (GENDER = 'M' AND DOB < '1965-01-01')
OR (GENDER = 'F' AND DOB > '1975-01-01'));

# Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers.
SELECT s.*
FROM software s
JOIN programmer p ON s.PNAME = p.PNAME
WHERE s.DEVELOPIN NOT IN (p.PROF1, p.PROF2);

# What is the AVG salary for those whose software sales is more than 50,000/-.
SELECT AVG(SALARY)
FROM programmer
WHERE PNAME IN (
SELECT PNAME
FROM software
GROUP BY PNAME
HAVING SUM(SCOST * SOLD) > 50000);

# How many packages were developed by students, who studied in institute that charge the lowest course fee?
SELECT COUNT(*)
FROM software
WHERE PNAME IN (
SELECT PNAME
FROM studies
WHERE COURSE_FEE = (
SELECT MIN(COURSE_FEE)
FROM studies));

# How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
SELECT s.PNAME, COUNT(*) AS total_packages, st.INSTITUTE
FROM software s
JOIN studies st ON s.PNAME = st.PNAME
WHERE s.PNAME IN (
SELECT PNAME
FROM software
WHERE SCOST = (SELECT MIN(SCOST) FROM software))
GROUP BY s.PNAME, st.INSTITUTE;

# How many packages were developed by the female programmers earning more than the highest paid male programmer?
SELECT COUNT(*)
FROM software
WHERE PNAME IN (
SELECT PNAME
FROM programmer
WHERE GENDER = 'F'
AND SALARY > (
SELECT MAX(SALARY)
FROM programmer
WHERE GENDER = 'M')
);

# How many packages are developed by the most experienced programmer form BDPS.
SELECT COUNT(*)
FROM software
WHERE PNAME = (
SELECT p.PNAME
FROM programmer p
JOIN studies s ON p.PNAME = s.PNAME
WHERE s.INSTITUTE = 'BDPS'
ORDER BY p.DOJ ASC
LIMIT 1
);

# List the programmers (form the software table) and the institutes they studied.
SELECT DISTINCT s.PNAME, st.INSTITUTE
FROM software s
JOIN studies st ON s.PNAME = st.PNAME;

# List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.
SELECT l.language,
COUNT(DISTINCT p.PNAME) AS num_programmers,
COUNT(s.TITLE) AS num_packages
FROM (
SELECT PROF1 AS language, PNAME FROM programmer
UNION
SELECT PROF2, PNAME FROM programmer
) l
LEFT JOIN programmer p ON l.PNAME = p.PNAME
LEFT JOIN software s ON l.language = s.DEVELOPIN
GROUP BY l.language; 

# List the programmer names (from the programmer table) and No. Of Packages each has developed. 
SELECT p.PNAME, COUNT(s.TITLE) AS num_packages
FROM programmer p
LEFT JOIN software s ON p.PNAME = s.PNAME
GROUP BY p.PNAME;
