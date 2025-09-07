# library-management
# Library Management System Database

## Description
This project implements a **relational database** for a Library Management System using **MySQL**.  
It includes well-structured tables, proper constraints, and relationships to manage books, authors, publishers, borrowers, and loans.

---

## Database Schema

### Tables and Relationships

1. **Authors**
   - AuthorID (PK)
   - Name (NOT NULL)
   - Country

2. **Publishers**
   - PublisherID (PK)
   - Name (UNIQUE, NOT NULL)
   - Address

3. **Books**
   - BookID (PK)
   - Title (NOT NULL)
   - AuthorID (FK → Authors)
   - PublisherID (FK → Publishers)
   - ISBN (UNIQUE, NOT NULL)
   - YearPublished
   - CopiesAvailable

4. **Borrowers**
   - BorrowerID (PK)
   - FullName (NOT NULL)
   - Email (UNIQUE)
   - Phone

5. **Loans**
   - LoanID (PK)
   - BorrowerID (FK → Borrowers)
   - BookID (FK → Books)
   - LoanDate (NOT NULL)
   - ReturnDate

### Relationships
- **Authors → Books**: One-to-Many  
- **Publishers → Books**: One-to-Many  
- **Books ↔ Borrowers**: Many-to-Many (via Loans table)

---

## Setup Instructions

1. Open **MySQL Workbench** (or any MySQL client).  
2. Run the `library_management.sql` script included in this project.  
   - This will:
     - Create the database `LibraryDB`
     - Create all tables with constraints
     - Insert sample data
3. Verify tables and relationships are created correctly.

---

## Sample Queries

- List all books with author and publisher:
```sql
SELECT B.Title, A.Name AS Author, P.Name AS Publisher
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID
JOIN Publishers P ON B.PublisherID = P.PublisherID;
