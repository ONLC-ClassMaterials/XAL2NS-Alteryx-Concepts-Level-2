

WITH "Tool2_fd9a" AS (SELECT * FROM "##AYX0fa3a4d835cf9f07243b2518f8c1448b"), 
"Tool3_e221" AS (SELECT * FROM dbo."FactInternetSales"), 
"Tool4True_887c" AS (SELECT * FROM "Tool3_e221" WHERE "OrderDate" >= '2006-01-01'), 
"Tool5_0e9c" AS (SELECT "Tool2_fd9a"."ProductKey", "Tool2_fd9a"."ProductAlternateKey", "Tool2_fd9a"."ProductSubcategoryKey", "Tool2_fd9a"."WeightUnitMeasureCode", "Tool2_fd9a"."SizeUnitMeasureCode", "Tool2_fd9a"."EnglishProductName", "Tool2_fd9a"."StandardCost", "Tool2_fd9a"."FinishedGoodsFlag", "Tool2_fd9a"."Color", "Tool2_fd9a"."SafetyStockLevel", "Tool2_fd9a"."ReorderPoint", "Tool2_fd9a"."ListPrice", "Tool2_fd9a"."Size", "Tool2_fd9a"."SizeRange", "Tool2_fd9a"."Weight", "Tool2_fd9a"."DaysToManufacture", "Tool2_fd9a"."ProductLine", "Tool2_fd9a"."DealerPrice", "Tool2_fd9a"."Class", "Tool2_fd9a"."Style", "Tool2_fd9a"."ModelName", "Tool2_fd9a"."EnglishDescription", "Tool2_fd9a"."StartDate", "Tool2_fd9a"."EndDate", "Tool2_fd9a"."Status", "Tool4True_887c"."ProductKey" AS "R_ProductKey", "Tool4True_887c"."OrderDateKey", "Tool4True_887c"."DueDateKey", "Tool4True_887c"."ShipDateKey", "Tool4True_887c"."CustomerKey", "Tool4True_887c"."PromotionKey", "Tool4True_887c"."CurrencyKey", "Tool4True_887c"."SalesTerritoryKey", "Tool4True_887c"."SalesOrderNumber", "Tool4True_887c"."SalesOrderLineNumber", "Tool4True_887c"."RevisionNumber", "Tool4True_887c"."OrderQuantity", "Tool4True_887c"."UnitPrice", "Tool4True_887c"."ExtendedAmount", "Tool4True_887c"."UnitPriceDiscountPct", "Tool4True_887c"."DiscountAmount", "Tool4True_887c"."ProductStandardCost", "Tool4True_887c"."TotalProductCost", "Tool4True_887c"."SalesAmount", "Tool4True_887c"."TaxAmt", "Tool4True_887c"."Freight", "Tool4True_887c"."CarrierTrackingNumber", "Tool4True_887c"."CustomerPONumber", "Tool4True_887c"."OrderDate", "Tool4True_887c"."DueDate", "Tool4True_887c"."ShipDate" FROM "Tool2_fd9a" INNER JOIN "Tool4True_887c" ON "Tool2_fd9a"."ProductKey" = "Tool4True_887c"."ProductKey"), 
"Tool13_dd55" AS (SELECT "EnglishProductName" AS "ProductName", "OrderQuantity", "OrderDate" FROM "Tool5_0e9c"), 
"Tool6_7fec" AS (SELECT "ProductName", "OrderQuantity", "OrderDate", (YEAR("OrderDate")) AS "OrderYear" FROM "Tool13_dd55"), 
"Tool7_9c4c" AS (SELECT "ProductName", "OrderYear", SUM("OrderQuantity") AS "Sum_OrderQuantity" FROM "Tool6_7fec" GROUP BY "ProductName", "OrderYear"), 
"Tool8_5ddc" AS (SELECT TOP 10 * FROM "Tool7_9c4c" ORDER BY "Sum_OrderQuantity" DESC) 
SELECT * INTO "ProductSummary" FROM "Tool8_5ddc" AS "a"


