create database database_laliga;
use database_laliga;
-- 1. CLUB Table without foreign keys
CREATE TABLE CLUB (
    Club_ID INT PRIMARY KEY AUTO_INCREMENT,
    Club_Name VARCHAR(100),
    City VARCHAR(100),
    Stadium_ID INT,  -- This will be set as a foreign key later
    President_ID INT,  -- This will be set as a foreign key later
    Number_of_Club_Titles INT,
    Number_of_Relegations INT,
    Wins INT,
    Losses INT,
    Home_Wins INT,
    Home_Losses INT,
    Away_Wins INT,
    Away_Losses INT
);

-- 2. PRESIDENT Table
CREATE TABLE PRESIDENT (
    President_ID INT PRIMARY KEY AUTO_INCREMENT,
    President_Name VARCHAR(100),
    DOB DATE,
    Club_ID INT,  -- This will be set as a foreign key later
    Appointed_Date DATE
);

-- 3. PLAYER Table
CREATE TABLE PLAYER (
    Player_ID INT PRIMARY KEY AUTO_INCREMENT,
    Player_Name VARCHAR(100),
    DOB DATE,
    Nationality VARCHAR(100),
    National_Team VARCHAR(100),
    Club_ID INT,  -- This will be set as a foreign key later
    Jersey_Number INT,
    Position VARCHAR(50),
    Strong_Foot VARCHAR(10),
    Matches_Played INT,
    Minutes_Played INT,
    Goals INT,
    Assists INT,
    Yellow_Cards INT,
    Red_Cards INT
);

-- 4. MANAGER Table
CREATE TABLE MANAGER (
    Manager_ID INT PRIMARY KEY AUTO_INCREMENT,
    Manager_Name VARCHAR(100),
    DOB DATE,
    Nationality VARCHAR(100),
    Club_ID INT,  -- This will be set as a foreign key later
    Playstyle VARCHAR(100),
    Matches_Won INT,
    Matches_Lost INT,
    Home_Wins INT,
    Home_Losses INT,
    Away_Wins INT,
    Away_Losses INT
);

-- 5. FIXTURE Table
CREATE TABLE FIXTURE (
    Fixture_ID INT PRIMARY KEY AUTO_INCREMENT,
    Home_Team_ID INT,  -- This will be set as a foreign key later
    Away_Team_ID INT,  -- This will be set as a foreign key later
    Stadium_ID INT,  -- This will be set as a foreign key later
    Referee_ID INT,  -- This will be set as a foreign key later
    Fixture_Date DATE,
    Fixture_Time TIME,
    Attendance INT,
    Home_Score INT,
    Away_Score INT
);

-- 6. REFEREE Table
CREATE TABLE REFEREE (
    Referee_ID INT PRIMARY KEY AUTO_INCREMENT,
    Referee_Name VARCHAR(100),
    DOB DATE,
    Appearances INT,
    Yellow_Cards INT,
    Red_Cards INT
);

-- 7. STADIUM Table
CREATE TABLE STADIUM (
    Stadium_ID INT PRIMARY KEY AUTO_INCREMENT,
    Stadium_Name VARCHAR(100),
    Club_ID INT,  -- This will be set as a foreign key later
    City VARCHAR(100),
    Capacity INT
);

ALTER TABLE FIXTURE ADD COLUMN Last_Updated DATETIME;

-- Adding foreign keys after table creation

-- 1. Add foreign keys to CLUB table
ALTER TABLE CLUB
ADD CONSTRAINT fk_club_stadium
    FOREIGN KEY (Stadium_ID) REFERENCES STADIUM(Stadium_ID),
ADD CONSTRAINT fk_club_president
    FOREIGN KEY (President_ID) REFERENCES PRESIDENT(President_ID);

-- 2. Add foreign key to PRESIDENT table
ALTER TABLE PRESIDENT
ADD CONSTRAINT fk_president_club
    FOREIGN KEY (Club_ID) REFERENCES CLUB(Club_ID);

-- 3. Add foreign key to PLAYER table
ALTER TABLE PLAYER
ADD CONSTRAINT fk_player_club
    FOREIGN KEY (Club_ID) REFERENCES CLUB(Club_ID);

-- 4. Add foreign key to MANAGER table
ALTER TABLE MANAGER
ADD CONSTRAINT fk_manager_club
    FOREIGN KEY (Club_ID) REFERENCES CLUB(Club_ID);

-- 5. Add foreign keys to FIXTURE table
ALTER TABLE FIXTURE
ADD CONSTRAINT fk_fixture_home_team
    FOREIGN KEY (Home_Team_ID) REFERENCES CLUB(Club_ID),
ADD CONSTRAINT fk_fixture_away_team
    FOREIGN KEY (Away_Team_ID) REFERENCES CLUB(Club_ID),
ADD CONSTRAINT fk_fixture_stadium
    FOREIGN KEY (Stadium_ID) REFERENCES STADIUM(Stadium_ID),
ADD CONSTRAINT fk_fixture_referee
    FOREIGN KEY (Referee_ID) REFERENCES REFEREE(Referee_ID);

-- 6. Add foreign key to STADIUM table
ALTER TABLE STADIUM
ADD CONSTRAINT fk_stadium_club
    FOREIGN KEY (Club_ID) REFERENCES CLUB(Club_ID);
    
-- ----------------------------- --

use database_laliga;

-- CLUB INFO --
INSERT INTO club (Club_ID, Club_Name, City, Number_of_Club_Titles, Number_of_Relegations, Wins, Losses, Home_Wins, Home_Losses, Away_Wins, Away_Losses) VALUES
(11, 'FC Barcelona', 'Barcelona', 26, 0, 8, 1, 5, 0, 3, 1),
(12, 'Real Madrid', 'Madrid', 35, 0, 9, 0, 4, 0, 5, 0),
(13, 'Atletico Madrid', 'Madrid', 11, 1, 7, 2, 4, 1, 3, 1),
(14, 'Villarreal', 'Villarreal', 0, 3, 5, 3, 3, 2, 2, 1),
(15, 'Osasuna', 'Pamplona', 0, 2, 4, 4, 2, 2, 2, 2),
(16, 'Athletic Bilbao', 'Bilbao', 8, 0, 6, 3, 4, 1, 2, 2),
(17, 'Real Betis', 'Seville', 1, 1, 5, 3, 3, 1, 2, 2),
(18, 'Mallorca', 'Palma', 0, 4, 3, 5, 2, 3, 1, 2),
(19, 'Rayo Vallecano', 'Madrid', 0, 7, 3, 5, 2, 3, 1, 2),
(20, 'Celta Vigo', 'Vigo', 0, 10, 2, 6, 1, 3, 1, 3);
-- PLAYER INFO --
-- FC BARCELONA --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards)  VALUES 
(101, "Marc Andre Ter Stegen", '1992-04-30', "Germany", "Germany", 1, "GK", "Right", 6, 495, 0, 0, 0, 0),
(102, "Inaki Pena", '1999-03-02', "Spain", "Spain", 13, "GK", "Right", 7, 585, 0, 0, 1, 0),
(103, "Gavi", '2004-08-05', "Spain", "Spain", 6, "CMF", "Right", 3, 15, 0, 0, 1, 0),
(104, "F.De Jong", '1997-05-12', "Netherlands", "Netherlands", 21, "CMF", "Right", 3, 88, 0, 0, 0, 0),
(105, "Fermin Lopez", '2003-05-11', "Spain", "Spain", 16, "AMF", "Right", 6, 160, 0, 0, 1, 0),
(106, "Marc Casado", '2003-09-14', "Spain", "Spain", 17, "DMF", "Right", 10, 683, 0, 3, 1, 0),
(107, "Robert Lewandowski", '1988-08-21', "Poland", "Poland", 9, "ST", "Right", 12, 985, 14, 2, 1, 0),
(108, "Raphinha", '1996-12-14', "Brazil", "Brazil", 11, "RW", "Left", 12, 992, 7, 6, 1, 0),
(109, "Lamine Yamal", '2007-07-13', "Spain", "Spain", 27, "FW", "Left", 12, 980, 5, 7, 0, 0),
(110, "Dani Olmo", '1998-05-07', "Spain", "Spain", 21, "CAM", "Right", 5, 270, 5, 0, 1, 0),
(111, "Jules Kounde", '1998-11-12', "France", "France", 23, "CB", "Right", 12, 935, 1, 1, 3, 0),
(112, "Ferran Torres", '2000-02-29', "Spain", "Spain", 7, "RW", "Right", 8, 328, 1, 2, 1, 0),
(113, "Pedri", '2002-11-25', "Spain", "Spain", 8, "CM", "Right", 12, 843, 3, 1, 1, 0);
-- REAL MADRID --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards)  VALUES 
(121, "Kylian Mbappe", '1998-12-20', "France", "France", 7, "FW", "Right", 10, 820, 6, 1, 2, 0),
(122, "Vinicius Junior", '2000-07-12', "Brazil", "Brazil", 11, "FW", "Right", 11, 910, 5, 4, 1, 0),
(123, "Rodrygo", '2001-01-09', "Brazil", "Brazil", 21, "FW", "Right", 10, 750, 3, 2, 1, 0),
(124, "Federico Valverde", '1998-07-22', "Uruguay", "Uruguay", 15, "MF", "Right", 11, 920, 3, 1, 2, 0),
(125, "Antonio Rudiger", '1993-03-03', "Germany", "Germany", 2, "DF", "Right", 11, 990, 1, 0, 3, 0),
(126, "Lucas Vazquez", '1991-07-01', "Spain", "Spain", 17, "FW", "Right", 9, 610, 2, 1, 1, 0),
(127, "Brahim Diaz", '1999-08-03', "Spain", "Spain", 21, "MF", "Right", 9, 700, 1, 1, 2, 0),
(128, "Eder Militao", '1998-01-18', "Brazil", "Brazil", 3, "DF", "Right", 10, 810, 1, 0, 2, 0),
(129, "Dani Carvajal", '1992-01-11', "Spain", "Spain", 2, "DF", "Right", 9, 780, 1, 1, 1, 0),
(130, "Endrick", '2006-07-21', "Brazil", "Brazil", 9, "FW", "Left", 8, 450, 2, 0, 1, 0),
(131, "Jude Bellingham", '2003-06-29', "England", "England", 22, "MF", "Right", 10, 900, 0, 3, 3, 0),
(132, "Thibaut Courtois", '1992-05-11', "Belgium", "Belgium", 1, "GK", "Left", 10, 900, 0, 0, 0, 0),
(133, "Fran Garcia", '1999-08-14', "Spain", "Spain", 20, "DF", "Left", 10, 800, 0, 1, 1, 0);
-- ATHLETICO MADRID --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards) VALUES
(141, "Jan Oblak", '1993-01-07', "Slovenia", "Slovenia", 13, "Goalkeeper", "Right", 11, 990, 0, 0, 0, 0),
(142, "Nahuel Molina", '1998-04-06', "Argentina", "Argentina", 16, "Defender", "Right", 9, 615, 0, 1, 0, 0),
(143, "Cesar Azpilicueta", '1989-08-28', "Spain", "Spain", 3, "Defender", "Right", 5, 392, 0, 0, 0, 0),
(144, "Jose Maria Gimenez", '1995-01-20', "Uruguay", "Uruguay", 2, "Defender", "Right", 11, 836, 1, 0, 1, 0),
(145, "Reinildo Mandava", '1994-01-21', "Mozambique", "Mozambique", 23, "Defender", "Left", 11, 509, 0, 0, 2, 0),
(146, "Koke", '1992-01-08', "Spain", "Spain", 6, "Midfielder", "Right", 12, 879, 1, 2, 3, 0),
(147, "Marcos Llorente", '1995-01-30', "Spain", "Spain", 14, "Midfielder", "Right", 8, 629, 2, 1, 0, 1),
(148, "Rodrigo De Paul", '1994-05-24', "Argentina", "Argentina", 5, "Midfielder", "Right", 11, 532, 0, 0, 2, 0),
(149, "Antoine Griezmann", '1991-03-21', "France", "France", 7, "Forward", "Left", 12, 896, 5, 3, 1, 0),
(150, "Angel Correa", '1995-03-09', "Argentina", "Argentina", 10, "Forward", "Right", 11, 286, 1, 2, 0, 0),
(151, "Samuel Lino", '1999-12-23', "Brazil", "Brazil", 12, "Midfielder", "Right", 10, 580, 0, 0, 1, 0),
(152, "Axel Witsel", '1989-01-12', "Belgium", "Belgium", 20, "Defender", "Right", 7, 501, 0, 0, 0, 0),
(153, "Mario Hermoso", '1995-06-18', "Spain", "Spain", 22, "Defender", "Left", 10, 650, 0, 1, 2, 0);
-- VILLAREAL --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards) VALUES 
(161, "R. Albiol", '1985-09-04', "Spain", "Spain", 3, "Defender", "Right", 9, 649, 0, 0, 2, 0),
(162, "Gerard", '1992-04-12', "Spain", "Spain", 7, "Forward", "Right", 2, 116, 0, 0, 0, 0),
(163, "Parejo", '1989-04-16', "Spain", "Spain", 10, "Midfielder", "Right", 11, 758, 1, 0, 4, 0),
(164, "I. Akhomach", '2004-04-16', "Spain", "Spain", 11, "Forward", "Right", 10, 542, 0, 0, 1, 0),
(165, "Juan Bernat", '1993-03-01', "Spain", "Spain", 12, "Defender", "Left", 5, 25, 0, 0, 0, 0),
(166, "Diego Conde", '1999-10-10', "Spain", "Spain", 13, "Goalkeeper", "Right", 11, 990, 0, 0, 1, 0),
(167, "Santi Cazorla", '1984-12-13', "Spain", "Spain", 14, "Midfielder", "Right", 11, 836, 1, 0, 3, 0),
(168, "Barry", '2000-02-23', "Spain", "Spain", 15, "Forward", "Left", 10, 693, 3, 0, 1, 0),
(169, "Alex Baena", '2001-06-20', "Spain", "Spain", 16, "Midfielder", "Right", 10, 748, 1, 0, 3, 0),
(170, "Kiko Femenia", '1991-03-02', "Spain", "Spain", 17, "Defender", "Right", 11, 990, 0, 0, 4, 0),
(171, "Yeremy Pino", '2002-10-20', "Spain", "Spain", 21, "Midfielder", "Right", 9, 346, 0, 0, 2, 0),
(172, "Ayoze Perez", '1993-07-29', "Spain", "Spain", 22, "Forward", "Right", 8, 432, 7, 0, 3, 0),
(173, "Sergi Cardona", '2001-04-08', "Spain", "Spain", 23, "Defender", "Left", 11, 979, 1, 0, 2, 0);
-- OSASUNA --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards) VALUES
(181, "Sergio Herrera", '1993-06-05', "Spain", "None", 1, "Goalkeeper", "Right", 10, 900, 0, 0, 2, 0),
(182, "Alejandro Catena", '1995-10-28', "Spain", "None", 24, "Centre-Back", "Right", 9, 810, 1, 0, 4, 0),
(183, "David Garcia", '1994-02-14', "Spain", "Spain", 5, "Centre-Back", "Right", 10, 900, 0, 0, 3, 0),
(184, "Aimar Oroz", '2001-11-27', "Spain", "None", 22, "Midfielder", "Right", 8, 560, 1, 2, 3, 0),
(185, "Ruben Garcia", '1993-07-14', "Spain", "None", 14, "Left-Winger", "Left", 8, 640, 0, 1, 2, 0),
(186, "Moi Gomez", '1994-06-23', "Spain", "None", 16, "Midfielder", "Left", 10, 790, 2, 3, 1, 0),
(187, "Chimy Avila", '1994-02-06', "Argentina", "None", 9, "Forward", "Right", 9, 780, 4, 1, 4, 0),
(188, "Ante Budimir", '1991-07-22', "Croatia", "Croatia", 17, "Striker", "Left", 10, 810, 3, 0, 2, 0),
(189, "Nacho Vidal", '1995-01-24', "Spain", "None", 2, "Right-Back", "Right", 8, 630, 0, 1, 3, 0),
(190, "Lucas Torro", '1994-07-19', "Spain", "None", 6, "Defensive-Midfielder", "Right", 7, 500, 0, 1, 2, 0),
(191, "Kike Barja", '1997-06-22', "Spain", "None", 11, "Right-Winger", "Right", 8, 620, 1, 1, 1, 0),
(192, "Juan Cruz", '1992-07-21', "Spain", "None", 3, "Left-Back", "Left", 4, 205, 0, 0, 2, 0),
(193, "Abel Bretones", '2001-09-10', "Spain", "None", 23, "Left-Back", "Left", 9, 702, 2, 1, 3, 0);
-- ATHLETIC BILBAO --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards) VALUES
(201, "Unai Simon", '1997-06-11', "Spain", "Spain", 1, "Goalkeeper", "Right", 12, 1080, 0, 0, 0, 0),
(202, "Inaki Williams", '1994-06-15', "Ghana", "Ghana", 9, "Forward", "Right", 11, 970, 4, 4, 0, 0),
(203, "Nico Williams", '2002-07-12', "Spain", "Spain", 11, "Forward", "Right", 10, 810, 1, 1, 1, 0),
(204, "Oihan Sancet", '2000-04-25', "Spain", "Spain", 8, "Midfielder", "Right", 10, 820, 5, 0, 1, 0),
(205, "Alex Berenguer", '1995-07-04', "Spain", "Spain", 7, "Winger", "Right", 10, 900, 2, 4, 2, 0),
(206, "Dani Vivian", '1999-07-05', "Spain", "Spain", 3, "Defender", "Right", 12, 1080, 2, 0, 2, 0),
(207, "Yuri Berchiche", '1990-02-10', "Spain", "Spain", 17, "Left Back", "Left", 11, 990, 0, 0, 2, 0),
(208, "Mikel Vesga", '1993-05-08', "Spain", "Spain", 6, "Midfielder", "Left", 9, 810, 0, 2, 2, 0),
(209, "Oscar de Marcos", '1989-06-14', "Spain", "Spain", 18, "Defender", "Right", 8, 720, 0, 2, 2, 0),
(210, "Unai Gomez", '2002-03-05', "Spain", "Spain", 20, "Midfielder", "Right", 10, 880, 1, 2, 1, 0),
(211, "Ander Herrera", '1989-08-14', "Spain", "Spain", 21, "Midfielder", "Right", 6, 460, 0, 0, 2, 0),
(212, "Gorka Guruzeta", '1996-09-12', "Spain", "Spain", 12, "Forward", "Left", 11, 900, 2, 2, 0, 0),
(213, "Aitor Paredes", '2000-04-05', "Spain", "Spain", 4, "Defender", "Right", 10, 900, 1, 0, 3, 1);
-- REAL BETIS --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards) VALUES
(221, "Rui Silva", '1994-02-07', "Portugal", "Portugal", 13, "GK", "Right", 13, 1170, 0, 0, 1, 0),
(222, "Diego Llorente", '1993-08-16', "Spain", "Spain", 3, "CB", "Right", 13, 1035, 0, 0, 3, 0),
(223, "Nabil Fekir", '1993-07-18', "France", "France", 8, "AMF", "Left", 12, 890, 4, 3, 1, 0),
(224, "Ayoze Perez", '1993-07-29', "Spain", "Spain", 10, "FW", "Right", 12, 940, 3, 2, 2, 0),
(225, "Guido Rodriguez", '1994-04-12', "Argentina", "Argentina", 5, "DMF", "Right", 13, 1115, 1, 1, 5, 0),
(226, "Isco", '1992-04-21', "Spain", "Spain", 22, "AMF", "Right", 12, 850, 3, 4, 3, 0),
(227, "Borja Iglesias", '1993-01-17', "Spain", "Spain", 9, "FW", "Right", 11, 720, 5, 1, 2, 0),
(228, "Romain Perraud", '1997-09-22', "France", "France", 15, "LB", "Left", 12, 773, 0, 2, 2, 0),
(229, "Youssouf Sabaly", '1993-03-05', "Senegal", "Senegal", 23, "RB", "Right", 13, 1110, 0, 1, 3, 0),
(230, "William Carvalho", '1992-04-07', "Portugal", "Portugal", 14, "DMF", "Right", 10, 810, 1, 1, 2, 0),
(231, "Hector Bellerin", '1995-03-19', "Spain", "Spain", 2, "RB", "Right", 8, 658, 0, 0, 1, 0),
(232, "Juanmi", '1993-05-20', "Spain", "Spain", 7, "LW", "Right", 9, 540, 2, 1, 1, 0),
(233, "Claudio Bravo", '1983-04-13', "Chile", "Chile", 1, "GK", "Right", 2, 180, 0, 0, 0, 0);
-- MALLORCA --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards) VALUES
(241, 'Dominik Greif', '1997-04-06', 'Slovakia', 'Slovakia', 1, 'Goalkeeper', 'Right', 8, 720, 0, 0, 0, 0),
(242, 'Mateu Jaume', '1998-05-02', 'Spain', 'Spain', 2, 'Defender', 'Right', 0, 0, 0, 0, 1, 0),
(243, 'Toni Lato', '1997-11-21', 'Spain', 'Spain', 3, 'Defender', 'Left', 5, 263, 0, 0, 0, 1),
(244, 'Omar Mascarell', '1993-02-02', 'Spain', 'Spain', 5, 'Midfielder', 'Right', 11, 616, 0, 0, 2, 0),
(245, 'Jose Copete', '1999-07-25', 'Spain', 'Spain', 6, 'Defender', 'Right', 9, 396, 0, 0, 2, 0),
(246, 'Vedat Muriqi', '1994-04-24', 'Kosovo', 'Kosovo', 7, 'Forward', 'Left', 9, 676, 2, 0, 1, 0),
(247, 'Manu Morlanes', '1999-01-12', 'Spain', 'Spain', 8, 'Midfielder', 'Right', 11, 608, 0, 0, 3, 0),
(248, 'Abdon Prats', '1992-12-17', 'Spain', 'Spain', 9, 'Forward', 'Right', 9, 152, 1, 0, 2, 0),
(249, 'Sergi Darder', '1993-12-22', 'Spain', 'Spain', 10, 'Midfielder', 'Right', 12, 746, 0, 0, 0, 0),
(250, 'Takuma Asano', '1994-11-10', 'Japan', 'Japan', 11, 'Forward', 'Right', 6, 321, 0, 0, 0, 0),
(251, 'Samu Costa', '2000-11-10', 'Portugal', 'Portugal', 12, 'Midfielder', 'Right', 11, 921, 0, 1, 3, 1),
(252, 'Leo Roman', '2000-07-18', 'Spain', 'Spain', 13, 'Goalkeeper', 'Right', 4, 360, 0, 0, 0, 0),
(253, 'Dani Rodriguez', '1988-06-06', 'Spain', 'Spain', 14, 'Midfielder', 'Right', 12, 672, 2, 0, 1, 0);
-- RAYO VALLECANO --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards)  VALUES 
(261, 'Stole Dimitrievski', '1994-12-12', 'North Macedonia', 'North Macedonia', 1, 'GK', 'Right', 11, 990, 0, 0, 0, 0),
(262, 'Andrei', '1996-10-14', 'Romania', 'Romania', 2, 'DF', 'Right', 11, 800, 1, 0, 1, 0),
(263, 'Pacha', '1996-03-03', 'Spain', 'Spain', 5, 'DF', 'Left', 4, 305, 0, 0, 1, 0),
(264, 'Lejeune', '1991-11-05', 'France', 'France', 24, 'DF', 'Right', 11, 990, 0, 0, 1, 0),
(265, 'Aridane', '1986-05-14', 'Spain', 'Spain', 6, 'DF', 'Right', 2, 42, 0, 0, 0, 0),
(266, 'Pathe Ismael Ciss', '1995-03-09', 'Senegal', 'Senegal', 7, 'MF', 'Right', 9, 339, 0, 0, 2, 0),
(267, 'Isi Palazon', '1994-12-20', 'Spain', 'Spain', 8, 'MF', 'Right', 11, 630, 1, 0, 5, 0),
(268, 'Oscar Trejo', '1983-09-23', 'Argentina', 'Argentina', 10, 'MF', 'Right', 11, 750, 0, 1, 0, 0),
(269, 'Sergio Camello', '2001-05-17', 'Spain', 'Spain', 11, 'FW', 'Right', 11, 616, 2, 3, 1, 0),
(270, 'De Frutos', '1999-07-06', 'Spain', 'Spain', 19, 'FW', 'Right', 11, 784, 0, 2, 7, 0),
(271, 'Embarba', '1993-03-04', 'Spain', 'Spain', 22, 'FW', 'Right', 10, 575, 0, 3, 2, 0),
(272, 'Nteka', '1997-07-19', 'France', 'France', 14, 'MF', 'Right', 7, 291, 0, 0, 3, 0),
(273, 'Unai Lopez', '1999-03-23', 'Spain', 'Spain', 17, 'MF', 'Left', 11, 624, 0, 0, 5, 0);
-- CELTA VIGO --
INSERT INTO player (Player_ID, Player_Name, DOB, Nationality, National_Team, Jersey_Number, Position, Strong_Foot, Matches_Played, Minutes_Played, Goals, Assists, Yellow_Cards, Red_Cards) VALUES 
(281, "Ivan Villar", '1997-03-22', "Spain", "Spain", 1, "GK", "Right", 10, 900, 0, 0, 0, 0),
(282, "Hugo Mallo", '1991-06-22', "Spain", "Spain", 2, "DF", "Right", 10, 900, 0, 1, 3, 0),
(283, "Joseph Aidoo", '1996-12-29', "Ghana", "Ghana", 3, "DF", "Right", 10, 900, 0, 0, 2, 0),
(284, "Unai Nunez", '1996-01-30', "Spain", "Spain", 4, "DF", "Right", 10, 900, 0, 1, 3, 0),
(285, "Coudouris", '2000-07-15', "Spain", "Spain", 5, "MF", "Left", 10, 900, 0, 0, 2, 0),
(286, "Brais Mendez", '1997-01-07', "Spain", "Spain", 6, "MF", "Right", 10, 900, 2, 2, 1, 0),
(287, "Denis Suarez", '1994-01-06', "Spain", "Spain", 7, "MF", "Right", 10, 900, 1, 3, 2, 0),
(288, "Gabri Veiga", '2003-05-09', "Spain", "Spain", 8, "MF", "Right", 10, 900, 3, 2, 1, 0),
(289, "Iago Aspas", '1987-08-01', "Spain", "Spain", 9, "FW", "Left", 10, 900, 6, 3, 2, 0),
(290, "Nolito", '1986-10-15', "Spain", "Spain", 10, "FW", "Left", 10, 900, 1, 1, 2, 0),
(291, "Santi Mina", '1995-12-07', "Spain", "Spain", 11, "FW", "Right", 10, 900, 2, 1, 2, 0),
(292, "Giorgi Chakvetadze", '1998-07-18', "Georgia", "Georgia", 12, "FW", "Right", 10, 900, 0, 0, 1, 0),
(293, "Juan Carlos", '1992-02-15', "Spain", "Spain", 13, "FW", "Right", 10, 900, 0, 0, 1, 0);
-- MANAGER INFO --
INSERT INTO manager (Manager_ID, Manager_Name, DOB, Nationality, Playstyle, Matches_Won, Matches_Lost, Home_Wins, Home_Losses, Away_Wins, Away_Losses) VALUES
(11, 'Hansi Flick', '1965-02-24', 'Germany', 'Possession', 10, 3, 6, 1, 4, 2),
(12, 'Carlo Ancelotti', '1959-06-10', 'Italy', 'Balanced', 12, 2, 8, 0, 4, 2),
(13, 'Diego Simeone', '1970-04-28', 'Argentina', 'Counter-Attacking', 9, 4, 5, 1, 4, 3),
(14, 'Pacheta', '1968-03-23', 'Spain', 'Direct-play', 6, 5, 4, 2, 2, 3),
(15, 'Jagoba Arrasate', '1978-04-22', 'Spain', 'High-pressing', 7, 6, 4, 2, 3, 4),
(16, 'Ernesto Valverde', '1964-02-09', 'Spain', 'Defensive-stability', 8, 4, 5, 2, 3, 2),
(17, 'Manuel Pellegrini', '1953-09-16', 'Chile', 'Possession', 11, 3, 6, 1, 5, 2),
(18, 'Javier Aguirre', '1958-12-01', 'Mexico', 'Defensive', 5, 7, 3, 3, 2, 4),
(19, 'Francisco Rodriguez', '1978-04-09', 'Spain', 'Attacking', 6, 6, 4, 2, 2, 4),
(20, 'Rafael Benitez', '1960-04-16', 'Spain', 'Tactical', 8, 4, 5, 2, 3, 2);
-- PRESIDENT INFO --
INSERT INTO president (President_ID, President_Name, DOB, Appointed_Date) VALUES
(11, 'Joan Laporta', '1962-06-29', '2021-03-07'),    -- FC Barcelona
(12, 'Florentino Perez', '1947-03-08', '2009-06-01'), -- Real Madrid
(13, 'Enrique Cerezo', '1948-02-27', '2003-05-28'),   -- Atlético Madrid
(14, 'Fernando Roig', '1947-06-25', '1997-05-15'),    -- Villarreal
(15, 'Luis Sabalza', '1954-07-04', '1999-02-12'), -- Osasuna
(16, 'Jon Uriarte', '1978-09-18', '2022-06-24'),     -- Athletic Bilbao
(17, 'Ángel Haro', '1974-07-12', '2016-07-01'),      -- Real Betis
(18, 'Andy Kohlberg', '1960-10-18', '2020-01-01'),   -- Mallorca
(19, 'Raul Martin Presa', '1977-07-26', '2011-05-25'), -- Rayo Vallecano
(20, 'Carlos Mourino', '1943-03-04', '2011-06-22'); -- Celta Vigo
-- STADIUM INFO --
INSERT INTO stadium (Stadium_ID, Stadium_Name, City, Capacity) VALUES
(11, 'Estadi Olímpic Lluis Companys', 'Barcelona', 55000),  -- Temporary home for FC Barcelona
(12, 'Santiago Bernabeu', 'Madrid', 81044),                 -- Real Madrid
(13, 'Civitas Metropolitano', 'Madrid', 68456),             -- Atlético Madrid
(14, 'Estadio de la Ceramica', 'Villarreal', 23700),        -- Villarreal CF
(15, 'Estadio El Sadar', 'Pamplona', 23516),                -- Osasuna
(16, 'San Mames', 'Bilbao', 53289),                         -- Athletic Bilbao
(17, 'Estadio Benito Villamarin', 'Seville', 60721),        -- Real Betis
(18, 'Estadi Mallorca Son Moix', 'Palma', 23142),           -- Mallorca
(19, 'Estadio de Vallecas', 'Madrid', 14505),               -- Rayo Vallecano
(20, 'Abanca-Balaidos', 'Vigo', 29000);                   -- Celta Vigo
-- REFEREE INFO --
INSERT INTO referee (Referee_ID, Referee_Name, DOB, Appearances, Yellow_Cards, Red_Cards) VALUES
(11, 'Jose Maria Sanchez Martinez', '1983-10-03', 7, 42, 1),  
(12, 'Alejandro Muniz Ruiz', '1991-05-24', 7, 24, 3),                 
(13, 'Mateo Busquets Ferrer', '1993-10-31', 7, 36, 2),             
(14, 'Mario Melero Lopez', '1979-07-02', 6, 23, 0);
-- FIXTURE INFO --
INSERT INTO fixture (Fixture_ID, Fixture_Date, Fixture_Time, Attendance, Home_Score, Away_Score) VALUES
(101, '2024-10-27', '12:30', 78192, '4', '0'),
(102, '2024-09-22', '12:30', 22048, '1', '5'),
(103, '2024-09-29', '08:30', 22322, '4', '2'),
(104, '2024-08-24', '08:30', 84817, '2', '1'),
(105, '2024-08-28', '12:30', 13657, '1', '2');


-- FOREIGN KEY UPDATIONS --

SET SQL_SAFE_UPDATES = 0;


-- Link each Stadium to their Club
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Stadium_Name = 'Estadi Olímpic Lluis Companys';
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Stadium_Name = 'Santiago Bernabeu';
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Stadium_Name = 'Civitas Metropolitano';
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Stadium_Name = 'Estadio de la Ceramica';
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Stadium_Name = 'Estadio El Sadar';
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Stadium_Name = 'San Mames';
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Stadium_Name = 'Estadio Benito Villamarin';
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Stadium_Name = 'Estadi Mallorca Son Moix';
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Stadium_Name = 'Estadio de Vallecas';
UPDATE STADIUM
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Stadium_Name = 'Abanca-Balaidos';


-- Link each President to their Club
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona')
WHERE President_Name = 'Joan Laporta';
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid')
WHERE President_Name = 'Florentino Perez';
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid')
WHERE President_Name = 'Enrique Cerezo';
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal')
WHERE President_Name = 'Fernando Roig';
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna')
WHERE President_Name = 'Luis Sabalza';
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao')
WHERE President_Name = 'Jon Uriarte';
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis')
WHERE President_Name = 'Angel Haro';
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca')
WHERE President_Name = 'Andy Kohlberg';
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano')
WHERE President_Name = 'Raul Martin Presa';
UPDATE PRESIDENT 
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo')
WHERE President_Name = 'Carlos Mourino';


--- Link each Manager to their Club
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Manager_Name = 'Hansi Flick';
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Manager_Name = 'Carlo Ancelotti';
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Manager_Name = 'Diego Simeone';
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Manager_Name = 'Pacheta';
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Manager_Name = 'Jagoba Arrasate'; 
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Manager_Name = 'Ernesto Valverde';
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Manager_Name = 'Manuel Pellegrini';
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Manager_Name = 'Javier Aguirre';
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Manager_Name = 'Francisco Rodriguez';
UPDATE MANAGER
SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Manager_Name = 'Rafael Benitez';


-- Set Player_ID for each player
-- FC Barcelona
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Marc Andre Ter Stegen';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Inaki Pena';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Gavi';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'F.De Jong';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Fermin Lopez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Marc Casado';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Robert Lewandowski';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Raphinha';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Lamine Yamal';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Dani Olmo';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Jules Kounde';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Ferran Torres';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'FC Barcelona') WHERE Player_Name = 'Pedri';

-- Real Madrid
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Kylian Mbappe';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Vinicius Junior';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Rodrygo';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Federico Valverde';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Antonio Rudiger';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Lucas Vazquez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Brahim Diaz';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Eder Militao';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Dani Carvajal';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Endrick';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Jude Bellingham';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Thibaut Courtois';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Madrid') WHERE Player_Name = 'Fran Garcia';

-- Atletico Madrid
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Jan Oblak';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Nahuel Molina';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Cesar Azpilicueta';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Jose Maria Gimenez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Reinildo Mandava';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Koke';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Marcos Llorente';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Rodrigo De Paul';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Antoine Griezmann';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Angel Correa';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Samuel Lino';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Axel Witsel';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Atletico Madrid') WHERE Player_Name = 'Mario Hermoso';

-- Villarreal
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'R. Albiol';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Gerard';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Parejo';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'I. Akhomach';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Juan Bernat';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Diego Conde';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Santi Cazorla';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Barry';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Alex Baena';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Kiko Femenia';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Yeremy Pino';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Ayoze Perez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Villarreal') WHERE Player_Name = 'Sergi Cardona';

-- Osasuna
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Sergio Herrera';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Alejandro Catena';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'David Garcia';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Aimar Oroz';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Ruben Garcia';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Moi Gomez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Chimy Avila';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Ante Budimir';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Nacho Vidal';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Lucas Torro';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Kike Barja';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Juan Cruz';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Osasuna') WHERE Player_Name = 'Abel Bretones';

-- Athletic Bilbao
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Unai Simon';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Inaki Williams';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Nico Williams';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Oihan Sancet';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Alex Berenguer';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Dani Vivian';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Yuri Berchiche';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Mikel Vesga';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Oscar de Marcos';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Unai Gomez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Ander Herrera';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Gorka Guruzeta';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Athletic Bilbao') WHERE Player_Name = 'Aitor Paredes';

-- Real Betis
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Rui Silva';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Diego Llorente';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Nabil Fekir';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Ayoze Perez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Guido Rodriguez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Isco';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Borja Iglesias';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Romain Perraud';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Youssouf Sabaly';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'William Carvalho';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Hector Bellerin';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Juanmi';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Real Betis') WHERE Player_Name = 'Claudio Bravo';

-- Mallorca
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Dominik Greif';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Mateu Jaume';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Toni Lato';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Omar Mascarell';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Jose Copete';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Vedat Muriqi';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Manu Morlanes';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Abdon Prats';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Sergi Darder';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Takuma Asano';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Samu Costa';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Leo Roman';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Mallorca') WHERE Player_Name = 'Dani Rodríguez';

-- Rayo Vallecano
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Stole Dimitrievski';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Andrei';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Pacha';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Lejeune';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Aridane';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Pathe Ismael Ciss';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Isi Palazon';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Oscar Trejo';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Sergio Camello';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'De Frutos';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Embarba';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Nteka';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Rayo Vallecano') WHERE Player_Name = 'Unai Lopez';

-- Celta Vigo
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Ivan Villar';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Hugo Mallo';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Joseph Aidoo';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Unai Nunez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Coudouris';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Brais Mendez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Denis Suarez';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Gabri Veiga';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Iago Aspas';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Nolito';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Santi Mina';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Giorgi Chakvetadze';
UPDATE PLAYER SET Club_ID = (SELECT Club_ID FROM CLUB WHERE CLUB.Club_Name = 'Celta Vigo') WHERE Player_Name = 'Juan Carlos';

-- Set the Stadium_ID for each club based on existing Stadiums
-- Set the Stadium_ID for each club based on existing Stadiums
UPDATE CLUB
SET Stadium_ID = (SELECT Stadium_ID FROM STADIUM WHERE STADIUM.Club_ID = CLUB.Club_ID);

-- Set the President_ID for each club based on existing Presidents
UPDATE CLUB
SET President_ID = (SELECT President_ID FROM PRESIDENT WHERE PRESIDENT.Club_ID = CLUB.Club_ID);

-- 1 --
-- Set Home_Team_ID and Away_Team_ID based on CLUB names
UPDATE FIXTURE
SET Home_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'FC Barcelona'),
    Away_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'Real Madrid')
WHERE Fixture_ID = 101; -- Specify Fixture_ID as needed

-- Set Stadium_ID based on the Home Team's stadium
UPDATE FIXTURE
SET Stadium_ID = (SELECT Stadium_ID FROM CLUB WHERE CLUB.Club_ID = FIXTURE.Home_Team_ID);

-- Set Referee_ID for each fixture based on Referee assignments
UPDATE FIXTURE
SET Referee_ID = (SELECT Referee_ID FROM REFEREE WHERE Referee_Name = 'Jose Maria Sanchez Martinez'); -- Replace with actual referee name

-- 2 --
-- Set Home_Team_ID and Away_Team_ID based on CLUB names
UPDATE FIXTURE
SET Home_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'Atletico Madrid'),
    Away_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'Villarreal')
WHERE Fixture_ID = 102; -- Specify Fixture_ID as needed

-- Set Stadium_ID based on the Home Team's stadium
UPDATE FIXTURE
SET Stadium_ID = (SELECT Stadium_ID FROM CLUB WHERE CLUB.Club_ID = FIXTURE.Home_Team_ID);

-- Set Referee_ID for each fixture based on Referee assignments
UPDATE FIXTURE
SET Referee_ID = (SELECT Referee_ID FROM REFEREE WHERE Referee_Name = 'Alejandro Muniz Ruiz'); -- Replace with actual referee name

-- 3 --
-- Set Home_Team_ID and Away_Team_ID based on CLUB names
UPDATE FIXTURE
SET Home_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'Osasuna'),
    Away_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'Athletic Bilbao')
WHERE Fixture_ID = 103; -- Specify Fixture_ID as needed

-- Set Stadium_ID based on the Home Team's stadium
UPDATE FIXTURE
SET Stadium_ID = (SELECT Stadium_ID FROM CLUB WHERE CLUB.Club_ID = FIXTURE.Home_Team_ID);

-- Set Referee_ID for each fixture based on Referee assignments
UPDATE FIXTURE
SET Referee_ID = (SELECT Referee_ID FROM REFEREE WHERE Referee_Name = 'Mario Melero Lopez'); -- Replace with actual referee name

-- 4 --
-- Set Home_Team_ID and Away_Team_ID based on CLUB names
UPDATE FIXTURE
SET Home_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'Real Betis'),
    Away_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'Mallorca')
WHERE Fixture_ID = 104; -- Specify Fixture_ID as needed

-- Set Stadium_ID based on the Home Team's stadium
UPDATE FIXTURE
SET Stadium_ID = (SELECT Stadium_ID FROM CLUB WHERE CLUB.Club_ID = FIXTURE.Home_Team_ID);

-- Set Referee_ID for each fixture based on Referee assignments
UPDATE FIXTURE
SET Referee_ID = (SELECT Referee_ID FROM REFEREE WHERE Referee_Name = 'Mateo Busquets Ferrer'); -- Replace with actual referee name

-- 5 --
-- Set Home_Team_ID and Away_Team_ID based on CLUB names
UPDATE FIXTURE
SET Home_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'Rayo Vallecano'),
    Away_Team_ID = (SELECT Club_ID FROM CLUB WHERE Club_Name = 'Celta Vigo')
WHERE Fixture_ID = 105; -- Specify Fixture_ID as needed

-- Set Stadium_ID based on the Home Team's stadium
UPDATE FIXTURE
SET Stadium_ID = (SELECT Stadium_ID FROM CLUB WHERE CLUB.Club_ID = FIXTURE.Home_Team_ID);

-- Set Referee_ID for each fixture based on Referee assignments
UPDATE FIXTURE
SET Referee_ID = (SELECT Referee_ID FROM REFEREE WHERE Referee_Name = 'Alejandro Muniz Ruiz'); -- Replace with actual referee name

SET SQL_SAFE_UPDATES = 1;

