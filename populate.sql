-- auto-generated definition
create table tuote
(
    tuotenro integer
        primary key,
    nimi     text not null,
    hinta    numeric,
    maara    integer,
    tyyppi   text
);

-- auto-generated definition
create table asiakas
(
    asiakasnro     integer
        primary key,
    nimi   text,
    sposti text,
    puhnro text,
    osoite text
);

-- auto-generated definition
create table tilaus
(
    tilausnro  integer
        primary key,
    sisainen   text  not null CHECK (sisainen IN ('Kyllä', 'Ei')),
    tila       text not null CHECK (tila IN ('maksamaton', 'keräilyssä', 'valmis')),
    hinta      integer,
    asiakasnro integer,

    FOREIGN KEY (asiakasnro) REFERENCES asiakas(asiakasnro)
);

-- auto-generated definition
create table tilausrivi
(
    rivinro   integer not null,
    tilausnro integer
        references tilaus,
    maara     integer not null,
    tuotenro  integer
        references tuote,
    primary key(rivinro, tilausnro)
);

-- auto-generated definition
create table yhteistilaus
(
    asiakasnro integer not null
        references asiakas,
    tilausnro  integer not null
        references tilaus,
    primary key (asiakasnro, tilausnro)
);

INSERT INTO asiakas(nimi, sposti, puhnro, osoite) VALUES('Paavo', 'paavo@github.fi', '123045671', 'Vesilinnantie 5');
INSERT INTO asiakas(nimi, sposti, puhnro, osoite) VALUES('Yennefer of Vengerberg', 'yenn@lodge.com', '12121212', 'Thanedd isle');
INSERT INTO asiakas(nimi, sposti, puhnro, osoite) VALUES('Geralt of Rivia', null, null, 'Kaer Morhen');
INSERT INTO asiakas(nimi, sposti, puhnro, osoite) VALUES('Emiel Regis Rohellec Terzieff-Godefroy', 'regis@cont.com', '000007', 'Fen Caern');

INSERT INTO tilaus VALUES(null,'Kyllä','maksamaton',2000, 1);
INSERT INTO tilausrivi VALUES(1, 1, 2, 1);
INSERT INTO tilausrivi VALUES(2, 1, 2, 2);
INSERT INTO tilausrivi VALUES(3, 1, 1, 1);
INSERT INTO tilausrivi VALUES(4, 1, 4, 1);

INSERT INTO tilaus VALUES(null,'Ei','valmis',2342, 2);
INSERT INTO tilausrivi VALUES(1, 2, 5, 3);
INSERT INTO tilausrivi VALUES(2, 2, 5, 1);
INSERT INTO tilausrivi VALUES(3, 2, 12, 4);
INSERT INTO tilausrivi VALUES(4, 2, 22, 2);

INSERT INTO tilaus VALUES(null,'Ei','maksamaton',2342, 3);
INSERT INTO tilausrivi VALUES(1, 3, 5, 3);
INSERT INTO tilausrivi VALUES(2, 3, 5, 1);
INSERT INTO tilausrivi VALUES(3, 3, 12, 4);
INSERT INTO tilausrivi VALUES(4, 3, 22, 2);

INSERT INTO tilaus VALUES(null,'Ei','keräilyssä',234222, 4);
INSERT INTO tilausrivi VALUES(1, 4, 5, 3);
INSERT INTO tilausrivi VALUES(2, 4, 5, 1);


INSERT INTO tilaus VALUES(null,'Ei','maksamaton',42, 1);
INSERT INTO tilausrivi VALUES(1, 5, 5, 3);
INSERT INTO tilausrivi VALUES(2, 5, 5, 1);
INSERT INTO tilausrivi VALUES(3, 5, 12, 4);

INSERT INTO tilaus VALUES(null,'Ei','maksamaton',4, 3);
INSERT INTO tilausrivi VALUES(1, 6, 5, 1);
INSERT INTO tilausrivi VALUES(2, 6, 5, 1);
INSERT INTO tilausrivi VALUES(3, 6, 12, 4);
INSERT INTO tilausrivi VALUES(4, 6, 22, 2);
INSERT INTO tilausrivi VALUES(5, 6, 22, 2);

INSERT INTO tilaus VALUES(null, 'Kyllä', 'valmis', 32, 2);
INSERT INTO tilausrivi VALUES(4, 7, 22, 2);
INSERT INTO tilausrivi VALUES(5, 7, 22, 2);

INSERT INTO tuote VALUES(null,'Witcher 3', 25.5, 100, 'Videopeli');
INSERT INTO tuote VALUES(null,'Cyberpunk 2077', 40, 122, 'Videopeli');
INSERT INTO tuote VALUES(null,'Tulikaste', 30, 50, 'Kirja');
INSERT INTO tuote VALUES(null,'Playstation 5', 499, 146, 'Konsoli');

INSERT INTO yhteistilaus VALUES(1,5);
insert into yhteistilaus values(4,5);
insert into yhteistilaus values(2,5);