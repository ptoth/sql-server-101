# 1. nap – Alapok áttekintése + összetettebb SELECT-ek

## Téma: Ismétlés + haladó lekérdezések

Tábla: Az adatbázis alapvető szerkezeti egysége, amely sorokból és oszlopokból áll. Egy tábla egy adott típusú adatot tárol, például ügyfelek vagy rendelések adatait.

Rekord: A tábla egy sora, amely egy adott entitás (például egy ügyfél vagy egy rendelés) adatait tartalmazza. Minden rekord egyedi azonosítóval (pl. elsődleges kulcs) rendelkezhet.

Attribútum: A tábla egy oszlopa, amely egy adott tulajdonságot vagy jellemzőt ír le. Például egy ügyféltábla attribútumai lehetnek: név, cím, telefonszám.


### A) Rövid ismétlés

- Adatbázis fogalma, tábla létrehozás (`CREATE TABLE`)
- Alap SQL parancsok: `SELECT`, `INSERT`, `UPDATE`, `DELETE`
- Szűrés: `WHERE`, `LIKE`, `BETWEEN`, `IN`
- Rendezés: `ORDER BY`, lekérdezés limitálása: `TOP`

**Minta lekérdezések (WorldWideImporters):**
```sql
-- Egyszerű SELECT
SELECT * FROM Sales.Customers;

-- Új vevő beszúrása
INSERT INTO Sales.Customers (
    CustomerName,BillToCustomerID,CustomerCategoryID,PrimaryContactPersonID,AccountOpenedDate,DeliveryMethodID,PostalCityID
)
VALUES (
    'Teszt Vevő', 1, 1, 1, GETDATE(), 1, 1
);
-- Vevő adatainak módosítása
UPDATE Sales.Customers SET CustomerName = 'Teszt Vevő 2' WHERE CustomerID = 1;

-- Vevő törlése
DELETE FROM Sales.Customers WHERE CustomerID = 1;

-- Szűrés WHERE-rel
SELECT * FROM Sales.Customers WHERE CustomerCategoryID = 2;

-- LIKE használata
SELECT * FROM Sales.Customers WHERE CustomerName LIKE 'A%';

-- BETWEEN
SELECT * FROM Sales.Invoices WHERE InvoiceDate BETWEEN '2016-01-01' AND '2016-12-31';

-- IN
SELECT * FROM Sales.Customers WHERE CustomerCategoryID IN (1,2);

-- Rendezés
SELECT * FROM Sales.Customers ORDER BY CustomerName;

-- TOP
SELECT TOP 5 * FROM Sales.Customers ORDER BY CustomerID DESC;
```

### B) Haladó SELECT használata

- Egyedi értékek: `DISTINCT`
- Átnevezés: `ALIAS` (`AS`)
- Összetett feltételek: `AND`, `OR`, `NOT`
- Beágyazott lekérdezések: **subquery**
- Feltételes szerkezet: `CASE`

**Minta lekérdezések (WorldWideImporters):**
```sql
-- DISTINCT
SELECT DISTINCT CustomerCategoryID FROM Sales.Customers;

-- ALIAS
SELECT CustomerName AS 'Vevő neve', CustomerID AS 'Azonosító' FROM Sales.Customers;

-- Összetett feltételek
SELECT * FROM Sales.Customers WHERE CustomerCategoryID = 1 AND CustomerName LIKE 'B%';

-- Subquery
SELECT CustomerName FROM Sales.Customers WHERE CustomerID IN (
    SELECT CustomerID FROM Sales.Invoices WHERE TotalAmount > 1000
);

-- CASE szerkezet
SELECT CustomerName,
    CASE WHEN CustomerCategoryID = 1 THEN 'Kiemelt'
         WHEN CustomerCategoryID = 2 THEN 'Normál'
         ELSE 'Egyéb'
    END AS Kategória
FROM Sales.Customers;
```

### C) Csoportosítás (GROUP BY, HAVING)

- Aggregáló függvények: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- Szűrés aggregált értékekre: `HAVING`

**Minta lekérdezések (WorldWideImporters):**
```sql
-- COUNT
SELECT CustomerCategoryID, COUNT(*) AS VevőkSzáma FROM Sales.Customers GROUP BY CustomerCategoryID;

-- SUM
SELECT CustomerID, SUM(TotalAmount) AS OsszesVasarlas FROM Sales.Invoices GROUP BY CustomerID;

-- AVG
SELECT CustomerID, AVG(TotalAmount) AS AtlagVasarlas FROM Sales.Invoices GROUP BY CustomerID;

-- MIN/MAX
SELECT CustomerID, MIN(TotalAmount) AS Legkisebb, MAX(TotalAmount) AS Legnagyobb FROM Sales.Invoices GROUP BY CustomerID;

-- HAVING
SELECT CustomerID, SUM(TotalAmount) AS OsszesVasarlas
FROM Sales.Invoices
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 5000;
```

### Gyakorlat

- Lekérdezések készítése iskolai vagy bolt adatbázisra
    - Példák: osztályátlagok, tanulók teljesítménye, kategóriánkénti termékeladás stb.

**Gyakorlati példák (WorldWideImporters):**
```sql
-- Kategóriánkénti termékeladás (Sales.StockItemStockGroups)
SELECT sg.StockGroupName, COUNT(*) AS TermekSzam
FROM Sales.StockItemStockGroups sig
JOIN Warehouse.StockGroups sg ON sig.StockGroupID = sg.StockGroupID
GROUP BY sg.StockGroupName;

-- Vevők átlagos vásárlása
SELECT c.CustomerName, AVG(i.TotalAmount) AS AtlagVasarlas
FROM Sales.Customers c
JOIN Sales.Invoices i ON c.CustomerID = i.CustomerID
GROUP BY c.CustomerName;

-- Legnagyobb vásárló
SELECT TOP 1 c.CustomerName, SUM(i.TotalAmount) AS OsszesVasarlas
FROM Sales.Customers c
JOIN Sales.Invoices i ON c.CustomerID = i.CustomerID
GROUP BY c.CustomerName
ORDER BY OsszesVasarlas DESC;
```

---
