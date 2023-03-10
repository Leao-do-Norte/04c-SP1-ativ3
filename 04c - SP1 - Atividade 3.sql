-- ÂNGELO VINÍCIUS BARRETO TAVARES
-- TURMA FULL-STACK 13

CREATE DATABASE RpgResposta;

USE RpgResposta;

CREATE TABLE Usuarios
(
	UsuarioID INT PRIMARY KEY IDENTITY,
	Email VARCHAR(150) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL
);

CREATE TABLE Classes
(
	ClasseID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(150) UNIQUE NOT NULL,
	Descicao VARCHAR(255) 
);

CREATE TABLE Habilidades
(
	HabilidadeID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE Personagens
(
	PersonagensID INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(10) UNIQUE NOT NULL,
	UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID),
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
);

CREATE TABLE ClassesHabilidades
(
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID),
	HabilidadeID INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
);

--INSERÇÃO DE DADOS

INSERT INTO Usuarios VALUES ('Danos','Senha1234');
INSERT INTO Usuarios VALUES ('Bolsonaro','Password22');
INSERT INTO Usuarios VALUES ('Luva de Pedreiro','melhor-do-mundo');

INSERT INTO Classes VALUES ('Monge', 'Descrição do Monge');
INSERT INTO Classes VALUES ('Presidente', 'Descrição do Presidente');
INSERT INTO Classes VALUES ('Jogador', 'Gravar Vídeo');

INSERT INTO Habilidades VALUES ('Recuperar Vida');
INSERT INTO Habilidades VALUES ('Perder Reeleição');
INSERT INTO Habilidades VALUES ('Fazer Gol');

INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('BitBug',1,1);
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('BolsoMito',2,2);
INSERT INTO Personagens (NomePersonagem, UsuarioID, ClasseID) VALUES ('Luv4',3,3);

INSERT INTO ClassesHabilidades (ClasseID, HabilidadeID) VALUES (1,1);
INSERT INTO ClassesHabilidades (ClasseID, HabilidadeID) VALUES (2,2);
INSERT INTO ClassesHabilidades (ClasseID, HabilidadeID) VALUES (3,3);

--EXCLUSÃO DE DADOS

DELETE FROM Usuarios WHERE UsuarioID = 2;
DELETE FROM Usuarios WHERE UsuarioID = 3;
DELETE FROM Personagens WHERE UsuarioID = 3;

--ALTERAÇÃO DE DADOS

UPDATE Usuarios SET Email = 'Danox' WHERE Email = 'Danos'
UPDATE Habilidades SET Nome = 'Pular 5 metros' WHERE HabilidadeID = 1;
UPDATE Habilidades SET Nome = 'Zuera no Twitter' WHERE HabilidadeID = 2;

--CONSULTA DE DADOS

SELECT * FROM Usuarios;
SELECT * FROM Habilidades;
SELECT * FROM Classes;
SELECT * FROM ClassesHabilidades;
SELECT * FROM Personagens;