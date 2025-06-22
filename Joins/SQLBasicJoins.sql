-- Basic SQL Joins

-- FORMULA:
/*
SELECT [ColumnName1FromTable1], [ColumnName1FromTable2], [ColumnName2FromTable2]
FROM [Table1 t]
JOIN [Table2 v ON t.Column = v.Column]
*/

-- Step 0: It helps to SELECT * FROM the tables you're trying to join --> select to see columns of tables

-- Step 1: Select the columns that you want from both tables with a SELECT statement
	-- VendorName --> Vendor Table
	-- InvoiceDate --> Invoice Table
	-- InvoiceNumber --> Invoice Table

-- Step 2: Specify the main table you want to join on with a FROM statement
	-- In this example i'm joining on the Vendor table
	-- Therefore, that means I have to join on the table that I got InvoiceDate and InvoiceNumber form (Invoice Table)

-- Step 3: Join on the other table not specified in the FROM statement (Invoice Table)
	-- I need to join the Vendor Table to the Invoice Table because I am using columns from those tables
	-- The Vendors table has a VendorID column that it shares with the InvoiceID column on the Invoice Table, thats where I will join on

SELECT * FROM Invoices --Step 0: table 1 --> selecting to see columns of table
SELECT * FROM Vendors -- Step 0: table 2 --> selecting to see columns of table

SELECT VendorName, InvoiceDate, InvoiceNumber -- Step 1 --> selecting necessary columns 
FROM Vendors v -- Step 2 --> specifying main table (table1) from where column(s) are coming from 
JOIN Invoices i ON v.VendorID = i.VendorID -- Step 3 --> specifying table 2 to join on and where to join

----------------------------------------------------------------------
-- EXAMPLE 2:
SELECT InvoiceNumber, LastName, FirstName
FROM Invoices i
JOIN ContactUpdates c ON i.InvoiceID = c.VendorID

----------------------------------------------------------------------
-- EXAMPLE 3:
SELECT InvoiceTotal, VendorName
FROM Invoices i
JOIN Vendors v ON i.VendorID = v.VendorID

----------------------------------------------------------------------
-- EXAMPLE 4:
SELECT InvoiceNumber, InvoiceDate, VendorName, VendorAddress1
FROM Invoices i
JOIN Vendors v ON i.VendorID = v.VendorID
----------------------------------------------------------------------