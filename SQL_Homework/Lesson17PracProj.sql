
---Create Student Table
CREATE TABLE IF NOT EXISTS Students(
	Student_ID INTEGER Primary Key,
	First_Name VARCHAR(100),
	Last_Name VARCHAR(100),
	DOB DATE,
	Major VARCHAR(100),
	GPA Integer
	)
	;

Select *
From Students;

---Create Courses Table

CREATE TABLE IF NOT EXISTS Courses(
	Course_ID INTEGER Primary Key,
	Course_Name VARCHAR(100),
	Department VARCHAR(100) References Students(Major)
	)
	;

Select *
From Courses;

Drop Table Courses;

---Create Instructors Table
CREATE TABLE IF NOT EXISTS Instructors(
	Instructor_ID INTEGER Primary Key,
	Instructor_Name VARCHAR(100),
	Department VARCHAR(100) References Courses(Department)
	)
;

Select *
From Instructors;

---Create Enrollment Table
CREATE TABLE IF NOT EXISTS Enrollments(
	Enrollment_ID INTEGER Primary Key,
	Student_ID Integer References Students(Student_ID),
	Course_ID Integer References Courses(Course_ID),
	Semester VARCHAR(100),
	Grade VARCHAR(100)
	)
;

Select *
From Enrollments;

---Create a View name CourseSummary
CREATE VIEW CourseSummary AS
SELECT Course_ID, COUNT(Student_ID) AS Total_Students
FROM Enrollments e
GROUP BY Course_ID;

Select *
From CourseSummary;

---Create a view InstructorSchedule that lists each instructor's courses and department
CREATE VIEW InstructorSchedule AS
Select i.Instructor_Name,
      c.Course_Name,
      i.Department
From Instructors i 
Join Courses c on i.Department = c.Department;
      
Select *
From InstructorSchedule;

---Modify the CourseSummary view to list the distinct semesters each course was offered, along with the total student enrolment
Drop View if Exists CourseSummary;

CREATE VIEW CourseSummary AS
SELECT c.Course_ID, 
       c.Course_Name,
       Group_Concat(distinct e.Semester) as Semesters_Offered,
       COUNT(e.Student_ID) AS Total_Students
FROM Enrollments e
Left Join Courses c on e.Course_ID = c.Course_ID 
GROUP BY c.Course_ID,c.Course_Name;

Select *
From CourseSummary;

---Update InstructorSchedule to show only courses for the current semester.
Drop View if Exists InstructorSchedule;

CREATE VIEW InstructorSchedule AS
Select i.Instructor_Name,
      c.Course_Name,
      i.Department,
      e.Semester
From Instructors i 
Join Courses c on i.Department = c.Department
Left Join Enrollments e on c.Course_ID = e.Course_ID
Where e.Semester = 'Spring 2024';

Select *
From InstructorSchedule t;

---Create a view EligibleGraduates that lists students eligible for graduation whose GPA is greater than or equal to 3.7
---Alter EligibleGraduates to include students' GPAs

CREATE VIEW EligibleGraduates As
Select First_Name,
       Last_Name,
       GPA
From Students s
Where GPA >= 3.7;
       
Select *
From EligibleGraduates;

---Rename CourseSummary to CourseEnrollmentSummary
Drop View if Exists CourseSummary;

CREATE VIEW CourseEnrollmentSummary AS
SELECT c.Course_ID, 
       c.Course_Name,
       Group_Concat(distinct e.Semester) as Semesters_Offered,
       COUNT(e.Student_ID) AS Total_Students
FROM Enrollments e
Left Join Courses c on e.Course_ID = c.Course_ID 
GROUP BY c.Course_ID,c.Course_Name;

Select *
From CourseEnrollmentSummary;

---Drop View EligibleGraduates
Drop View if Exists EligibleGraduates;

---Create a CTE named SemesterCourses to list all courses offered in the current semester
  With Semester_Courses as(
		Select distinct c.Course_Name,
		c.Course_ID,
		c.Department,
		e.Semester
		From Courses c
		Left Join Enrollments e on c.Course_ID = e.Course_ID
		Where e.Semester = 'Spring 2024'
		)
		Select * 
	    From Semester_Courses
		;
		
		
