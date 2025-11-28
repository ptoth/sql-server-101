-- =================================================================================
-- Táblák létrehozása
-- =================================================================================

-- felhasznalo tábla
CREATE TABLE felhasznalo (
    id INT PRIMARY KEY, -- A regisztrált felhasználó azonosítója
    veznev NVARCHAR(255) NOT NULL, -- A felhasználó vezetékneve
    utonev NVARCHAR(255) NOT NULL, -- A felhasználó utóneve
    email NVARCHAR(255) NOT NULL, -- A felhasználó e-mail-címe
    utolso DATE -- Az utolsó hozzászólás dátuma
);

-- hirfolyam tábla
CREATE TABLE hirfolyam (
    id INT PRIMARY KEY, -- A hírfolyam azonosítója
    megnevezes NVARCHAR(255) NOT NULL, -- A hírfolyam címe, témája
    moderator INT NOT NULL, -- A moderátor azonosítója
    CONSTRAINT FK_hirfolyam_moderator FOREIGN KEY (moderator) REFERENCES felhasznalo(id)
);

-- uzenet tábla
CREATE TABLE uzenet (
    id INT PRIMARY KEY, -- Az üzenet azonosítója
    tartalom NVARCHAR(255) NOT NULL, -- Az üzenet szövegének rövid részlete
    f_id INT NOT NULL, -- Az üzenet küldőjének azonosítója
    h_id INT NOT NULL, -- Az üzenet hírfolyamának azonosítója
    kuldido DATETIME NOT NULL, -- Az üzenet küldésének időpontja
    CONSTRAINT FK_uzenet_f_id FOREIGN KEY (f_id) REFERENCES felhasznalo(id),
    CONSTRAINT FK_uzenet_h_id FOREIGN KEY (h_id) REFERENCES hirfolyam(id)
);

-- =================================================================================
-- Adatok beszúrása a felhasznalo táblába
-- =================================================================================
INSERT INTO felhasznalo (id, veznev, utonev, email, utolso) VALUES
(1, 'Kovács', 'János', 'janos.kovacs@example.com', '2025-11-20'),
(2, 'Nagy', 'Anna', 'anna.nagy@example.com', '2025-11-25'),
(3, 'Szabó', 'Péter', 'peter.szabo@example.com', '2025-11-15');

-- forum nélkül felhasználó beszúrása:
INSERT INTO felhasznalo (id, veznev, utonev, email, utolso) VALUES
(4, 'Gipsz', 'Jakab', 'janos.kovacs@example.com', '2025-11-20')

-- Adatok beszúrása a hirfolyam táblába
INSERT INTO hirfolyam (id, megnevezes, moderator) VALUES
(1, 'Kerékpáros KRESZ', 1),
(2, 'Túrakerékpár', 2),
(3, 'Hegyi kerékpározás', 3);

-- =================================================================================
-- külső kulcs megkötés eldobása, hogy be tudjuk szúrni az "árva" rekordot
-- =================================================================================
ALTER TABLE [dbo].[hirfolyam] DROP CONSTRAINT [FK_hirfolyam_moderator]
-- árva fórumtéma beszúrás (nem létező moderátorral)
INSERT INTO hirfolyam (id, megnevezes, moderator) VALUES
(4, 'Kerékpáros KRESZ', 99)

-- Adatok beszúrása az uzenet táblába
INSERT INTO uzenet (id, tartalom, f_id, h_id, kuldido) VALUES
(1, 'Üdv mindenkinek!', 1, 1, '2025-11-28 08:30:00'),
(2, 'Mikor lesz a következő túra?', 2, 2, '2025-11-28 09:15:00'),
(3, 'Nagyszerű cikk a KRESZ-ről!', 3, 1, '2025-11-28 10:00:00');

-- =================================================================================
-- JOIN példák
-- =================================================================================
-- inner join
SELECT h.[megnevezes],
        f.veznev,
        f.utonev,
        f.email
  FROM [test].[dbo].[hirfolyam] h
  INNER JOIN dbo.felhasznalo f ON h.moderator = f.id
  
-- left join, listázzunk ki minden felhasználót, és ha van, kapcsoljuk hozzá a forumtémát
SELECT f.id, veznev, utonev, h.megnevezes
FROM dbo.felhasznalo f
LEFT JOIN hirfolyam h ON f.id = h.moderator

-- right join, listázzunk ki minden fórumtémát, akkor is, ha már törölt a felhasználója (árva fórum)
SELECT f.id, veznev, utonev, h.megnevezes
FROM dbo.felhasznalo f
RIGHT JOIN hirfolyam h ON f.id = h.moderator