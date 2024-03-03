CREATE DATABASE toppet CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

USE `toppet`;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


CREATE TABLE IF NOT EXISTS kutya_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);

CREATE TABLE IF NOT EXISTS macska_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);

CREATE TABLE IF NOT EXISTS hal_hullo_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);


CREATE TABLE IF NOT EXISTS hullő_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);


CREATE TABLE IF NOT EXISTS kisemlos_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);


CREATE TABLE IF NOT EXISTS madar_termek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(255) NOT NULL,
    ar INT NOT NULL,
    leiras TEXT
);


