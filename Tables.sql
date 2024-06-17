drop database library;

CREATE DATABASE library;
USE library;

-- NATIONALITY
CREATE TABLE library.nationality (
	nationality_id INT PRIMARY KEY AUTO_INCREMENT,
    nation VARCHAR(80) NOT NULL
    );

-- AUTHOR
CREATE TABLE library.author (
	author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(70) NOT NULL,
    last_name VARCHAR(70) NOT NULL,
    birth SMALLINT NOT NULL,
    death SMALLINT DEFAULT NULL,
    nobel bool,
    nationality_id INT,
    FOREIGN KEY (nationality_id) REFERENCES library.nationality(nationality_id) ON DELETE SET NULL);

-- PUBLISHER    
CREATE TABLE library.publisher (
	publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher VARCHAR(80) NOT NULL
    );

-- GENRE
CREATE TABLE library.genre (
	genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre VARCHAR(50) NOT NULL,
    description VARCHAR(200) NOT NULL
    );

-- BOOK
CREATE TABLE library.book (
	book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(90) NOT NULL,
    year SMALLINT NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    pages SMALLINT NOT NULL,
    description VARCHAR(200) NOT NULL,
    available bool,
    author_id INT,
    publisher_id INT,
    FOREIGN KEY (author_id) REFERENCES library.author(author_id) ON DELETE SET NULL,
    FOREIGN KEY (publisher_id) REFERENCES library.publisher(publisher_id) ON DELETE SET NULL
    );

-- BOOK_GENRE
CREATE TABLE library.book_genre (
	book_genre_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES library.book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES library.genre(genre_id) ON DELETE CASCADE
    );
    
-- INVENTORY
CREATE TABLE library.inventory (
	inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    count INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE
    ); 
    
-- USER
CREATE TABLE library.user (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(60) NOT NULL,
    password VARCHAR(256) NOT NULL,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    email VARCHAR(190) NOT NULL,
    telephone CHAR(12) NOT NULL,
    active bool
    );

-- RENTAL
CREATE TABLE library.rental (
	rental_id INT PRIMARY KEY AUTO_INCREMENT,
    date_1 DATE NOT NULL,
    date_2 DATE DEFAULT NULL,
    date_max DATE NOT NULL,
    user_id INT,
    book_id INT,
    FOREIGN KEY (user_id) REFERENCES library.user(user_id) ON DELETE SET NULL,
    FOREIGN KEY (book_id) REFERENCES library.book(book_id) ON DELETE SET NULL
    );
    
    







