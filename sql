-- Library Management System

CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    available VARCHAR(5)
);

CREATE TABLE Book_Issues (
    issue_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    book_id INTEGER,
    issue_date DATE,
    return_date DATE,
    fine INTEGER
);

INSERT INTO Students VALUES
(1,'Rahul Sharma','Computer Science'),
(2,'Priya Patel','Electronics'),
(3,'Amit Singh','Mechanical'),
(4,'Sneha Gupta','Computer Science'),
(5,'Rohan Kumar','Civil');

INSERT INTO Books VALUES
(1,'Data Structures','Cormen','Yes'),
(2,'DBMS','Ramakrishnan','Yes'),
(3,'Operating Systems','Tanenbaum','No'),
(4,'Python Programming','Mark Lutz','Yes'),
(5,'Computer Networks','Forouzan','No');

INSERT INTO Book_Issues VALUES
(1,1,1,'2024-01-05','2024-01-19',0),
(2,2,3,'2024-01-10','2024-01-24',50),
(3,3,5,'2024-02-01','2024-02-15',0),
(4,4,2,'2024-02-10','2024-02-24',30),
(5,5,4,'2024-03-01','2024-03-15',0);

-- Show all students
SELECT * FROM Students;

-- Show all books
SELECT * FROM Books;

-- Available books
SELECT * FROM Books
WHERE available = 'Yes';

-- All issued books
SELECT * FROM Book_Issues;

-- Student name with book name
SELECT Students.name,
       Books.title,
       Book_Issues.issue_date
FROM Book_Issues
INNER JOIN Students
ON Book_Issues.student_id = Students.student_id
INNER JOIN Books
ON Book_Issues.book_id = Books.book_id;

-- Students having fine
SELECT Students.name,
       Book_Issues.fine
FROM Book_Issues
INNER JOIN Students
ON Book_Issues.student_id = Students.student_id
WHERE Book_Issues.fine > 0;

-- Count books issued by each student
SELECT Students.name,
       COUNT(Book_Issues.issue_id) AS Total_Books
FROM Students
INNER JOIN Book_Issues
ON Students.student_id = Book_Issues.student_id
GROUP BY Students.name;

-- Update fine
UPDATE Book_Issues
SET fine = 20
WHERE issue_id = 3;

-- Delete record
DELETE FROM Book_Issues
WHERE issue_id = 5;

-- Check final table
SELECT * FROM Book_Issues;
