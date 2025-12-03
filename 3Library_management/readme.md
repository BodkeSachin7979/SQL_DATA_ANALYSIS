

# 📚 Library Management System (SQL Project)

A complete SQL-based Library Management System showcasing **database design**, **CRUD operations**, **advanced SQL queries**, **CTAS**, and **stored procedures**.
Designed as an **industry-style portfolio project** demonstrating real-world database skills.

![](https://github.com/BodkeSachin7979/SQL_DATA_ANALYSIS/blob/master/3Library_management/library%20management.jpg)

---

## 🚀 **Project Overview**

* **Database**: `library_db`
* **Difficulty**: Intermediate
* **Focus Areas**:

  * Relational DB design
  * CRUD operations
  * Joins, Grouping, Aggregations
  * CTAS
  * Stored Procedures (PL/pgSQL)
  * Reporting queries

---

## 🏗️ **Database Schema**

**Tables included:**

* `branch`
* `employees`
* `members`
* `books`
* `issued_status`
* `return_status`

**Schema Diagram (ERD):**
*(Insert your ERD image here)*

---

## 🗄️ **1. Database Setup**

```sql
-- Create Database
CREATE DATABASE library_db;

-- Branch Table
CREATE TABLE branch (
    branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    branch_address VARCHAR(30),
    contact_no VARCHAR(15)
);

-- Employees Table
CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(30),
    position VARCHAR(30),
    salary DECIMAL(10,2),
    branch_id VARCHAR(10),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

-- Members Table
CREATE TABLE members (
    member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(30),
    member_address VARCHAR(30),
    reg_date DATE
);

-- Books Table
CREATE TABLE books (
    isbn VARCHAR(50) PRIMARY KEY,
    book_title VARCHAR(80),
    category VARCHAR(30),
    rental_price DECIMAL(10,2),
    status VARCHAR(10),
    author VARCHAR(30),
    publisher VARCHAR(30)
);

-- Issue Status
CREATE TABLE issued_status (
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(30),
    issued_book_isbn VARCHAR(50),
    issued_date DATE,
    issued_emp_id VARCHAR(10),
    FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
    FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn)
);

-- Return Status
CREATE TABLE return_status (
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(30),
    return_date DATE,
    return_book_isbn VARCHAR(50),
    FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);
```

---

## 🔧 **2. CRUD Operations (Samples)**

### ➤ Insert a New Book

```sql
INSERT INTO books 
VALUES ('978-1-60129-456-2','To Kill a Mockingbird','Classic',6.00,'yes','Harper Lee','J.B. Lippincott & Co.');
```

### ➤ Update Member Address

```sql
UPDATE members 
SET member_address = '125 Oak St'
WHERE member_id = 'C103';
```

### ➤ Delete Issued Record

```sql
DELETE FROM issued_status
WHERE issued_id = 'IS121';
```

### ➤ Books Issued by Employee

```sql
SELECT * FROM issued_status WHERE issued_emp_id = 'E101';
```

---

## 📊 **3. Analysis Queries**

### ➤ Members With More Than One Issue

```sql
SELECT issued_member_id, COUNT(*)
FROM issued_status
GROUP BY 1
HAVING COUNT(*) > 1;
```

### ➤ Total Rental Income by Category

```sql
SELECT b.category, SUM(b.rental_price)
FROM issued_status ist
JOIN books b ON b.isbn = ist.issued_book_isbn
GROUP BY 1;
```

### ➤ Books Not Yet Returned

```sql
SELECT *
FROM issued_status ist
LEFT JOIN return_status rs ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;
```

---

## 🏷️ **4. CTAS Examples**

### ➤ Books Issue Count Table

```sql
CREATE TABLE book_issued_cnt AS
SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS issue_count
FROM issued_status ist
JOIN books b ON ist.issued_book_isbn = b.isbn
GROUP BY 1,2;
```

---

## ⚙️ **5. Stored Procedures**

### ➤ Procedure: Mark Book Returned

```sql
CREATE OR REPLACE PROCEDURE add_return_records(p_return_id VARCHAR(10), p_issued_id VARCHAR(10), p_book_quality VARCHAR(10))
LANGUAGE plpgsql AS $$
DECLARE
    v_isbn VARCHAR(50);
BEGIN
    INSERT INTO return_status(return_id, issued_id, return_date, book_quality)
    VALUES (p_return_id, p_issued_id, CURRENT_DATE, p_book_quality);

    SELECT issued_book_isbn INTO v_isbn
    FROM issued_status
    WHERE issued_id = p_issued_id;

    UPDATE books SET status = 'yes'
    WHERE isbn = v_isbn;

    RAISE NOTICE 'Book returned: %', v_isbn;
END;
$$;
```

### ➤ Procedure: Issue Book (Check Availability)

```sql
CREATE OR REPLACE PROCEDURE issue_book(p_issued_id VARCHAR(10), p_member VARCHAR(30), p_isbn VARCHAR(30), p_emp VARCHAR(10))
LANGUAGE plpgsql AS $$
DECLARE v_status VARCHAR(10);
BEGIN
    SELECT status INTO v_status FROM books WHERE isbn = p_isbn;

    IF v_status = 'yes' THEN
        INSERT INTO issued_status(issued_id, issued_member_id, issued_date, issued_book_isbn, issued_emp_id)
        VALUES (p_issued_id, p_member, CURRENT_DATE, p_isbn, p_emp);

        UPDATE books SET status = 'no' WHERE isbn = p_isbn;

        RAISE NOTICE 'Book issued: %', p_isbn;
    ELSE
        RAISE NOTICE 'Book unavailable: %', p_isbn;
    END IF;
END;
$$;
```

---

## 📈 **6. Reports & Insights**

### ➤ Branch Performance Report

```sql
CREATE TABLE branch_reports AS
SELECT 
    b.branch_id,
    b.manager_id,
    COUNT(ist.issued_id) AS issued_count,
    COUNT(rs.return_id) AS returned_count,
    SUM(bk.rental_price) AS revenue
FROM issued_status ist
JOIN employees e ON e.emp_id = ist.issued_emp_id
JOIN branch b ON e.branch_id = b.branch_id
LEFT JOIN return_status rs ON rs.issued_id = ist.issued_id
JOIN books bk ON ist.issued_book_isbn = bk.isbn
GROUP BY 1,2;
```

---

## 📦 **How to Use**

### **Clone the Repo**

```
git clone https://github.com/BodkeSachin7979/SQL_DATA_ANALYSIS.git
```

### **Load the SQL**

Execute the SQL files inside your SQL editor (PostgreSQL recommended).

### **Run Analysis**

Use the provided scripts inside the `analysis_queries.sql` file.

---

## ✅ **Conclusion**

This project demonstrates full end-to-end SQL capability:

* Relational modeling
* Clean database design
* Professional SQL queries
* Reporting & analysis
* Automation with stored procedures

Perfect for showcasing SQL skills in interviews & portfolios.

---
