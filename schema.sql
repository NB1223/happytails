CREATE DATABASE HAPPYTAILS;

USE HAPPYTAILS;

CREATE TABLE Pets (

    Pet_ID int PRIMARY KEY NOT NULL,
    Pet_name varchar(50) NOT NULL,
    Species varchar(50) NOT NULL,
    Breed varchar(50),
    Age int CHECK(age >= 0),
    Health_status ENUM('Good', 'Fair', 'Poor', 'Needs Vaccination', 'Underweight')
    Date_of_intake date NOT NULL,
    Adoption_status ENUM('Available', 'Adopted', 'In Review', 'High Demand') DEFAULT 'Available',
    Pet_weight int,
    last_update date NOT NULL

)

CREATE TABLE Adopters (
    
    Adopter_ID int PRIMARY KEY NOT NULL,
    Adopter_name varchar(50) NOT NULL,
    Phone_number int NOT NULL,
    Preference varchar(100) ,

)

CREATE TABLE Adoption_Application (
    
    App_ID int PRIMARY KEY NOT NULL,
    Adopter_ID int NOT NULL,
    Pet_ID int NOT NULL,
    App_sub_date date NOT NULL,
    App_status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (Pet_ID) REFERENCES Pets(Pet_ID)
    FOREIGN KEY (Adopter_ID) REFERENCES Adopters(Adopter_ID)

)

CREATE TABLE Adoption_Records (
    
    Adoption_ID int PRIMARY KEY NOT NULL,
    Adopter_ID int NOT NULL,
    Pet_ID int NOT NULL,
    Adoption_date date NOT NULL,
    FOREIGN KEY (Pet_ID) REFERENCES Pets(Pet_ID)
    FOREIGN KEY (Adopter_ID) REFERENCES Adopters(Adopter_ID)

)

CREATE TABLE Volunteers (
    
    Volunteer_ID int PRIMARY KEY NOT NULL,
    Volunteer_name varchar(50) NOT NULL,
    Phone_number int NOT NULL,
    Skills varchar(50) NOT NULL,
    Vol_availability ENUM('Weekend', 'Weekday', 'Flexible'),
    Last_assigned_date date DEFAULT NULL,

)

CREATE TABLE Schedule (
    
    Schedule_ID int PRIMARY KEY NOT NULL,
    Volunteer_ID int NOT NULL,
    Shift_date date NOT NULL,
    Task varchar(50) NOT NULL,
    FOREIGN KEY (Volunteer_ID) REFERENCES Volunteers(Volunteer_ID)

)

