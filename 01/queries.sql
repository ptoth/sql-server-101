-- SELECT lekérdezés
SELECT <Melyik oszlopoket>
FROM <Melyik táblá(k)ból>
WHERE <Milyen feltétel alapján>;

-- INSERT lekérdezés
INSERT INTO <Melyik táblába>
    (<milyen oszlopokba>)
VALUES
    (<milyen értékeket>);

-- UPDATE lekérdezés (egy oszlop)
UPDATE <Melyik táblát>
SET
    <oszlop> = <érték>
WHERE
    <Feltétel>;

-- UPDATE lekérdezés (több oszlop)
UPDATE <Melyik táblát>
SET
    <oszlop> = <érték>,
    <oszlop2> = <érték2>,
    <oszlop3> = <érték3>
WHERE
    <Feltétel>;

-- Példa SELECT lekérdezések
SELECT *
FROM [WideWorldImporters].[Sales].[Orders]
WHERE
    OrderDate >= '2013-12-20' AND
    OrderDate <= '2013-12-24';

SELECT *
FROM [WideWorldImporters].[Sales].[Orders]
WHERE
    OrderDate BETWEEN '2013-12-20' AND '2013-12-24';

-- LIKE használata
SELECT *
FROM [WideWorldImporters].[Application].[People]
WHERE
    FullName LIKE 'eva%'; -- az elején szerepel, hogy "eva", utána bármi lehet

SELECT *
FROM [WideWorldImporters].[Application].[People]
WHERE
    FullName LIKE '%eva'; -- a végén szerepel, hogy "eva", előtte bármi lehet

SELECT *
FROM [WideWorldImporters].[Application].[People]
WHERE
    FullName LIKE '%eva%'; -- bárhol lehet benne, hogy "eva"

-- IN használata
SELECT *
FROM [WideWorldImporters].[Sales].[Invoices]
WHERE
    CustomerID IN (575, 910, 811); -- csak numerikus értékekre működik

-- Nevesített értékek használata:
SELECT [ProductID] AS 'Termék azonosító'
      ,[Name] AS Név
      ,[StandardCost]
      ,[ListPrice]
      ,[DaysToManufacture] + 7 AS 'Várható Gyártási idő'
  FROM [AdventureWorks2022].[Production].[Product]

