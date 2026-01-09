CREATE TABLE Abonnement (
  idAbonnement SERIAL PRIMARY KEY,
  type VARCHAR(50) NOT NULL,
  tarif NUMERIC(6,2) NOT NULL,
  dateDebut DATE NOT NULL,
  dateFin DATE
);

CREATE TABLE Adherent (
  idAdherent SERIAL PRIMARY KEY,
  nom VARCHAR(100),
  prenom VARCHAR(100),
  dateNaiss DATE,
  adresse VARCHAR(255),
  email VARCHAR(150) UNIQUE,
  tel VARCHAR(20),
  idAbonnement INT REFERENCES Abonnement(idAbonnement)
);

CREATE TABLE Paiement (
  idPaiement SERIAL PRIMARY KEY,
  montant NUMERIC(6,2),
  datePaiement DATE,
  moyenPaiement VARCHAR(50),
  idAdherent INT REFERENCES Adherent(idAdherent)
);

CREATE TABLE Coach (
  idCoach SERIAL PRIMARY KEY,
  nom VARCHAR(100),
  prenom VARCHAR(100),
  specialite VARCHAR(100),
  tel VARCHAR(20)
);

CREATE TABLE Cours (
  idCours SERIAL PRIMARY KEY,
  nomCours VARCHAR(100),
  date DATE,
  heure TIME,
  duree INT,
  idCoach INT REFERENCES Coach(idCoach)
);

CREATE TABLE Reservation (
  idAdherent INT REFERENCES Adherent(idAdherent),
  idCours INT REFERENCES Cours(idCours),
  statut VARCHAR(50),
  PRIMARY KEY (idAdherent, idCours)
);

-- 1️⃣ ABONNEMENT
INSERT INTO Abonnement (type, tarif, dateDebut, dateFin) VALUES
('Mensuel', 50.00, '2025-09-01', '2025-09-30'),
('Trimestriel', 135.00, '2025-07-01', '2025-09-30'),
('Annuel', 480.00, '2025-01-01', '2025-12-31');

-- 2️⃣ ADHERENT
INSERT INTO Adherent (nom, prenom, dateNaiss, adresse, email, tel, idAbonnement) VALUES
('Martin', 'Alice', '1990-05-12', '12 rue des Lilas', 'alice.martin@email.com', '0601020304', 1),
('Dupont', 'Jean', '1985-03-22', '45 avenue Victor Hugo', 'jean.dupont@email.com', '0605060708', 2),
('Durand', 'Claire', '1992-11-05', '7 boulevard de la République', 'claire.durand@email.com', '0611121314', 3),
('Lemoine', 'Paul', '1988-02-14', '23 rue des Fleurs', 'paul.lemoine@email.com', '0622334455', 1),
('Morel', 'Sophie', '1995-08-30', '89 avenue de Paris', 'sophie.morel@email.com', '0677889900', 2);

-- 3️⃣ COACH
INSERT INTO Coach (nom, prenom, specialite, tel) VALUES
('Leclerc', 'Marc', 'Musculation', '0622334455'),
('Moreau', 'Sophie', 'Yoga', '0677889900'),
('Bernard', 'Lucas', 'Cardio', '0611223344');

-- 4️⃣ COURS
INSERT INTO Cours (nomCours, date, heure, duree, idCoach) VALUES
('Renforcement musculaire', '2025-10-08', '18:00', 60, 1),
('Yoga détente', '2025-10-08', '19:30', 45, 2),
('Cardio intense', '2025-10-09', '17:00', 50, 3),
('Musculation débutant', '2025-10-10', '18:00', 60, 1),
('Yoga avancé', '2025-10-11', '19:30', 60, 2);

-- 5️⃣ PAIEMENT
INSERT INTO Paiement (montant, datePaiement, moyenPaiement, idAdherent) VALUES
(50.00, '2025-09-01', 'Carte bancaire', 1),
(135.00, '2025-07-01', 'Virement', 2),
(480.00, '2025-01-01', 'Espèces', 3),
(50.00, '2025-09-01', 'Espèces', 4),
(135.00, '2025-07-01', 'Carte bancaire', 5);

-- 6️⃣ RESERVATION
INSERT INTO Reservation (idAdherent, idCours, statut) VALUES
(1, 1, 'Confirmé'),
(2, 1, 'Confirmé'),
(3, 2, 'Annulé'),
(4, 3, 'Confirmé'),
(5, 2, 'Confirmé'),
(1, 4, 'En attente'),
(2, 5, 'Confirmé'),
(3, 5, 'Confirmé'),
(4, 1, 'Confirmé'),
(5, 3, 'Confirmé');

