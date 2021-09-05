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
    password varchar(100) NOT NULL check(CHAR_LENGTH(password)>=8)
);



#User_Library_Data

CREATE TABLE User_Library_Data(Username VARCHAR(100),
            No_Of_Books INT(10),
            Max_No_Of_Books INT(10),
           Joined_On DATE,Library_ID VARCHAR(100) UNIQUE,
           Photo MEDIUMBLOB NOT NULL,
           Admin CHAR(100),
           Fine CHAR(100),
          primary key(Library_ID),
       FOREIGN KEY(Username)REFERENCES Login_Details(Username) );



#Subscription
CREATE TABLE Subscription(Subscription_ID VARCHAR(100) PRIMARY KEY,
         Subscription_Amount INT(10),
        Max_Books INT(10));
  
  
 
 
 #Book
 create table Book(Book_ID VARCHAR(100) UNIQUE,
              Title CHAR(100),
              Auther CHAR(100),
            Publication VARCHAR(100),
            Edition VARCHAR(100),
            No_OF_Copies INT(10),
            Date_Of_Purchase DATE,
             No_Of_Pages INT(100),
            Prices INT(10),
            Type CHAR(100),
             Genere VARCHAR(100), 
             Age_rating INT(5),
             Current_Book_Holder CHAR(100), 
             PRIMARY KEY(Book_ID));
 
 
 
 
 #Fine_table
  CREATE TABLE Fine_table(User_Library_ID VARCHAR(100),
        Book_ID VARCHAR(100),
        Fine_Amount INT(10),
        Paid ENUM('Yes','No'),
        Paid_Date DATE, 
       FOREIGN KEY(User_Library_ID) REFERENCES User_Library_Data(Username)
       FOREIGN KEY(Book_ID) REFERENCES Book(Book_ID));
       
  
  
 #Book_History
 CREATE TABLE Book_History(
               Current_Book_Holder_ID VARCHAR(100),
               Book_Issued DATE,
               Book_Returned DATE,
               Fine_with_Book INT(10),
               FOREIGN KEY(Current_Book_Holder_ID) REFERENCES USER(library_id));
  
               
#requesting_table
CREATE TABLE Request(
    Book_id INT NOT NULL references Book(Book_id),
    DOR DATE NOT NULL,
    NOA DATE NOT NULL,
    Request_user_id int not null references USER(library_id),
    giving _user_id int not null  references USER(library_id),
    secret_key char(50) not null,
    request_status int not null );
    
    
    
    
