# sql-server-101

Az adatbázis, amit használunk: WorldWideImporters
https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/wide-world-importers#about-this-sample
---

Restore TSQL:
```sql
USE [master]
RESTORE DATABASE [WideWorldImporters] 
FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\WideWorldImporters-Full.bak' 
WITH  FILE = 1,  
MOVE N'WWI_Primary' TO N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WideWorldImporters.mdf',  
MOVE N'WWI_UserData' TO N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WideWorldImporters_UserData.ndf',  
MOVE N'WWI_Log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WideWorldImporters.ldf',  
MOVE N'WWI_InMemory_Data_1' TO N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WideWorldImporters_InMemory_Data_1',  
NOUNLOAD,  
REPLACE,  
STATS = 5
```

ACID elvek
