-- Power Learn Project
-- Assignment: Build a Complete Database Management System
-- Use Case: Library Management System

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- 2. Create Tables

-- Authors Table (1:N relationship with Books)
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

-- Publishers Table (1:N relationship with Books)
CREATE TABLE Publishers (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Address VARCHAR(200)
);

-- Books Table (N:M with Borrowers, 1:N with Authors and Publishers)
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT NOT NULL,
    PublisherID INT NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    YearPublished YEAR,
    CopiesAvailable INT DEFAULT 1,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- Borrowers Table (1:N with Loans)
CREATE TABLE Borrowers (
    BorrowerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20)
);

-- Loans Table (Tracks which Borrower borrowed which Book)
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BorrowerID INT NOT NULL,
    BookID INT NOT NULL,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- 3. Example Data

-- Insert Authors
INSERT INTO Authors (Name, Country) VALUES
('J.K. Rowling', 'UK'),
('George R.R. Martin', 'USA'),
('J.R.R. Tolkien', 'UK');

-- Insert Publishers
INSERT INTO Publishers (Name, Address) VALUES
('Bloomsbury', 'London, UK'),
('Bantam Books', 'New York, USA'),
('HarperCollins', 'London, UK');

-- Insert Books
INSERT INTO Books (Title, AuthorID, PublisherID, ISBN, YearPublished, CopiesAvailable) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1, '9780747532699', 1997, 5),
('A Game of Thrones', 2, 2, '9780553103540', 1996, 3),
('The Hobbit', 3, 3, '9780261103344', 1937, 4);

-- Insert Borrowers
INSERT INTO Borrowers (FullName, Email, Phone) VALUES
('John Doe', 'johndoe@example.com', '1234567890'),
('Jane Smith', 'janesmith@example.com', '0987654321');

-- Insert Loans
INSERT INTO Loans (BorrowerID, BookID, LoanDate, ReturnDate) VALUES
(1, 1, '2025-09-01', NULL),
(2, 3, '2025-09-03', NULL);
