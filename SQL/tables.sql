CREATE DATABASE LIBRARY;
use LIBRARY;

# User Registration Details
CREATE TABLE USER (
    library_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    full_name varchar(50) NOT NULL,
    mobile BIGINT(10) check(1000000000<=mobile<=9999999999),
    email varchar(300) NOT NULL,
    DOB DATE NOT NULL,
    gender char(1) NOT NULL check(gender="M" or gender="F"),
    joined_date DATE NOT NULL,
    username varchar(16) NOT NULL References LOGIN(username),
    UID BIGINT(12) NOT NULL Unique
    );

# Login details
CREATE TABLE LOGIN (
    username varchar(16) NOT NULL Unique PRIMARY KEY,
    password varchar(100) NOT NULL
);
