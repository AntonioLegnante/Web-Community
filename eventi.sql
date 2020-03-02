.header on
.mode column

DROP TABLE IF EXISTS Utenti;
CREATE TABLE Utenti
(
    id_Utenti INTEGER PRIMARY KEY,
    Nickname TEXT,
    Nome TEXT,
    Cognome TEXT NOT NULL,
    email TEXT,
    provincia TEXT
);

INSERT INTO Utenti(Nickname, Nome, Cognome, email, provincia) VALUES ("Antonio12fallito", "Antonio", "Legnante", "AntonioLegnante12@gmail.com", "Napoli");

DROP TABLE IF EXISTS Eventi;
CREATE TABLE Eventi
(
    id_Evento INTEGER PRIMARY KEY,
    Titolo TEXT,
    dataevento DATE,
    Luogo TEXT,
    provincia TEXT,
    id_Utenti INTEGER,
    FOREIGN KEY (id_Utenti) REFERENCES Utenti(id_Utenti)
);

INSERT INTO Eventi(Titolo, dataevento, Luogo, provincia) VALUES ("Mandragola", DATE(2020-03-13), "Napoli", "Napoli");

DROP TABLE IF EXISTS Commenti;
CREATE TABLE Commenti
(
    id_Utenti INTEGER PRIMARY KEY,
    id_Evento INTEGER NOT NULL,
    Voto INTEGER(1),
    Commento TEXT
);

INSERT INTO Commenti(id_Utenti, id_Evento, Voto, Commento) VALUES (1, 1, 5, "Macchiavelli ha ragione");

DROP TABLE IF EXISTS Categorie;
CREATE TABLE Categorie
(
    id_Categorie INTEGER PRIMARY KEY,
    Categoria TEXT NOT NULL,
    id_Evento INTEGER,
    FOREIGN KEY (id_Categorie) REFERENCES Eventi(id_Evento)
);

INSERT INTO Categorie (Categoria, id_Evento) VALUES ("Commedia", 1);

DROP TABLE IF EXISTS Artisti;
CREATE TABLE Artisti
(
    id_Artisti INTEGER PRIMARY KEY,
    Nomearte TEXT,
    Nome TEXT,
    Cognome TEXT 
);

INSERT INTO Artisti (Nome, Cognome) VALUES ("Tony", "Servillo");

DROP TABLE IF EXISTS ImpiegoArtisti;
CREATE TABLE ImpiegoArtisti
(
    id_Evento INTEGER PRIMARY KEY,
    id_Artisti INTEGER NOT NULL    
);

INSERT INTO ImpiegoArtisti (id_Artisti, id_Evento) VALUES (1, 1);

SELECT E.Titolo, A.nome FROM Eventi E INNER JOIN ImpiegoArtisti I INNER JOIN Artisti A WHERE E.id_Evento = I.id_Evento AND A.id_Artisti = I.id_Artisti;
SELECT E.Titolo, U.nome, U.Cognome, C.Commento FROM Utenti U INNER JOIN Commenti C INNER JOIN EVENTI E WHERE U.id_Utenti = C.id_Utenti AND E.id_Evento = C.id_Evento;