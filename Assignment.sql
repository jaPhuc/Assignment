CREATE DATABASE LibraryManagement;
DROP DATABASE LibraryManagement;
USE LibraryManagement;

CREATE TABLE Genres (
    GenreID INT PRIMARY KEY IDENTITY(1,1),
    GenreName VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Publisher VARCHAR(255),
    GenreID INT,
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

SELECT * FROM Books;

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(0,1),
    RoleName VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO Roles (RoleName) VALUES ('admin'), ('user');

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
	RollNumber VARCHAR(8) UNIQUE NOT NULL,
	Password VARCHAR(255) NOT NULL,
    FullName VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20),
    Address TEXT,
    Email VARCHAR(255) NOT NULL,
	RoleID INT,
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

SELECT * FROM Users;

SELECT COUNT(*) FROM Users WHERE fullName = 'Nguyen Van B';

DROP TABLE Users;

DELETE FROM Users WHERE RollNumber = 'CE11111';

INSERT INTO Users (RollNumber, Password, FullName, PhoneNumber, Address, Email, RoleID) VALUES 
('CE100000', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyen Van A', 9999999999, 'HCM', 'nguyenvana@gmail.com', 1);

SELECT * FROM Users WHERE RollNumber = 'CE10000' AND Password = '123456';

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    BookID INT,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    Fine DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

SELECT * FROM Transactions;

CREATE TABLE TransactionHistory (
    HistoryID INT PRIMARY KEY IDENTITY(1,1),
    TransactionID INT,
    UserID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    Fine DECIMAL(10, 2),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);