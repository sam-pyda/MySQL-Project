-- BNETlearning Student Database Management System

-- Purpose: To allow the registrar of BNET learning to edit, update and list personal and academic details of students.

-- created by Group 3; 
-- Nathaniel Emuowho Aki
-- Esther Oyenekan
-- Oladipo Eniola Samuel
-- Uwaila Ekhator
-- Uche Benjamin Nwosu
-- Stephen Samuel

-- --------------------------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS bnetlearningacademy;
CREATE database IF NOT EXISTS bnetlearningacademy;

USE bnetlearningacademy;

-- -----------------------------------------------
-- creating table structure for departments. 

CREATE TABLE IF NOT EXISTS departments(
department_code varchar(5) NOT NULL,
department_name varchar(50),
PRIMARY KEY (department_code),
INDEX department_name (department_name)
);

-- dumping data into departments. It is assumed that BNETlearning just began this structured school system for learning as such it has just 2 departments

INSERT INTO departments(department_code, department_name)
VALUES ('DS', 'Data Science'),('BI', 'Business Intelligence');

-- ----------------------------------------------------------------------------------------


-- creating table structure for programs offered in each department

CREATE TABLE IF NOT EXISTS programs(
program_code varchar(7) NOT NULL,
program_title varchar(100),
qualification varchar(50),
duration varchar(20),
department_code varchar(5),
PRIMARY KEY (program_code),
FOREIGN KEY (department_code) REFERENCES departments(department_code) ON DELETE CASCADE
); 

-- dumping data into programs table

INSERT INTO programs
VALUES ('DADBM', 'Data Analysis and Database Management', 'Data Analyst', '3 months', 'DS'),
		('BAPM', 'Business Analysis and Project Management', 'Business Analyst', '3 months', 'BI');
        
-- -----------------------------------------------------------------------------------------------------------------


-- creating table structure for courses taught in each program 

CREATE TABLE IF NOT EXISTS course_details(
course_code varchar(10) NOT NULL,
course_title text,
program_code varchar(7),
level integer UNSIGNED,
semester integer UNSIGNED,
credit_point integer UNSIGNED,
PRIMARY KEY (course_code),
FOREIGN KEY (program_code) REFERENCES programs(program_code) ON DELETE CASCADE,
INDEX course_code (course_code)
);

-- dumping data into course_details table. It is assumed that BNET learning has just 3 levels with each level having 2 semesters and each semester having 3 courses only.

INSERT INTO course_details 
VALUES ('DA101', 'Introduction to Data Analysis', 'DADBM', 100, 1, 2),
		('DA111', 'Introduction to R and R Studio', 'DADBM', 100, 1 , 2),
        ('DBM111', 'Introduction to Database Management', 'DADBM', 100, 1, 2),
        ('DA102', 'Data Manipulation', 'DADBM', 100, 2, 3),
        ('DBM102', 'Database Management Systems', 'DADBM', 100, 2, 2),
        ('DBM112', 'Database Design 1', 'DADBM', 100, 2, 3),
        ('DA201', 'Data Wrangling', 'DADBM', 200, 1, 3),
        ('DA211', 'Data Visualization 1', 'DADBM', 200, 1, 3),
        ('DBM201', 'Database Design 2', 'DADBM', 200, 1, 3),
        ('DA202', 'Data Visualization 2', 'DADBM', 200, 2, 3),
        ('DBM212', 'Starting with MySQL', 'DADBM', 200, 2, 2),
        ('DA212', 'Data Import and Export', 'DADBM', 200, 2, 2),
        ('DBM301', 'Database Implementation', 'DADBM', 300, 1, 2),
        ('DBM311', 'Introduction to SQL', 'DADBM', 300, 1, 3),
        ('DA301', 'Advanced R', 'DADBM', 300, 1, 3),
        ('DBM312', 'Advanced SQL', 'DADBM', 300, 2, 3),
        ('DA302', 'Project', 'DADBM', 300, 2, 5),
        ('DBM302', 'Project', 'DADBM', 300, 2, 5), 
        ('BA101', 'Introduction to Business Analysis', 'BAPM', 100, 1, 2),
        ('BA111', 'Data Literacy', 'BAPM', 100, 1, 2),
        ('PM101', 'Introduction to Project Management', 'BAPM', 100, 1, 2),
        ('PM102', 'Project Design 1', 'BAPM', 100, 2, 2),
        ('PM112', 'Risk Management', 'BAPM', 100, 2, 2),
        ('BA112', 'Data Quality Management', 'BAPM', 100, 2, 3),
        ('BA201', 'Descriptive Analytics Tools', 'BAPM', 200, 1, 3),
        ('BA211', 'Descriptive Analytics Tools', 'BAPM', 200, 1, 3),
        ('PM201', 'Project Design 2', 'BAPM', 200, 1, 3),
        ('PM212', 'Project Planning', 'BAPM', 200, 2, 2),
        ('BA212', 'Data Security', 'BAPM', 200, 2, 3),
        ('BA232', 'Prescriptive Analytic Tools', 'BAPM', 200, 2, 3), 
        ('PM301', 'Resource Management', 'BAPM', 300, 1, 3),
        ('PM311', 'Project Governance', 'BAPM', 300, 1, 3),
        ('BA321', 'Predictive Analytics Tools', 'BAPM', 300, 1, 3),
        ('BA322', 'Advanced Analytics', 'BAPM', 300, 2, 3),
        ('PM302', 'Project', 'BAPM', 300, 2, 5),
        ('BA302', 'Project', 'BAPM', 300, 2, 5);
        
        
 -- ------------------------------------------------------------------------------------------------------------
 

 -- creating table structure for student_details
 
CREATE TABLE IF NOT EXISTS student_details(
student_id varchar(10) NOT NULL,
first_name varchar(30),
last_name varchar(50),
department_code varchar(4),
program_code varchar(7),
level integer UNSIGNED,
entry_year year,
email varchar(50),
street_address text,
city varchar(20),
state varchar(20),
gender char(1),
birth_date date,
state_of_origin varchar(50),
phone_number char(11),
marital_status varchar(50),
next_of_kin_first_name varchar(30),
next_of_kin_number varchar(11),
PRIMARY KEY (student_id),
FOREIGN KEY (program_code) REFERENCES programs(program_code) ON DELETE CASCADE,
FOREIGN KEY (department_code) REFERENCES departments(department_code) ON DELETE CASCADE,
INDEX student_id (student_id, first_name)
);

-- dumping data into the student_details table. It is assumed that for now, BNETlearning admits 20 students only, 10 in each department.

INSERT INTO student_details
VALUES ('DS22101', 'Nathaniel', 'Aki', 'DS', 'DADBM', 100, '2022', 'nath@gmail.com', '2, Festus Str', 'Asaba', 'Delta', 'M', '1997/05/10', 'Delta', '07012647413', 'Unmarried', 'Michael', '08013443251'),
		('DS22102', 'Emeka', 'Peterson', 'DS', 'DADBM', 100, '2022', 'emeka@gmail.com', '3, Ileja Str', 'Oshodi', 'Lagos', 'M', '1995/07/4', 'Edo', '08056754312', 'Unmarried', 'Edozi', '07078645342'),
        ('DS22103', 'James', 'Paul', 'DS', 'DADBM', 100, '2022', 'james@gmail.com', '2, Jacobi Str', 'Warri', 'Delta', 'M', '1994/08/2', 'Delta', '09045827185', 'Unmarried', 'Stephen', '08074185296'),
        ('DS22104', 'Jaden', 'Matt', 'DS', 'DADBM', 100, '2022', 'jaden@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '2000/03/3', 'Abuja', '08076534523', 'Unmarried', 'Wike', '07041785274'),
        ('DS22105', 'Victoria', 'Dennis', 'DS', 'DADBM', 100, '2022', 'victoria@gmail.com', '5, Kingsway', 'Benin', 'Edo', 'F', '1999/02/5', 'Edo', '07014785296', 'Unmarried', 'Martha', '07032165478'),
        ('DS22106', 'Martha', 'Vincent', 'DS', 'DADBM', 100, '2022', 'martha@gmail.com', '6, Lucky way', 'Benin', 'Edo', 'F', '1996/09/1', 'Edo', '08014785236', 'Unmarried', 'Lucy', '08045678912');

INSERT INTO student_details      
VALUES	
        ('BI22202', 'Onuma', 'Ezeoma', 'BI', 'BAPM', 100, '2022', 'onuma@gmail.com', '6, nzeka Str', 'Onitsha', 'Anambra', 'F', '1995/05/3', 'Anambra', '08074145685', 'Unmarried', 'Rachael', '07054685241'),
        ('BI22203', 'Kenneth', 'Akin', 'BI', 'BAPM', 100, '2022', 'kenneth@gmail.com',  '2, Forestry rd' , 'Benin' , 'Edo', 'M', '1998/06/5', 'Edo', '07045612347', 'Unmarried', 'Michael', '07054685248'),
        ('BI22204', 'Mike', 'Alabi', 'BI', 'BAPM', 100, '2022', 'mike@gmail.com', '4, Aldonai Str', 'Dause', 'Zamfara', 'M', '1997/07/8', 'Kano', '08054685241', 'Unmarried', 'Tobe', '09054685241');
       
INSERT INTO student_details      
VALUES	       
        ('DS20101', 'Mark', 'Jakpa', 'DS', 'DADBM', 300, '2020', 'mark@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1996/03/3', 'Abuja', '08076534523', 'Unmarried', 'Wike', '07041785274'),
        ('DS20102', 'Jane', 'Okonkwo', 'DS', 'DADBM', 300, '2020', 'jane@gmail.com', '1, Mustafa Str', 'Masaka', 'Abuja', 'M', '1996/03/3', 'Abuja', '08076534523', 'married', 'Wike', '07041785274'),
        ('DS20103', 'Judas', 'Jakpa', 'DS', 'DADBM', 300, '2020', 'judas@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1990/03/3', 'Abuja', '08076534523', 'married', 'Wike', '07041785274'),
		('DS20104', 'Nichol', 'Brian', 'DS', 'DADBM', 300, '2020', 'mark@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1990/03/3', 'Abuja', '08076534523', 'married', 'Wike', '07041785274'),
        ('DS20105', 'Chinyere', 'Jonh', 'DS', 'DADBM', 300, '2020', 'john@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1996/03/3', 'Abuja', '08076534523', 'Unmarried', 'Wike', '07041785274');
       
       
INSERT INTO student_details
VALUES 
		('BI22201', 'Nathaniel', 'Aki', 'BI', 'BAPM', 100, '2022', 'nath@gmail.com', '2, Festus Str', 'Asaba', 'Delta', 'M', '1997/05/10', 'Delta', '07012647413', 'Unmarried', 'Michael', '08013443251'),
		('DS21101', 'Emeka', 'Peterson', 'DS', 'DADBM', 100, '2022', 'emeka@gmail.com', '3, Ileja Str', 'Oshodi', 'Lagos', 'M', '1995/07/4', 'Edo', '08056754312', 'Unmarried', 'Edozi', '07078645342'),
        ('DS21102', 'James', 'Paul', 'DS', 'DADBM', 100, '2022', 'james@gmail.com', '2, Jacobi Str', 'Warri', 'Delta', 'M', '1994/08/2', 'Delta', '09045827185', 'Unmarried', 'Stephen', '08074185296'),
        ('BI22205', 'Jaden', 'Matt', 'BI', 'BAPM', 100, '2022', 'jaden@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '2000/03/3', 'Abuja', '08076534523', 'Unmarried', 'Wike', '07041785274'),
        ('DS21104', 'Victoria', 'Dennis', 'DS', 'DADBM', 100, '2022', 'victoria@gmail.com', '5, Kingsway', 'Benin', 'Edo', 'F', '1999/02/5', 'Edo', '07014785296', 'Unmarried', 'Martha', '07032165478'),
        ('DS21105', 'Martha', 'Vincent', 'DS', 'DADBM', 100, '2022', 'martha@gmail.com', '6, Lucky way', 'Benin', 'Edo', 'F', '1996/09/1', 'Edo', '08014785236', 'Unmarried', 'Lucy', '08045678912');
INSERT INTO student_details
VALUES
        ('DS21103', 'Kenneth', 'Akin', 'DS', 'DADBM', 200, '2022', 'kenneth@gmail.com',  '2, Forestry rd' , 'Benin' , 'Edo', 'M', '1998/06/5', 'Edo', '07045612347', 'Unmarried', 'Michael', '07054685248');

INSERT INTO student_details
VALUES 
		('BI21201', 'Onuma', 'Ezeoma', 'BI', 'BAPM', 200, '2022', 'onuma@gmail.com', '6, nzeka Str', 'Onitsha', 'Anambra', 'F', '1995/05/3', 'Anambra', '08074145685', 'Unmarried', 'Rachael', '07054685241'),
        ('BI21202', 'Kenneth', 'Akin', 'BI', 'BAPM', 200, '2022', 'kenneth@gmail.com',  '2, Forestry rd' , 'Benin' , 'Edo', 'M', '1998/06/5', 'Edo', '07045612347', 'Unmarried', 'Michael', '07054685248'),
        ('BI21203', 'Mike', 'Alabi', 'BI', 'BAPM', 200, '2022', 'mike@gmail.com', '4, Aldonai Str', 'Dause', 'Zamfara', 'M', '1997/07/8', 'Kano', '08054685241', 'Unmarried', 'Tobe', '09054685241'),
        ('BI21204', 'Mark', 'Jakpa', 'BI', 'BAPM', 200, '2020', 'mark@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1996/03/3', 'Abuja', '08076534523', 'Unmarried', 'Wike', '07041785274'),
        ('BI21205', 'Jane', 'Okonkwo', 'BI', 'BAPM', 200, '2020', 'jane@gmail.com', '1, Mustafa Str', 'Masaka', 'Abuja', 'M', '1996/03/3', 'Abuja', '08076534523', 'married', 'Wike', '07041785274'),
        ('BI20201', 'Judas', 'Jakpa', 'BI', 'BAPM', 300, '2020', 'judas@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1990/03/3', 'Abuja', '08076534523', 'married', 'Wike', '07041785274'),
		('BI20202', 'Nichol', 'Brian', 'BI', 'BAPM', 300, '2020', 'mark@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1990/03/3', 'Abuja', '08076534523', 'married', 'Wike', '07041785274'),
        ('BI20203', 'Chinyere', 'Jonh', 'BI', 'BAPM', 300, '2020', 'john@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1996/03/3', 'Abuja', '08076534523', 'Unmarried', 'Wike', '07041785274'),
        ('BI20204', 'Musa', 'Karin', 'BI', 'BAPM', 300, '2020', 'mark@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1990/03/3', 'Abuja', '08076534523', 'married', 'Wike', '07041785274'),
        ('BI20205', 'Chibuzo', 'Olu', 'BI', 'BAPM', 300, '2020', 'john@gmail.com', '1, Jaden Str', 'Masaka', 'Abuja', 'M', '1996/03/3', 'Abuja', '08076534523', 'Unmarried', 'Wike', '07041785274');
        
-- ------------------------------------------------------------------------------------------------------------------------------------------------    

CREATE TABLE IF NOT EXISTS exam_results(
student_id varchar(10),
course_code varchar(10),
grade char(1),
carry_over varchar(3),
FOREIGN KEY (student_id) REFERENCES student_details(student_id) ON DELETE CASCADE,
FOREIGN KEY (course_code) REFERENCES course_details(course_code) ON DELETE CASCADE
);

-- dumping data into the exam_details table. Here, we assume that all students in their respective levels have currently taken only the first semester exams.

INSERT INTO exam_results 
VALUES ('DS22101', 'DA101', 'A', 'NO'),
		('DS22102', 'DA101', 'B', 'NO'),
        ('DS22103', 'DA101', 'A', 'NO'),
		('DS22104', 'DA101', 'C', 'NO'),
		('DS22105', 'DA101', 'A', 'NO'),
		('DS22106', 'DA101', 'A', 'NO');

INSERT INTO exam_results
VALUES
		('BI22201', 'BA101', 'A', 'NO'), 
        ('BI22202', 'BA101', 'A', 'NO'), 
        ('BI22203', 'BA101', 'A', 'NO'), 
        ('BI22204', 'BA101', 'A', 'NO');

INSERT INTO exam_results
VALUES    
		('DS22101', 'DA111', 'A', 'NO'),
		('DS22102', 'DA111', 'B', 'NO'),
        ('DS22103', 'DA111', 'A', 'NO'),
		('DS22104', 'DA111', 'C', 'NO'),
		('DS22105', 'DA111', 'A', 'NO'),
		('DS22106', 'DA111', 'A', 'NO');

INSERT INTO exam_results
VALUES 
		('BI22201', 'BA111', 'A', 'NO'), 
        ('BI22202', 'BA111', 'A', 'NO'), 
        ('BI22203', 'BA111', 'A', 'NO'), 
        ('BI22204', 'BA111', 'A', 'NO');
        
INSERT INTO exam_results
VALUES 
		('DS22101', 'DBM111', 'A', 'NO'),
		('DS22102', 'DBM111', 'B', 'NO'),
        ('DS22103', 'DBM111', 'A', 'NO'),
		('DS22104', 'DBM111', 'C', 'NO'),
		('DS22105', 'DBM111', 'A', 'NO'),
		('DS22106', 'DBM111', 'A', 'NO');
        
INSERT INTO exam_results
VALUES 
		('BI22201', 'PM101', 'A', 'NO'), 
        ('BI22202', 'PM101', 'C', 'NO'), 
        ('BI22203', 'PM101', 'A', 'NO'), 
        ('BI22204', 'PM101', 'A', 'NO');
        
        
INSERT INTO exam_results
VALUES 
		('BI21201', 'BA201', 'A', 'NO'), 
        ('BI21202', 'BA201', 'A', 'NO'),
        ('BI21203', 'BA201', 'A', 'NO'), 
        ('BI21204', 'BA201', 'F', 'YES'),
        ('BI21205', 'BA201', 'A', 'NO');


INSERT INTO exam_results
VALUES 
		('BI21201', 'BA211', 'A', 'NO'), 
        ('BI21202', 'BA211', 'F', 'YES'),
        ('BI21203', 'BA211', 'A', 'NO'), 
        ('BI21204', 'BA211', 'C', 'NO'),
        ('BI21205', 'BA211', 'A', 'NO');
		
INSERT INTO exam_results
VALUES 
		('BI21201', 'PM201', 'A', 'NO'), 
        ('BI21202', 'PM201', 'C', 'NO'),
        ('BI21203', 'PM201', 'A', 'NO'), 
        ('BI21204', 'PM201', 'B', 'NO'),
        ('BI21205', 'PM201', 'A', 'NO');
		
		
INSERT INTO exam_results
VALUES        
       ('DS20101', 'DBM301', 'B', 'NO'),
        ('DS20102', 'DBM301', 'A', 'NO'),
        ('DS20103', 'DBM301', 'C', 'NO'),
        ('DS20104', 'DBM301', 'A', 'NO'),
        ('DS20105', 'DBM301', 'B', 'NO');
        

INSERT INTO exam_results
VALUES  
		('BI20201', 'PM301', 'A', 'NO'),
        ('BI20202', 'PM301', 'C', 'NO'),
        ('BI20203', 'PM301', 'B', 'NO'),
        ('BI20204', 'PM301', 'C', 'NO'),
        ('BI20205', 'PM301', 'A', 'NO');
        
INSERT INTO exam_results
VALUES 
		('DS20101', 'DBM311', 'B', 'NO'),
        ('DS20102', 'DBM311', 'A', 'NO'),
        ('DS20103', 'DBM311', 'C', 'NO'),
        ('DS20104', 'DBM311', 'A', 'NO'),
        ('DS20105', 'DBM311', 'B', 'NO');
        
INSERT INTO exam_results
VALUES
         ('BI20201', 'PM311', 'F', 'YES'),
        ('BI20202', 'PM311', 'C', 'NO'),
        ('BI20203', 'PM311', 'C', 'NO'),
        ('BI20204', 'PM311', 'F', 'YES'),
        ('BI20205', 'PM311', 'C', 'NO'),
        ('DS20101', 'DA301', 'B', 'NO'),
        ('DS20102', 'DA301', 'A', 'NO'),
        ('DS20103', 'DA301', 'C', 'NO'),
        ('DS20104', 'DA301', 'A', 'NO'),
        ('DS20105', 'DA301', 'B', 'NO'),
        ('BI20201', 'BA321', 'A', 'NO'),
        ('BI20202', 'BA321', 'C', 'NO'),
        ('BI20203', 'BA321', 'B', 'NO'),
        ('BI20204', 'BA321', 'C', 'NO'),
        ('BI20205', 'BA321', 'A', 'NO');
        
INSERT INTO exam_results
VALUES
		('DS21101', 'DBM201', 'B', 'NO'),
        ('DS21102', 'DBM201', 'A', 'NO'),
        ('DS21103', 'DBM201', 'C', 'NO'),
        ('DS21104', 'DBM201', 'A', 'NO'),
        ('DS21105', 'DBM201', 'B', 'NO'),
        ('DS21101', 'DA211', 'B', 'NO'),
        ('DS21102', 'DA211', 'A', 'NO'),
        ('DS21103', 'DA211', 'C', 'NO'),
        ('DS21104', 'DA211', 'A', 'NO'),
        ('DS21105', 'DA211', 'B', 'NO');  
  
INSERT INTO exam_results
VALUES
		('DS21101', 'DA201', 'B', 'NO'),
        ('DS21102', 'DA201', 'A', 'NO'),
        ('DS21103', 'DA201', 'C', 'NO'),
        ('DS21104', 'DA201', 'A', 'NO'),
        ('DS21105', 'DA201', 'B', 'NO'),
		('DS21101', 'DA201', 'B', 'NO'),
        ('DS21102', 'DA201', 'A', 'NO'),
        ('DS21103', 'DA201', 'C', 'NO'),
        ('DS21104', 'DA201', 'A', 'NO'),
        ('DS21105', 'DA201', 'B', 'NO');
        
-- --------------------------------------------------------------------------------
-- manipulating table using sime queries
-- Using select and where as a conditional statement on the table

select * from student_details
where first_name like ('mark'); -- selects details of student with mark as first name

select grade,count(student_id) as best_grade from exam_results
where grade = 'A' or grade ='B'
Group by grade
order by grade asc; -- displays the numbero student with best grades

-- using groupby
select entry_year from student_details;
select sum(entry_year) from student_details
where entry_year > '2020'
group by student_id
order by student_id;

-- updating data using inserts 
insert into student_details 
values('BI222001','Bisi', 'Adekemi', 'BI', 'BAPM', 100,2022, 'bisi@gmail.com','5,kabir str','zion','Abuja','M','1997-10-01','Sokoto',08023459254,'Married','Gladys',08094959292);

