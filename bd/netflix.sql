CREATE DATABASE Netflix;
USE Netflix;
CREATE TABLE movies (
	idMovies int auto_increment primary key not null,
    title varchar(45) not null,
    genre varchar(45) not null,
    image varchar(1000) not null,
    category varchar(45) not null,dataproject
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

SELECT * FROM users_movies;
INSERT INTO users_movies(idUsers, idMovies)
VALUES
('1', '1'),
('1', '2');
INSERT INTO users_movies(idUsers, idMovies)
VALUES
('3', '2');

update users_movies
SET score = 9
WHERE idUsers= 1 and idMovies=2;

update users_movies
SET score = 7
WHERE idUsers= 1 and idMovies=1;

SELECT * FROM users_movies;
update users_movies
SET score = 5
WHERE idUsers= 3 and idMovies=2;

select * from actors_movies;
INSERT INTO actors_movies(idActor, idMovies)
VALUES
('1', '3'),
('2', '2'),
('3', '1');


-- cuántas peliculas favoritas tiene cada usuario
-- Buscar usuario con el mayor número de peliculas 
-- Si queremos buscar en dos tablas tenemos que usar INNER JOIN

SELECT count(idMovies), users.idUsers, users.name
FROM users_movies INNER JOIN users ON users.idUsers = users_movies.idUsers
GROUP BY idUsers
having count(idMovies) = (
 SELECT count(idMovies) as total
 FROM users_movies
 GROUP BY idUsers
 ORDER BY total desc
 LIMIT 1
);

USE netflix;
INSERT INTO movies (title, genre, image, category, year)
VALUES
('Braveheart', 'War.', 'https://pics.filmaffinity.com/braveheart-898928745-mmed.jpg', 'Top 10', '1995');
INSERT INTO movies (title, genre, image, category, year)
VALUES
('Princess Mononoke', 'Anime.', 'https://es.web.img3.acsta.net/pictures/22/05/09/12/02/0498795.jpg', 'Top 10', '1997');

DELETE FROM movies WHERE idMovies = 4 and idMovies = 5 and idMovies = 6;
ALTER TABLE `netflix`.`users` 
CHANGE COLUMN `password` `password` VARCHAR(255) NOT NULL ;







