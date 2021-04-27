  ***

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


