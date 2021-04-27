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

INSERT INTO JOB (location, url, salary) VALUES ('Київ', 'https://', 200);
INSERT INTO JOB (location, url, salary) VALUES ('Львів', 'http://', 400);
INSERT INTO JOB (location, url, salary) VALUES ('Дніпро', 'https://', 600);

INSERT INTO JOB_TEXT  VALUES (1, 'Работа в Києві');
INSERT INTO JOB_TEXT  VALUES (2, 'Работа в Львові');
INSERT INTO JOB_TEXT  VALUES (3, 'Работа в Дніпрі');

--Написать SQL-запрос, который будет выводить url и description записей, у которых location это Киев или Львов.
SELECT JOB.url, JOB_TEXT.description FROM JOB, JOB_TEXT
WHERE JOB.location In ('Київ', 'Львів') and JOB_TEXT.id_job = JOB.id;

