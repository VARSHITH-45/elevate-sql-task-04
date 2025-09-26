-- =================================================================
-- SQL Query Script: Data Aggregation, Grouping, and Filtering Groups
-- =================================================================
-- This script demonstrates how to summarize data using aggregate
-- functions, categorize it with GROUP BY, and filter those
-- categories with the HAVING clause.
-- =================================================================
-- Selects the 'healthcare' database to ensure all subsequent commands are run against it.
USE healthcare;
-- =================================================================
-- 1. Using Aggregate Functions (COUNT, MIN, MAX, AVG)
-- =================================================================
-- These functions take a load of rows and boil 'em down to a single value.

-- Query 1: How many patients do we have in total? A simple headcount.
SELECT COUNT(*) AS TotalPatients FROM Patients;

-- Query 2: How many unique medical specializations do our doctors have?
SELECT COUNT(DISTINCT Specialization) AS UniqueSpecializations FROM Doctors;

-- Query 3: Who is our oldest and youngest patient? We'll find the MIN and MAX birth dates.
SELECT MIN(DateOfBirth) AS OldestPatientBirthDate, MAX(DateOfBirth) AS YoungestPatientBirthDate FROM Patients;

-- Query 4: What is the average age of our patients? We'll calculate it on the fly.
SELECT AVG(YEAR(CURDATE()) - YEAR(DateOfBirth)) AS AveragePatientAge FROM Patients;


-- =================================================================
-- 2. Categorizing with `GROUP BY`
-- =================================================================
-- This is how we chop up the data into different bins or categories.

-- Query 1: Count how many doctors we have for each specialization.
SELECT Specialization, COUNT(*) AS NumberOfDoctors
FROM Doctors
WHERE Specialization IS NOT NULL
GROUP BY Specialization;

-- Query 2: Count how many appointments each patient has booked.
SELECT PatientID, COUNT(AppointmentID) AS TotalAppointments
FROM Appointments
GROUP BY PatientID;

-- Query 3: Count how many appointments are scheduled for each month.
SELECT YEAR(AppointmentDateTime) AS AppointmentYear, MONTH(AppointmentDateTime) AS AppointmentMonth, COUNT(*) AS NumberOfAppointments
FROM Appointments
GROUP BY YEAR(AppointmentDateTime), MONTH(AppointmentDateTime);

-- Query 4: Get a simple count of male vs. female patients.
SELECT Gender, COUNT(*) AS NumberOfPatients
FROM Patients
GROUP BY Gender;


-- =================================================================
-- 3. Filtering Groups with `HAVING`
-- =================================================================
-- `WHERE` filters rows before grouping. `HAVING` filters the whole group after it's been made.

-- Query 1: Find which medical specializations are popular, i.e., those with MORE THAN ONE doctor.
SELECT Specialization, COUNT(*) AS NumberOfDoctors
FROM Doctors
WHERE Specialization IS NOT NULL
GROUP BY Specialization
HAVING COUNT(*) > 1;

-- Query 2: Find our "regular" patients - those who have booked MORE THAN ONE appointment.
SELECT PatientID, COUNT(AppointmentID) AS TotalAppointments
FROM Appointments
GROUP BY PatientID
HAVING COUNT(AppointmentID) > 1;

-- Query 3: Identify our busiest doctors - those who have MORE THAN ONE appointment in the system.
SELECT DoctorID, COUNT(*) AS NumberOfAppointments
FROM Appointments
GROUP BY DoctorID
HAVING COUNT(*) > 1;

-- Query 4: Find which months are our busiest, i.e., months with MORE THAN 3 appointments.
SELECT YEAR(AppointmentDateTime) AS AppointmentYear, MONTH(AppointmentDateTime) AS AppointmentMonth, COUNT(*) AS NumberOfAppointments
FROM Appointments
GROUP BY YEAR(AppointmentDateTime), MONTH(AppointmentDateTime)
HAVING COUNT(*) > 2;
