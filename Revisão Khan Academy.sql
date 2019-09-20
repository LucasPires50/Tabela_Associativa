#Comentário 
/*Comentário*/
################################
# 19/09/2019
# Revisão Khan Academy
################################

# Criando um banco de dados

CREATE DATABASE khanaacademy; # Ctrl + Enter para executar

# Definido um Banco para USO

USE khanaacademy; # Ctrl + Enter para executar

# Apagando um banco de dados 
DROP DATABASE test; # Ctrl + Enter para executar

/*
Desafios: Os hobbies de Bobby

Etapa 1

Criamos um banco de dados de pessoas e hobbies, e cada linha em hobbies está relacionada a uma 
linha em persons por meio da coluna person_id. Nessa primeira etapa, insira mais uma linha em 
persons e então mais uma linha em hobbies que esteja relacionada à pessoa recentemente inserida.*/

CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45),
    age INTEGER);
    
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);
INSERT INTO persons (name, age) VALUES ("Marlon" , 15);

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    person_id INTEGER,
    name varchar(45));
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");
INSERT INTO hobbies (person_id, name) VALUES (5, "arte");

SELECT persons.name, hobbies.name FROM persons JOIN hobbies ON persons.id = hobbies.person_id;

SELECT persons.name, hobbies.name FROM persons JOIN hobbies ON persons.id = hobbies.person_id WHERE persons.name = "Bobby McBobbyFace";

SELECT * FROM hobbies;

/*Nessa primeira etapa, insira mais uma linha em persons e então mais uma linha em hobbies que esteja 
relacionada à pessoa recentemente inserida.*/

INSERT INTO persons ( name, age) VALUES ("Tarcnux", 16);
INSERT INTO hobbies (person_id, name) VALUES (6, "Caçar Morcegos");

DELETE FROM hobbies WHERE id >= 12;
DELETE FROM persons WHERE id = 7;

#Para fazer correções ou modificações no insert
UPDATE persons SET name = "Tarcìsio Nunes" WHERE id = 6;

/*
Etapa 2

Agora, selecione 2 tabelas com um comando join para que você possa ver o nome de cada pessoa ao lado de seu hobby.
*/

SELECT persons.name AS Pessoa, hobbies.name AS Hobby
FROM persons INNER JOIN hobbies
ON persons.id = hobbies.person_id;

/*
Refaça este exemplo utilizando uma tabela associativa!
Crie novas tabelas com nomes em português:
pessoas (id, nome, idade)
hobby (id, nome)

Use uma terceira tabela associativa , para relacionar ao hobby.

Faça o insert dos dados nas 3 tabelas.

Agora, selecione 3 tabelas com um comamdo join para que você possa
ver o nome e idade de cada pessoa ao lado de seu hobby.
*/

CREATE TABLE pessoa
(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
idade INTEGER,
nome VARCHAR(45)
);

INSERT INTO pessoa VALUE 
(10, 15, "Amara"), (20, 20, "Marta"),
(30, 26, "Maria"), (40, 38, "Ana");

CREATE TABLE hobby 
(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
pesso_id INTEGER,
nome VARCHAR(45)
);

INSERT INTO hobby VALUE 
(1, 20, "Caminhar"), (2, 30, "Natação"),
(3, 40, "Jogar"), (4, 10, "Leitura");

CREATE TABLE hobby_da_pessoa
(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
id_pessoa INTEGER,
id_hobby INTEGER
);

INSERT INTO hobby_da_pessoa (id_pessoa, id_hobby)VALUE
(10, 2), (10, 3),(10, 4), # Amara com 3 hobby
(20, 4), (20, 1), # Marta com 2 hooby
(30, 3), (30, 4), (30, 1), # Maria com 3 hobby
(40, 2), (40, 4); # Ana com 2 hobby

DROP TABLE hobby_da_pessoa;
DROP TABLE hobby;
DROP TABLE pessoa;

/*
Agora, selecione 3 tabelas com um comamdo join para que você possa
ver o nome e idade de cada pessoa ao lado de seu hobby.
*/
SELECT * FROM pessoa;

SELECT p.nome AS NOME, p.idade AS IDADE, h.nome AS HOBBY FROM hobby_da_pessoa
	JOIN hobby h
    ON hobby_da_pessoa.id_pessoa = h.id
    JOIN pessoa p
    ON hobby_da_pessoa.id_hobby = p.id;

# Mostra apenas as pessoa que tem hobby
SELECT p.nome AS NOME, p.idade AS IDADE, h.nome AS HOBBY FROM hobby_da_pessoa
	LEFT JOIN hobby h
    ON hobby_da_pessoa.id_pessoa = h.id
    LEFT JOIN pessoa p
    ON hobby_da_pessoa.id_hobby = p.id;
 
 # Mostra todas as pessoas e suas hoobies
SELECT p.nome AS NOME, p.idade AS IDADE, h.nome AS HOBBY FROM hobby_da_pessoa
	INNER JOIN hobby h
    ON hobby_da_pessoa.id_pessoa = h.id
    INNER JOIN pessoa p
    ON hobby_da_pessoa.id_hobby = p.id;

