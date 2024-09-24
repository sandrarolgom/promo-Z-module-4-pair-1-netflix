CREATE DATABASE Netflix;
USE Netflix;
CREATE TABLE movies (
	idMovies int auto_increment primary key not null,
    title varchar(45) not null,
    genre varchar(45) not null,
    image varchar(1000) not null,
    category varchar(45) not null,
    year int
);
CREATE TABLE Users (
	idUsers int auto_increment primary key not null,
    user varchar(45) not null,
    password varchar(45) not null,
    name varchar(45) not null,
    email varchar(45) not null,
    plan_details varchar(45) not null
);
CREATE TABLE Actors (
	idActor int auto_increment primary key not null,
    name varchar(45) not null,
    lastname varchar(45) not null,
    country varchar(45) not null,
    birthday date
);
INSERT INTO movies (title, genre, image, category, year)
VALUES 
('Pulp Fiction', 'Crimen.', 'https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg', 'Top 10', '1994'),
('La vita è bella', 'Comedia', 'https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg', 'Top 10', '1996'),
('Forrest Gump', 'Comedia', 'https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg', 'Top 10', '1994');

INSERT INTO Users (user, password, name, email, plan_details)
VALUES
('laura_dev', 'laura', 'Laura', 'laura@gmail.com', 'Standard'),
('maria_dev', 'maria', 'Maria', 'maria@gmail.com', 'Standard'),
('ester_dev', 'ester', 'Ester', 'ester@gmail.com', 'Standard');

INSERT INTO Actors (name, lastname, country, birthday)
VALUES
('Tom', 'Hanks', 'Estados Unidos', '1956-07-09'),
('Roberto', 'Benigni', 'Italia', '1952-10-27'),
('John', 'Travolta', 'Estados Unidos', '1954-02-18');
-- Sobre movies
SELECT * FROM movies;
SELECT title, genre FROM movies WHERE year > 1990;
SELECT * FROM movies WHERE category = 'TOp 10';
UPDATE movies SET year = 1997 WHERE idMovies = 2;
-- Sobre actores
SELECT * FROM Actors;
SELECT * FROM Actors WHERE birthday BETWEEN '1950-01-01' AND '1960-12-31';
SELECT name, lastname FROM Actors WHERE country = 'Estados Unidos';
-- Sobre los usuarios


SELECT * FROM Users;
SELECT * FROM Users WHERE plan_details = 'Standard';


SELECT * FROM Users WHERE name LIKE 'M%';
DELETE FROM Users WHERE name LIKE 'M%';





