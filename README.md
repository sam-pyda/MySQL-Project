# MySQL-Project
A relational database management system Ffor BNET Learning Academy coded in mySQL with example queries, model, and ERD.
The school system consists of 5 tables: Student details, Department, Exam results, Programmes, and Course details

Format (Tables):

The BNET Academy is a coporate learning platform with the sole aim to build individuals and organizations to achieve their set goal and objectives with the required knowledge.

Data Source: The data was gathered from the experience in learning at BNET Data analysis Cohort in 2022.
### Contributors:
          GROUP 3
    --Nathaniel Emuowho Aki
    -- Esther Oyenekan
    -- Oladipo Eniola Samuel
    -- Uwaila Ekhator
    -- Uche Benjamin Nwosu
    -- Stephen Samuel
    
The Bnetlearningacademy database includes tables with information about the program. The program table contains the code, title, qualification and duration. The course details table inherits the course code, course title, program code, level, semester and credit point. The Students deparment table shows the department in which the students enrolled in. it contains the department name and code.
The student details table has a column with the list of enrollee first name, last name, department code, program code, level, entry year, email etc.. and finally the exam result table which shows the success of each student simplifies the reason for their performance by accepting the student id, course code, grade and carry over. 

Summary of format:

Most of these tables have ids for the primary key so that the row can be uniquely identified. I also made unique indices for them. The foreign keys link the two tables together. For example, the exam result can be linked to the student via the student ID, this is because a student will be the one either passing or failing an exam. The creation of the tables was all done using CREATE TABLE. Then I inserted all the data using INSERT followed by VALUES.
## For Querying;
Its Purpose is to allow the registrar of BNET learning to edit, update and list personal and academic details of students.

