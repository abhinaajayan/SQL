# SQL
# Introduction to SQL

## What is SQL?
**SQL (Structured Query Language)** is a standard language used to **store, retrieve, manage, and manipulate data** in relational databases.

SQL is widely used in:
- Data Analytics
- Data Science
- Machine Learning
- Backend Development
- Business Intelligence

---

## Why SQL is Important?
- Efficiently handles large datasets
- Easy to learn and widely adopted
- Works with almost all relational databases
- Essential for data-driven decision making
- Integrates well with Python, R, Power BI, and Tableau

---

## Popular SQL Databases
- MySQL
- PostgreSQL
- SQLite
- Oracle Database
- Microsoft SQL Server

---

## Core SQL Concepts

### Database & Tables
- A **database** is a collection of structured data
- A **table** consists of rows (records) and columns (attributes)

---

## SQL Command Categories

### 1️⃣ Data Definition Language (DDL)
Used to define and modify database structure.

| Command | Description |
|-------|------------|
| CREATE | Creates tables or databases |
| ALTER | Modifies existing tables |
| DROP | Deletes tables or databases |
| TRUNCATE | Removes all records from a table |

```sql
CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    salary INT
);

--

### 2️⃣ Data Manipulation Language (DML)
Used to manipulate data inside tables.

| Command |	Description |
|--------|------------|
| INSERT | Adds new records |
| UPDATE | Modifies existing records |
| DELETE | Removes records |

```sql
INSERT INTO employees VALUES (1, 'John', 50000);
UPDATE employees
SET salary = 60000
WHERE id = 1;

DELETE FROM employees
WHERE id = 1;

--

### 3️⃣ Data Query Language (DQL)
Used to retrieve data from tables.

| Command | Description |
|-------|------------|
| SELECT | Fetches data from database |

```sql
SELECT * FROM employees;

--

### 4️⃣ Data Control Language (DCL)
Used to control access and permissions.

| Command | Description |
|-------|------------|
| GRANT |	Provides user privileges |
| REVOKE | Removes user privileges |

```sql
GRANT SELECT ON employees TO user1;
REVOKE SELECT ON employees FROM user1;

---

## Basic SQL Operations
-**Filtering Data**
```sql
SELECT * FROM employees
WHERE salary > 40000;

-**Sorting Data**
```sql
SELECT * FROM employees
ORDER BY salary DESC;

-**Aggregate Functions**
```sql
SELECT COUNT(*), AVG(salary)
FROM employees;

## SQL Joins
Used to combine data from multiple tables.
-INNER JOIN
-LEFT JOIN
-RIGHT JOIN
-FULL JOIN

```sql
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

## SQL in Data Analytics & Machine Learning
-Data cleaning and preprocessing
-Feature extraction
-Dataset creation
-Handling missing values

---
