CREATE TABLE JOB
(
    ID integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    LOCATION varchar NOT NULL,
    URL varchar NOT NULL,
    SALARY double precision NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE JOB_TEXT
(
    ID_JOB integer NOT NULL REFERENCES JOB(ID),
    DESCRIPTION text
);

INSERT INTO JOB (location, url, salary) VALUES ('Киев', 'https://', 200);
INSERT INTO JOB (location, url, salary) VALUES ('Львов', 'http', 400);
INSERT INTO JOB (location, url, salary) VALUES ('Днепр', 'tcp', 600);

INSERT INTO JOB_TEXT  VALUES (1, 'Работа в Киеве');
INSERT INTO JOB_TEXT  VALUES (2, 'Работа в Львове');
INSERT INTO JOB_TEXT  VALUES (3, 'Работа в Днепре');

--Написать SQL-запрос, который будет выводить url и description записей, у которых location это Киев или Львов.
SELECT JOB.url, JOB_TEXT.description FROM JOB, JOB_TEXT
WHERE JOB.location In ('Киев', 'Львов') and JOB_TEXT.id_job = JOB.id;

