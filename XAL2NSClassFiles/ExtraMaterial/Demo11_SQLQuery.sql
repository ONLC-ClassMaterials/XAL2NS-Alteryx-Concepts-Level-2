USE [AdventureWorksDW2012]
GO

SET STATISTICS IO ON

-- Without In-DB (Select everything)
select FactProductInventory.*  from FactProductInventory;

-- With In-DB
WITH "Tool7_1f88" AS (select FactProductInventory.*  from FactProductInventory), 
"Tool8True_625d" AS (SELECT * FROM "Tool7_1f88" WHERE "DateKey" = 20070504) 
SELECT TOP 1000 * FROM "Tool8True_625d";

-- Add an Index to DateKey
CREATE NONCLUSTERED INDEX [IX_DateKey] ON [dbo].[FactProductInventory]
(
	[DateKey] ASC
)

GO

-- Add an Index with included columns
CREATE NONCLUSTERED INDEX [IX_DateKey_IC] ON [dbo].[FactProductInventory]
(
	[DateKey] ASC
)
INCLUDE([ProductKey],[MovementDate],[UnitCost],[UnitsIn],[UnitsOut],[UnitsBalance])

GO


-- Cleanup
DROP INDEX [IX_DateKey] ON [dbo].[FactProductInventory]
DROP INDEX [IX_DateKey_IC] ON [dbo].[FactProductInventory]
GO

SET STATISTICS IO OFF
