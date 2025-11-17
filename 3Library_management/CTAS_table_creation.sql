-- Task 6: Create Summary Tables: 
-- Used CTAS to generate new tables based on query results
-- - each book and total book_issued_cnt**

CREATE TABLE book_issued_cnt AS
SELECT b.isbn, 
	   b.book_title, 
	   COUNT(ist.issued_id) AS issue_count
FROM issued_status as ist
JOIN books as b
ON ist.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;