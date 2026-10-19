---Write a query to create a patients table with the date, patient ID, patient name, age, weight, gender, 
---location, phone number, disease, doctor name, and doctor ID fields 
Create Table if not Exists patients (
date Date,
pid VARCHAR(100) Primary Key,
p_name VARCHAR(100),
age Integer,
weight Integer,
gender VARCHAR(100),
location VARCHAR(100),
phone_no Integer,
disease VARCHAR(100),
doctor_name VARCHAR(100),
doctor_id Integer
)
;

---Write a query to display the total number of patients in the table

Select Count(*) as total_patients
From patients;

---Write a query to display the patient id and patient name with the current date
SELECT 
    pid, 
    p_name, 
    CURRENT_DATE AS current_date
FROM 
    patients;

---Write a query to display the old patient name and the new patient name in uppercase
Select 
	pid,
	p_name as old_p_name,
	Upper(p_name) as new_p_name
From patients;	

---Write a query to display the patients' names along with the total number of characters in their name
Select 
	p_name,
	Length(p_name) as p_name_length
From patients;

---Write a query to combine the patient's name and the doctor's name in a new column
Select 
	p_name,
	doctor_name,
	p_name || ',' || doctor_name as patient_and_doctor_name
From patients;

---Write a query to extract the year for a given date and place it in a separate column
SELECT 
    "date" AS patient_date,
    SUBSTR("date", -4) AS extracted_year
FROM patients;

---Write a query to display duplicate entries in the doctor name column
SELECT 
	doctor_name,
	COUNT(doctor_name) as duplicate_doctor
From patients 
Group by doctor_name
Having COUNT(*) >= 1;

