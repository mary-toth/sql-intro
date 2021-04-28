-- HOMEWORK PART 1

CREATE TABLE "Employees" (
	"FullName" 		  	TEXT,
  "Salary"			    INT,
  "JobPosition"		  TEXT,
	"PhoneExtension"	INT,
  "IsPartTime" 		  TEXT
  );


INSERT INTO "Employees" ("FullName", "Salary", "JobPosition","PhoneExtension", "IsPartTime")
VALUES ('Keanu Reeves', 42000, 'Manager', 123, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', 28000, 'Secretary', 345, 'Yes');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Gauis Baltar', 12000, 'President', 567, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Astra Taylor', 37000, 'Cook', 890, 'No');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Napoleon Dynamite', 50000, 'Cook', 321, 'Yes');


SELECT * FROM "Employees";


SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'No';


INSERT INTO "Employees" ("FullName", "Salary", "JobPosition","PhoneExtension", "IsPartTime")
VALUES ('Mary Toth', 450, 'Software Developer', 352, 'Yes');



UPDATE "Employees" SET "Salary" = 500 WHERE "JobPosition" = 'Cook';


DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';


ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);

*** Adventure mode? ***

ALTER TABLE "Employees" ADD COLUMN "ID" SERIAL PRIMARY KEY

*If I wanted to recreate my database and use "not null", I would do this:

DROP TABLE = "Employees";

CREATE TABLE "Employees" (
	"FullName" 		  	TEXT NOT NULL,
  "Salary"			    INT NOT NULL,
  "JobPosition"		  TEXT NOT NULL,
	"PhoneExtension"	INT,
  "IsPartTime" 		  TEXT
  );

  -- HOMEWORK PART 2

  CREATE TABLE "Departments" (
  "ID" SERIAL PRIMARY KEY, 
  "DepartmentName" TEXT,
  "Building" TEXT 
  );

-- add foreign key 

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("ID");

-- create products table

CREATE TABLE "Products" (
  "ID" SERIAL PRIMARY KEY,
  "Price" NUMERIC,
  "Name" TEXT,
  "Description" TEXT,
  "QuantityInStock" INT
 );

-- create orders table 

CREATE TABLE "Orders" (
  "ID" SERIAL PRIMARY KEY,
  "OrderNumber" TEXT,
  "DatePlaced" DATE,
  "Email" TEXT
  );

  -- creating product orders table

  CREATE TABLE "ProductOrders" (
  "ID" SERIAL PRIMARY KEY,
  "OrderID" INTEGER REFERENCES "Orders" ("ID"),
  "ProductID" INTEGER REFERENCES "Products" ("ID"),
  "OrderQuantity" INT
  );

-- insert into Departments

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Development', 'Main');

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Marketing', 'North');

-- insert into Employees

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "ParkingSpot", "DepartmentID")
VALUES ('Tim Smith', 40000, "Programmer", 123, "No", 18, 1);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "ParkingSpot", "DepartmentId")
VALUES ('Barbara Ramsey', 80000, 'Manager', 234, 'No', 45, 1);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "ParkingSpot", "DepartmentId")
VALUES ('Tom Jones', 32000, 'Admin', 456, 'Yes', 38, 2);

-- insert into products

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES (12.45, 'Widget', 'The Original Widget', 100);

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES (99.99, 'Flowbee', 'Perfect for haircuts', 3);

-- insert into orders

INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email")
VALUES ('X529', '2020-01-01 16:55:00', 'person@example.com');

-- add an order quantity of 3 to Widget and X529

INSERT INTO "ProductOrders" ("OrderQuantity", "OrderID", "ProductID") VALUES (3, 1, 1);

-- add an order quantity of 2 to the product flowebee and order number X529

INSERT INTO "ProductOrders" ("OrderQuantity", "OrderID", "ProductID") VALUES (2, 1, 2);

-- show employees that work in a specific building 

SELECT * 
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."ID"
WHERE "Departments"."Building" = 'North Side';

SELECT * 
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."ID"
WHERE "Departments"."Building" = 'Main';

-- show orders with an ID of 2

SELECT *
FROM "Orders"
WHERE "Orders"."ID" = 2;

-- show quantity of flowbee product and order # X529

SELECT *
FROM "ProductOrders"
JOIN "Products" ON "ProductOrders"."OrderID" = "Products"."ID"
JOIN "Orders" ON "ProductOrders"."ProductID" = "Orders"."ID"
WHERE "Products"."Name" = 'Flowbee' AND "Orders"."OrderNumber" = 'X529';