-- Create Database Salon
CREATE DATABASE salon;

-- Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    phone VARCHAR(255) UNIQUE,
    name VARCHAR(255));

-- Create Services Table and Insert 3 row values
CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(255));
-- Insert 3 row values
INSERT INTO services (name)
VALUES
    ('Harcuit'),
    ('Massage'),
    ('Facials');

-- Appointments Table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    time VARCHAR(255),
    customer_id INT,
    service_id INT,
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id));