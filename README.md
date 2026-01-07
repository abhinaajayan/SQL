# 📘 Introduction to SQL (Structured Query Language)

## 🔷 What is SQL?
**SQL (Structured Query Language)** is a standard programming language used to **store, retrieve, manipulate, and manage data** in **relational database management systems (RDBMS)**.

It is widely used in **data analysis, data science, web development, and backend systems**.

---

## 🔹 What is a Database?
A **database** is an organized collection of data stored in tables.

- Data is stored in **rows (records)** and **columns (attributes)**
- Tables are related to each other using **keys**

**Example:**  
A `Students` table may contain `Student_ID`, `Name`, `Age`, and `Marks`.

---

## 🔹 What is SQL Used For?
SQL allows users to:

- ✔ Create and modify databases and tables  
- ✔ Insert, update, and delete data  
- ✔ Retrieve specific data using queries  
- ✔ Apply conditions, sorting, and grouping  
- ✔ Control user access and security  
- ✔ Perform joins across multiple tables  

---

## 🔹 Popular SQL Databases
SQL works with many database systems, such as:

- MySQL
- PostgreSQL
- SQLite
- Oracle Database
- Microsoft SQL Server

> Although implementations vary slightly, **core SQL syntax remains the same**.

---

## 🔹 Types of SQL Commands

### 1️. DDL – Data Definition Language
Used to define database structure.
- `CREATE`
- `ALTER`
- `DROP`
- `TRUNCATE`
---
#### 🔹 CREATE
Creates a database or table.

```sql
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Marks INT
);
```
---
#### 🔹 ALTER
Modifies an existing table.

```sql
ALTER TABLE Students
ADD Email VARCHAR(100);
```
---
#### 🔹 DROP
Deletes a table or database permanently.

```sql
DROP TABLE Students;
```
⚠ Note: Data cannot be recovered after using DROP.

---
#### 🔹 TRUNCATE
Removes all records but keeps the table structure.
```sql 
TRUNCATE TABLE Students;
```
---

### 2️. DML – Data Manipulation Language
Used to manipulate data inside tables.
- `INSERT`
- `UPDATE`
- `DELETE`
---
#### 🔹 INSERT
Adds new records to a table.
```sql
INSERT INTO Students (Student_ID, Name, Age, Marks)
VALUES (1, 'Rahul', 21, 85);
```
---
#### 🔹 UPDATE
Modifies existing records.
```sql
UPDATE Students
SET Marks = 90
WHERE Student_ID = 1;
```
---
#### 🔹 DELETE
Removes specific records.
```sql
DELETE FROM Students
WHERE Student_ID = 1;
```
---

### 3️. DQL – Data Query Language
Used to retrieve data.
- `SELECT`
---
#### 🔹 SELECT
Fetches data from a table.
```sql
SELECT * FROM Students;
```
---
#### 🔹 SELECT with WHERE
Filters records based on conditions.
```sql
SELECT Name, Marks
FROM Students
WHERE Marks > 75;
```
---
#### 🔹 ORDER BY
Sorts the result.
```sql
SELECT Name, Marks
FROM Students
ORDER BY Marks DESC;
```
---
#### 🔹 GROUP BY
Groups records and applies aggregate functions.
```sql
SELECT Age, AVG(Marks)
FROM Students
GROUP BY Age;
```
---
#### 🔹 HAVING
Filters grouped data.
```sql
SELECT Age, AVG(Marks)
FROM Students
GROUP BY Age
HAVING AVG(Marks) > 70;
```
---

### 4️. DCL – Data Control Language
Used for access control.
- `GRANT`
- `REVOKE`
---
#### 🔹 GRANT
Gives permissions.
```sql
GRANT SELECT, INSERT
ON Students
TO user1;
```
---
#### 🔹 REVOKE
Removes permissions.
```sql
REVOKE INSERT
ON Students
FROM user1;
```
---

### 5️. TCL – Transaction Control Language
Used to manage transactions.
- `COMMIT`
- `ROLLBACK`
- `SAVEPOINT`
---
#### 🔹 COMMIT
Saves changes permanently.
```sql
COMMIT;
```
---
#### 🔹 ROLLBACK
Reverts changes.
```sql
ROLLBACK;
```
---
#### 🔹 SAVEPOINT
Creates a restore point.
```sql
SAVEPOINT sp1;
```
---

### 6. Aggregate Functions
Used to perform calculations.
```sql
SELECT 
    COUNT(*) AS Total_Students,
    AVG(Marks) AS Average_Marks,
    MAX(Marks) AS Highest_Marks,
    MIN(Marks) AS Lowest_Marks
FROM Students;
```
---

### 7. JOIN Operations
Used to combine multiple tables.
Example Tables:
-Students(Student_ID, Name)
-Marks(Student_ID, Subject, Score)

---
#### 🔹 INNER JOIN
Returns matching records from both tables.
```sql
SELECT Students.Name, Marks.Score
FROM Students
INNER JOIN Marks
ON Students.Student_ID = Marks.Student_ID;
```
---
#### 🔹 LEFT JOIN
Returns all records from left table.
```sql
SELECT Students.Name, Marks.Score
FROM Students
LEFT JOIN Marks
ON Students.Student_ID = Marks.Student_ID;
```
---

## 🔹 Basic SQL Example

```sql
SELECT name, marks
FROM students
WHERE marks > 75
ORDER BY marks DESC;
```

## 🔹 Key Features of SQL

- Declarative language (focuses on **what** to do, not **how**)
- Easy to learn and use
- Efficient for handling large datasets
- Supports complex queries and table joins
- Integrates well with **Python, R, Power BI, and Tableau**

---

## 🔹 Why Learn SQL?

- Essential skill for **Data Analysts, Data Scientists, and Backend Developers**
- Widely used in **data visualization tools** like Power BI and Tableau
- Helps in managing and analyzing real-world structured data

---

