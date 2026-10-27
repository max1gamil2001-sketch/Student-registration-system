CREATE DATABASE IF NOT EXISTS mohamed_202511816_student_registration_system;

USE mohamed_202511816_student_registration_system;

-- Table 1: Students
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    gender VARCHAR(10),
    admission_date DATE
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

    FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);

-- Verify the tables
SHOW TABLES;