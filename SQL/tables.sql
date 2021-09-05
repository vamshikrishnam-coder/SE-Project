CREATE DATABASE LIBRARY;
use LIBRARY;

# User Registration Details
CREATE TABLE USER (
    library_id int PRIMARY KEY AUTO_INCREMENT,
    full_name varchar(50) NOT NULL,
    mobile BIGINT(10) check(1000000000<=mobile<=9999999999),
    email varchar(300) NOT NULL,
    DOB DATE NOT NULL,
    gender char(1) NOT NULL check(gender="M" or gender="F"),
    joined_date DATE NOT NULL,
    username varchar(16) NOT NULL References LOGIN(username),
    UID BIGINT NOT NULL Unique check(100000000000 <= UID <= 999999999999)
    );

# Login details
CREATE TABLE LOGIN (
    username varchar(16) Unique PRIMARY KEY check(CHAR_LENGTH(username)>=8),
    password varchar(100) NOT NULL
);
