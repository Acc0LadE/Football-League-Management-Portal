use database_laliga;

CREATE USER 'pranav gk'@'localhost' IDENTIFIED BY 'nithin';
GRANT ALL PRIVILEGES ON database_laliga.* TO 'pranav gk'@'localhost';


CREATE USER 'sam'@'localhost' IDENTIFIED BY 'fat';
GRANT SELECT ON database_laliga.* TO 'sam'@'localhost';

DROP USER 'sam'@'localhost';
DROP USER 'pranav gk'@'localhost';
