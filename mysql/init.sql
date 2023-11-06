-- Create the database
CREATE DATABASE IF NOT EXISTS db;

-- Use the database
USE db;

-- Create the employees table
CREATE TABLE IF NOT EXISTS employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert three rows into the employees table
INSERT INTO employees (name, age, department, salary) VALUES ('John Doe', 30, 'Sales', 50000.00);
INSERT INTO employees (name, age, department, salary) VALUES ('Jane Smith', 25, 'Marketing', 60000.00);
INSERT INTO employees (name, age, department, salary) VALUES ('Bob Johnson', 40, 'Engineering', 80000.00);
