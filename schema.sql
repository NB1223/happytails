CREATE DATABASE HAPPYTAILS;

USE HAPPYTAILS;

CREATE TABLE Pets (

    Pet_ID int PRIMARY KEY NOT NULL,
    Pet_name varchar(50) NOT NULL,
    Species varchar(50) NOT NULL,
    Breed varchar(50),
    Age int CHECK(age >= 0),
    Health_status ENUM('Good', 'Fair', 'Poor', 'Needs Vaccination', 'Underweight'),
    Date_of_intake date NOT NULL,
    Adoption_status ENUM('Available', 'Adopted', 'In Review', 'High Demand') DEFAULT 'Available',
    Pet_weight int,
    last_update date NOT NULL

);

CREATE TABLE Adopters (
    
    Adopter_ID int PRIMARY KEY NOT NULL,
    Adopter_name varchar(50) NOT NULL,
    Phone_number char(10) NOT NULL,
    Preference varchar(100)

);

CREATE TABLE Adoption_Application (
    
    App_ID int PRIMARY KEY NOT NULL,
    Adopter_ID int NOT NULL,
    Pet_ID int NOT NULL,
    App_sub_date date NOT NULL,
    App_status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (Pet_ID) REFERENCES Pets(Pet_ID),
    FOREIGN KEY (Adopter_ID) REFERENCES Adopters(Adopter_ID)

);

CREATE TABLE Adoption_Records (
    
    Adoption_ID int PRIMARY KEY NOT NULL,
    Adopter_ID int NOT NULL,
    Pet_ID int NOT NULL,
    Adoption_date date NOT NULL,
    FOREIGN KEY (Pet_ID) REFERENCES Pets(Pet_ID),
    FOREIGN KEY (Adopter_ID) REFERENCES Adopters(Adopter_ID)

);

CREATE TABLE Volunteers (
    
    Volunteer_ID int PRIMARY KEY NOT NULL,
    Volunteer_name varchar(50) NOT NULL,
    Phone_number char(10) NOT NULL,
    Skills varchar(50) NOT NULL,
    Vol_availability ENUM('Weekend', 'Weekday', 'Flexible'),
    Last_assigned_date date DEFAULT NULL

);

CREATE TABLE Schedule (
    
    Schedule_ID int PRIMARY KEY NOT NULL,
    Volunteer_ID int NOT NULL,
    Shift_date date NOT NULL,
    Task varchar(50) NOT NULL,
    FOREIGN KEY (Volunteer_ID) REFERENCES Volunteers(Volunteer_ID)

);

INSERT INTO Pets (Pet_ID, Pet_name, Species, Breed, Age, Health_status, Date_of_intake, Adoption_status, Pet_weight, last_update)
VALUES
(1, 'Buddy', 'Dog', 'Golden Retriever', 3, 'Good', '2024-01-15', 'Available', 30, '2024-11-01'),
(2, 'Whiskers', 'Cat', 'Siamese', 2, 'Needs Vaccination', '2024-03-10', 'In Review', 5, '2024-11-10'),
(3, 'Coco', 'Bird', 'Cockatiel', 1, 'Fair', '2024-05-20', 'Adopted', 0.3, '2024-11-15'),
(4, 'Max', 'Dog', 'Bulldog', 5, 'Underweight', '2024-02-18', 'High Demand', 25, '2024-10-25'),
(5, 'Nibbles', 'Small Mammal', 'Rabbit', 1, 'Good', '2024-06-01', 'Available', 2, '2024-11-05');


INSERT INTO Adopters (Adopter_ID, Adopter_name, Phone_number, Preference)
VALUES
(1, 'Alice Johnson', 1234567890, 'Dog - Golden Retriever'),
(2, 'Bob Smith', 9876543210, 'Cat - Siamese'),
(3, 'Carol Lee', 1122334455, 'Small Mammal - Rabbit'),
(4, 'David Brown', 5566778899, 'Bird - Cockatiel'),
(5, 'Eve Davis', 6677889900, 'Dog - Bulldog');

INSERT INTO Adoption_Application (App_ID, Adopter_ID, Pet_ID, App_sub_date, App_status)
VALUES
(1, 1, 1, '2024-10-20', 'Approved'),
(2, 2, 2, '2024-11-10', 'Pending'),
(3, 3, 5, '2024-09-15', 'Rejected'),
(4, 4, 3, '2024-08-25', 'Approved'),
(5, 5, 4, '2024-11-01', 'Pending');

INSERT INTO Adoption_Records (Adoption_ID, Adopter_ID, Pet_ID, Adoption_date)
VALUES
(1, 1, 1, '2024-11-02'),
(2, 4, 3, '2024-11-01'),
(3, 2, 2, '2024-11-15'),
(4, 5, 4, '2024-11-20'),
(5, 3, 5, '2024-10-30');


INSERT INTO Volunteers (Volunteer_ID, Volunteer_name, Phone_number, Skills, Vol_availability, Last_assigned_date)
VALUES
(1, 'John Walker', 1231231234, 'Feeding', 'Weekend', '2024-11-12'),
(2, 'Sophia Hill', 4564564567, 'Event Management', 'Flexible', '2024-11-10'),
(3, 'Liam Green', 7897897890, 'Grooming', 'Weekday', '2024-11-11'),
(4, 'Olivia White', 3213214321, 'Adoption Assistance', 'Flexible', '2024-11-09'),
(5, 'Emma Taylor', 6546546543, 'General Support', 'Weekend', '2024-11-08');

INSERT INTO Schedule (Schedule_ID, Volunteer_ID, Shift_date, Task)
VALUES
(1, 1, '2024-11-18', 'Morning Feeding'),
(2, 2, '2024-11-19', 'Organize Adoption Event'),
(3, 3, '2024-11-18', 'Dog Grooming'),
(4, 4, '2024-11-20', 'Assist with Adoption Process'),
(5, 5, '2024-11-21', 'Evening Feeding');

