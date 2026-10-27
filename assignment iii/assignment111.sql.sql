-- =====================================================
-- ASSIGNMENT III: SQL TABLE MANIPULATION
-- Student Registration System
-- Student Name: Mohamed Ahmed
-- Student ID: 202511816
-- DBMS: MySQL
-- =====================================================

-- Create database
CREATE DATABASE IF NOT EXISTS
mohamed_202511816_student_registration_system;

USE mohamed_202511816_student_registration_system;


-- =====================================================
-- CREATE TABLES
-- =====================================================

-- Table 1: Students
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    gender VARCHAR(10),
    registration_date DATE
);

-- Table 2: Courses
CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits SMALLINT NOT NULL
);

-- Table 3: Enrollments
CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    status VARCHAR(30) DEFAULT 'Enrolled',

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);


-- =====================================================
-- INSERT INITIAL DATA
-- =====================================================

INSERT INTO students
(student_id, full_name, email, gender, registration_date)
VALUES
(11, 'Ahmed Hassan', 'ahmed.hassan@example.com', 'Male', '2026-09-01'),
(12, 'Fatima Ali', 'fatima.ali@example.com', 'Female', '2026-09-02'),
(13, 'Yusuf Omar', 'yusuf.omar@example.com', 'Male', '2026-09-03'),
(14, 'Amina Ibrahim', 'amina.ibrahim@example.com', 'Female', '2026-09-04'),
(15, 'Omar Khalid', 'omar.khalid@example.com', 'Male', '2026-09-05');

INSERT INTO courses
(course_id, course_name, credits)
VALUES
(1, 'Database Systems', 3),
(2, 'Programming', 4),
(3, 'Data Science', 3),
(4, 'Computer Networks', 3),
(5, 'Mathematics', 4);

INSERT INTO enrollments
(enrollment_id, student_id, course_id, enrollment_date, status)
VALUES
(101, 11, 1, '2026-09-10', 'Enrolled'),
(102, 12, 2, '2026-09-11', 'Enrolled'),
(103, 13, 3, '2026-09-12', 'Enrolled'),
(104, 14, 4, '2026-09-13', 'Enrolled'),
(105, 15, 5, '2026-09-14', 'Enrolled');


-- =====================================================
-- QUESTION 1: SELECT
-- Retrieve all students
-- =====================================================

SELECT * FROM students;

-- Retrieve all courses
SELECT * FROM courses;

-- Retrieve all enrollments
SELECT * FROM enrollments;


-- =====================================================
-- QUESTION 2: JOIN
-- Display students and their registered courses
-- =====================================================

SELECT
    s.student_id,
    s.full_name,
    c.course_name,
    e.enrollment_date,
    e.status
FROM enrollments AS e
JOIN students AS s
    ON e.student_id = s.student_id
JOIN courses AS c
    ON e.course_id = c.course_id;


-- =====================================================
-- QUESTION 3: UPDATE
-- =====================================================

-- Q3.1: Update one enrollment
UPDATE enrollments
SET status = 'Completed'
WHERE student_id = 11;

-- Q3.2: Update multiple records
UPDATE enrollments
SET status = 'In Progress'
WHERE student_id IN (12, 13);

-- Q3.3: Conditional update
UPDATE enrollments
SET status = 'Completed'
WHERE enrollment_date < '2026-09-12'
  AND status = 'Enrolled';

-- Check updated records
SELECT * FROM enrollments;


-- =====================================================
-- QUESTION 4: ALTER TABLE
-- =====================================================

-- Q4.1: Rename registration_date to admission_date
ALTER TABLE students
RENAME COLUMN registration_date TO admission_date;

-- Q4.2: Change credits data type to SMALLINT NOT NULL
ALTER TABLE courses
MODIFY COLUMN credits SMALLINT NOT NULL;

-- Q4.3: Add a phone column
ALTER TABLE students
ADD COLUMN phone VARCHAR(20);

-- Drop the phone column
ALTER TABLE students
DROP COLUMN phone;

-- Check table structures
DESCRIBE students;
DESCRIBE courses;
DESCRIBE enrollments;


-- =====================================================
-- QUESTION 5: INSERT
-- =====================================================

-- Q5.1: Insert one new student
INSERT INTO students
(student_id, full_name, email, gender, admission_date)
VALUES
(26, 'Mohamed Ali', 'mohamed.ali@example.com',
 'Male', '2026-09-20');

-- Q5.2: Insert multiple students
INSERT INTO students
(student_id, full_name, email, gender, admission_date)
VALUES
(27, 'Fatima Ahmed', 'fatima.ahmed@example.com',
 'Female', '2026-09-21'),
(28, 'Yusuf Omar', 'yusuf.omar2@example.com',
 'Male', '2026-09-22');

-- Q5.3: Enroll Mohamed Ali in Database Systems
INSERT INTO enrollments
(enrollment_id, student_id, course_id, enrollment_date, status)
VALUES
(106, 26, 1, '2026-09-23', 'Enrolled');


-- =====================================================
-- FINAL VERIFICATION
-- =====================================================

-- Display all students
SELECT * FROM students;

-- Display all courses
SELECT * FROM courses;

-- Display all enrollments
SELECT * FROM enrollments;

-- Display student names with course names and statuses
SELECT
    s.full_name,
    c.course_name,
    e.enrollment_date,
    e.status
FROM enrollments AS e
JOIN students AS s
    ON e.student_id = s.student_id
JOIN courses AS c
    ON e.course_id = c.course_id;