**SQL Data Aggregation & Grouping | Task 04**

This repository contains the SQL script AggreateAndGroupingQuerieshealthcare_schema.sql, which focuses on advanced data summarization techniques. The script demonstrates how to move beyond viewing individual rows to calculating meaningful statistics, categorizing data into logical groups, and filtering those groups to find key insights within a healthcare database.

**Tasks Performed & Core Concepts**
The script is structured into three key sections, each building upon the last to perform a complete data aggregation workflow.



**1. Data Summarization (Aggregate Functions)**
This section demonstrates the use of SQL's core aggregate functions to boil large amounts of data down to single, meaningful values.

**COUNT()**: Used to count the total number of records (e.g., total patients) and the number of unique values in a column (e.g., unique doctor specializations).

**MIN() & MAX()**: Applied to date columns to find the earliest and latest dates, effectively identifying the oldest and youngest patients in the dataset.

**AVG()**: Used to calculate the average of a numeric set. A more complex example calculates the approximate average age of all patients on the fly using the **CURDATE()** function.



**2. Data Categorization (GROUP BY)**

This section shows how to use the **GROUP BY** clause to categorize rows and apply aggregate functions to each category, creating powerful summary reports. Examples include:

Counting the number of doctors for each medical specialization.

Tallying the total number of appointments booked by each patient.

Grouping appointments by month and year to analyze booking trends over time.

Creating a simple demographic breakdown of patients by gender.



**3. Filtering Categories (HAVING)**

This final section demonstrates the critical difference between **WHERE** and **HAVING**. While WHERE filters rows before they are grouped, **HAVING** is used to filter the groups after the aggregate functions have been calculated. This allows for powerful analysis, such as:

Identifying popular specializations by finding groups with more than one doctor.

Finding "regular patients" by filtering for those with more than one appointment.

Highlighting the busiest months or doctors based on appointment counts.


**How to Use**

Ensure the healthcare database schema is created and populated with data.

Open the AggreateAndGroupingQuerieshealthcare_schema.sql file in a MySQL-compatible client.

Execute the queries individually to observe how each aggregation and grouping technique transforms the raw data into valuable insights.
