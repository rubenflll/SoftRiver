IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Country') AND type in (N'U'))
BEGIN
CREATE TABLE Country
(
	ID int PRIMARY KEY NOT NULL,
	Description text,

);
END;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'City') AND type in (N'U'))
BEGIN
if OBJECT_ID('SoftRiver.City') is not null
Create table City
(
	ID INT PRIMARY KEY NOT NULL,
	CoutryID int foreign key references Country(ID),
	Description int

);
END;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Travel') AND type in (N'U'))
BEGIN
CREATE TABLE Travel
(
	ID int PRIMARY KEY NOT NULL,
	CoutryID int foreign key references Country(ID),
	CityID int foreign key references City(ID),
	Title text,
	CreateDate datetime,
	StartDate datetime,
	EndDate datetime,
	purpose text,
);
END;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ActionsGoodsTypes') AND type in (N'U'))
BEGIN
CREATE TABLE ActionsGoodsTypes
(
	ID int PRIMARY KEY NOT NULL,
	Descriptions text,
	
);
INSERT INTO ActionsGoodsTypes VALUES
	(1, 'food'),
	(2, 'Water'),
	(1, 'Clothes'),
	(3, 'Toys'),	
	(4, 'tech'),
	(5, 'Guns'),
	(6, 'dippers'),
	(7, 'Others');
END;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Actions') AND type in (N'U'))
BEGIN
CREATE TABLE Actions
(
	CoutryID int foreign key references Country(ID),
	ID int PRIMARY KEY NOT NULL,
	images image,
	Title text,
	ActionDescription text,
	CreateDate datetime,
	StartDate datetime,
	EndDate datetime,
);
END;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ActionRelation') AND type in (N'U'))
BEGIN
CREATE TABLE ActionRelation
(
	ActionsGoodsTypes int foreign key references ActionsGoodsTypes(ID),
	ActionsID int foreign key references Actions(ID),
	ActionID int PRIMARY KEY NOT NULL,
	GoodsTypeID int,
	
);
END;
