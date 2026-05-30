-- ============================================
-- LIBRARY MANAGEMENT SYSTEM - DATASET
-- ============================================

-- 1. STUDENTS TABLE
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    department VARCHAR(50),
    enrollment_year INT
);

INSERT INTO Students VALUES
(1, 'Rahul Sharma', 'rahul@college.com', '9876543210', 'Computer Science', 2022),
(2, 'Priya Patel', 'priya@college.com', '9876543211', 'Electronics', 2021),
(3, 'Amit Singh', 'amit@college.com', '9876543212', 'Mechanical', 2023),
(4, 'Sneha Gupta', 'sneha@college.com', '9876543213', 'Computer Science', 2022),
(5, 'Rohan Kumar', 'rohan@college.com', '9876543214', 'Civil', 2021),
(6, 'Kavya Nair', 'kavya@college.com', '9876543215', 'Electronics', 2023),
(7, 'Vikram Das', 'vikram@college.com', '9876543216', 'Computer Science', 2020),
(8, 'Anita Rao', 'anita@college.com', '9876543217', 'Mechanical', 2022);

-- 2. BOOKS TABLE
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1,
    price DECIMAL(8,2),
    published_year INT
);

INSERT INTO Books VALUES
(1, 'Data Structures & Algorithms', 'Cormen', 'Computer Science', 5, 3, 450.00, 2019),
(2, 'Database Management Systems', 'Ramakrishnan', 'Computer Science', 4, 2, 380.00, 2020),
(3, 'Operating Systems', 'Tanenbaum', 'Computer Science', 3, 1, 420.00, 2018),
(4, 'Digital Electronics', 'Morris Mano', 'Electronics', 4, 4, 350.00, 2021),
(5, 'Engineering Mechanics', 'Beer & Johnston', 'Mechanical', 3, 2, 500.00, 2019),
(6, 'Python Programming', 'Mark Lutz', 'Computer Science', 6, 5, 320.00, 2022),
(7, 'Computer Networks', 'Forouzan', 'Computer Science', 3, 0, 410.00, 2020),
(8, 'Fluid Mechanics', 'Frank White', 'Civil', 2, 2, 480.00, 2021),
(9, 'Machine Learning', 'Andrew Ng', 'AI/ML', 5, 3, 550.00, 2023),
(10, 'Web Development', 'Jon Duckett', 'Computer Science', 4, 4, 290.00, 2022);

-- 3. BOOK_ISSUES TABLE
CREATE TABLE Book_Issues (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    actual_return_date DATE,
    fine_amount DECIMAL(6,2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'Issued',
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Book_Issues VALUES
(1, 1, 1, '2024-01-05', '2024-01-19', '2024-01-18', 0, 'Returned'),
(2, 2, 3, '2024-01-10', '2024-01-24', NULL, 50, 'Issued'),
(3, 3, 5, '2024-01-15', '2024-01-29', '2024-02-01', 30, 'Returned'),
(4, 4, 2, '2024-02-01', '2024-02-15', NULL, 0, 'Issued'),
(5, 1, 6, '2024-02-05', '2024-02-19', '2024-02-18', 0, 'Returned'),
(6, 5, 7, '2024-02-10', '2024-02-24', NULL, 70, 'Issued'),
(7, 6, 4, '2024-02-20', '2024-03-05', '2024-03-03', 0, 'Returned'),
(8, 7, 9, '2024-03-01', '2024-03-15', NULL, 0, 'Issued'),
(9, 8, 8, '2024-03-05', '2024-03-19', '2024-03-20', 10, 'Returned'),
(10, 2, 6, '2024-03-10', '2024-03-24', NULL, 0, 'Issued'),
(11, 3, 1, '2024-03-15', '2024-03-29', NULL, 0, 'Issued'),
(12, 4, 9, '2024-03-20', '2024-04-03', NULL, 0, 'Issued');

-- 4. LIBRARIANS TABLE
CREATE TABLE Librarians (
    librarian_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    shift VARCHAR(20)
);

INSERT INTO Librarians VALUES
(1, 'Mr. Suresh', 'suresh@library.com', 'Morning'),
(2, 'Ms. Rekha', 'rekha@library.com', 'Evening');

