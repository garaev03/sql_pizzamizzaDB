CREATE DATABASE PizzaMizzaDB
USE PizzaMizzaDB

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) UNIQUE NOT NULL
)

select * from categories order by id
CREATE TABLE Pizzas(
Id INT PRIMARY KEY IDENTITY,
CategoryID INT REFERENCES Categories(Id),
Name NVARCHAR(50) UNIQUE NOT NULL
)

------------------------------  INGREDIENTS
CREATE TABLE Ingredients(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE PizzaIngredients(
Id INT PRIMARY KEY IDENTITY,
PizzaID INT REFERENCES Pizzas(Id),
IngredientID INT REFERENCES Ingredients(Id),
)

------------------------------  PRICES AND SIZES
CREATE TABLE Sizes(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) UNIQUE NOT NULL,
Size INT UNIQUE NOT NULL
)

CREATE TABLE Prices(
Id INT PRIMARY KEY IDENTITY,
Price DECIMAL(10,2) NOT NULL,
PizzaID INT REFERENCES Pizzas(Id),
SizeID INT REFERENCES Sizes(Id)
)

------------------------------  IMAGES
CREATE TABLE Images(
Id INT PRIMARY KEY IDENTITY,
Image Image
)

CREATE TABLE PizzaImages(
Id INT PRIMARY KEY IDENTITY,
PizzaID INT REFERENCES Pizzas(Id),
ImageID INT REFERENCES Images(Id),
)

------------------------------  Types
CREATE TABLE [Types](
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30) UNIQUE NOT NULL
)

CREATE TABLE PizzaTypes(
Id INT PRIMARY KEY IDENTITY,
PizzaID INT REFERENCES Pizzas(Id),
TypeID INT REFERENCES [Types](Id),
)

---------------------------------------------- VALUE INSERT FIELD

INSERT INTO Categories VALUES ('Pizzas')

INSERT INTO Pizzas VALUES 
(1,'Marqarita'),(1,'Vegeterian'),(1,'Fungi Kon'),
(1,'Speciale'),(1,'Mista'),(1,'Salyami'),(1,'Klassiko'),
(1,'Havay'),(1,'Texas'),(1,'Ciken Strips'),(1,'Meksikana'),
(1,'Tonno e Cippola'),(1,'Bes Pendir'),(1,'Volkano'),
(1,'Sucuk'),(1,'Amerikana'),(1,'Dord Fesil'),(1,'Delyuks'),
(1,'Mitlovers'),(1,'MeqaMiks')
select * from pizzas
INSERT INTO Ingredients VALUES 
('Sous'),('Gouda pendiri'),('Mozorella pendiri'),('Pomidor'),('Ispanaq'),
('Qirmizi sogan'),('Bolqar biberi'),('Gobelek'),('Toyuq filesi'),('Vetcina(halal)'),
('Salyami kolbasasi(halal)'),('Pepperoni biberi'),('Qargidali'),('Barbekyu Sousu'),
('Toyug nuggetsleri'),('Halapenyo biberi'),('Ton baligi'),('Ricotta pendiri'),
('Parmezan pendir'),('Kartof Fri'),('Duzlu xiyar'),('Sosiska'),('Oreqano'),('Dana basdirmasi')

INSERT INTO PizzaIngredients VALUES 
(1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,5),(2,6),(2,7),(2,8),(3,1),(3,2),(3,8),(3,9),
(4,1),(4,2),(4,9),(4,6),(5,1),(5,2),(5,8),(5,10),(5,11),(6,1),(6,2),(6,11),(7,1),(7,2),(7,11),(7,8),(7,12),
(8,1),(8,2),(8,10),(9,1),(9,2),(9,9),(9,7),(9,13),(9,6),(10,14),(10,2),(10,15),(10,13),(10,7),(11,1),(11,2),
(11,9),(11,6),(11,5),(11,16),(11,12),(12,1),(12,2),(12,17),(12,6),(13,1),(13,2),(13,18),(13,19),(14,1),(14,2),
(14,5),(14,6),(14,7),(14,4),(14,8),(14,9),(15,1),(15,2),(15,7),(15,8),(16,14),(16,2),(16,22),(16,20),(16,21),
(17,1),(17,2),(17,10),(17,8),(17,4),(17,23),(18,1),(18,2),(18,6),(18,12),(18,24),(19,1),(19,2),(19,9),(19,24),
(19,11),(19,10),(20,1),(20,2),(20,4),(20,7),(20,8),(20,11),(20,10),(20,24)

INSERT INTO Sizes VALUES ('Kicik',25),('Orta',30),('Boyuk',35)

INSERT INTO Prices VALUES
(7.90 ,1,1),(11.90 ,1,2),(14.90 ,1,3),(8.90 ,2,1),(12.90 ,2,2),(15.90 ,2,3),(9.90 ,3,1),(14.90 ,3,2),(18.90 ,3,3),
(9.90 ,4,1),(14.90 ,4,2),(18.90 ,4,3),(9.90 ,5,1),(14.90 ,5,2),(18.90 ,5,3),(9.90 ,6,1),(14.90 ,6,2),(18.90 ,6,3),
(9.90 ,7,1),(14.90 ,7,2),(18.90 ,7,3),(9.90 ,8,1),(14.90 ,8,2),(18.90 ,8,3),(9.90 ,9,1),(14.90 ,9,2),(18.90 ,9,3),
(10.90 ,10,1),(15.90 ,10,2),(20.90 ,10,3),(10.90 ,11,1),(15.90 ,11,2),(20.90 ,11,3),(10.90 ,12,1),(15.90 ,12,2),(20.90 ,12,3),
(11.90 ,13,1),(16.90 ,13,2),(21.90 ,13,3),(11.90 ,14,1),(16.90 ,14,2),(21.90 ,14,3),(11.90 ,15,1),(16.90 ,15,2),(21.90 ,15,3),
(11.90 ,16,1),(16.90 ,16,2),(21.90 ,16,3),(16.90 ,17,2),(11.90 ,18,1),(16.90 ,18,2),(21.90 ,18,3),
(12.90 ,19,1),(18.90 ,19,2),(24.90 ,19,3),(12.90 ,20,1),(18.90 ,20,2),(24.90 ,20,3)

INSERT INTO Images VALUES
('https://pizzamizza.az/upload/iblock/f87/f87e770b152b9410cf45ac22e788c166.jpg?1627503833160765'),
('https://pizzamizza.az/upload/iblock/05c/05c1187c21bea988b38e31089dfec366.jpg?1617617212111349'),
('https://pizzamizza.az/upload/iblock/f23/f238ce28ac3c02d5d6a82a80249f9a48.jpg?1617617212114168'),
('https://pizzamizza.az/upload/iblock/b30/b30d1e5de4821be1816d952c60800e1b.jpg?1617617212118957'),
('https://pizzamizza.az/upload/iblock/ef1/ef101bab9b1423ec8fab06c27a418082.jpg?1617617212117790'),
('https://pizzamizza.az/upload/iblock/78f/78fa03fdf9fd41c1c8686bb656c876f7.jpg?1617617212117680'),
('https://pizzamizza.az/upload/iblock/e6a/e6a10ca8f8b45597f5ad4d0121a7124c.jpg?1617617212120470'),
('https://pizzamizza.az/upload/iblock/217/2172b1984ffb2c10f941bd013c2d8ab5.jpg?161761721299801'),
('https://pizzamizza.az/upload/iblock/bb9/bb95f54208c5251eb47e8b2ac9a1b4f8.jpg?1617617212115139'),
('https://pizzamizza.az/upload/iblock/6f5/6f5d4cdf454946331725eae7b571a6e9.jpg?1617617212113510'),
('https://pizzamizza.az/upload/iblock/f59/f59ed0dec6a9812b3b48a6fd32d32f76.jpg?1617617212127733'),
('https://pizzamizza.az/upload/iblock/25b/25b196d4ab93aa3c0673528905160bd7.jpg?1617617212112757'),
('https://pizzamizza.az/upload/iblock/48b/48b88633d5cbd7ddf725296af5872e48.jpg?164461281293741'),
('https://pizzamizza.az/upload/iblock/f9b/f9b422166ecc815fa1b933687d827a7b.jpg?1627503872146529'),
('https://pizzamizza.az/upload/iblock/c61/c61bf5db270163775e10888b065c8780.jpg?1619855981147292'),
('https://pizzamizza.az/upload/iblock/2d4/2d42014a85efcde85f020c2071c5551e.jpg?1632152460123364'),
('https://pizzamizza.az/upload/iblock/a4e/a4eab620f903bfb59ec4dcdd2b02da14.jpg?1627763854145846'),
('https://pizzamizza.az/upload/iblock/a5c/a5caf468eb263c9cea81d3db170c6f8d.jpg?1617617212120265'),
('https://pizzamizza.az/upload/iblock/610/61064ba50ed4b7d043399da0eade0c90.jpg?1617617212114550'),
('https://pizzamizza.az/upload/iblock/4be/4be04fd170efd12b777fd8d8fe8e4125.jpg?1617617212121453')

INSERT INTO PizzaImages VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20)

INSERT INTO [Types] VALUES
('Halal'),('Vegeterian'),('Acili')

INSERT INTO PizzaTypes VALUES
(1,2),(2,2),(5,1),(6,1),(7,1),(7,3),(8,1),(11,3),(13,2),(15,1),(16,1),(17,1),(18,3),(19,1),(20,1)

------------------------------------------------------------------------------------------------- 
---------------------------------------------------------------------------- Views And Procedures 
GO

CREATE VIEW AllPizzas
AS
SELECT p.id, p.Name AS 'Pizza Name', pr.Price, s.Name AS 'Size', t.id as 'type id',t.Name AS 'Type',i.id as 'ingid', i.Name AS 'Ingredients'
FROM PIZZAS AS p

LEFT JOIN Prices AS pr
ON p.Id=pr.PizzaID
LEFT JOIN Sizes As s
ON pr.SizeID=s.Id

LEFT JOIN PizzaTypes AS pt
ON p.Id=pt.PizzaID
LEFT JOIN [Types] AS t
On t.Id=pt.TypeID

LEFT JOIN PizzaIngredients AS pin
ON pin.PizzaID=p.Id
left JOIN Ingredients AS i
ON i.Id=pin.IngredientID

LEFT JOIN PizzaImages As pim
ON pim.PizzaID=p.Id
GROUP BY p.id,p.name,pr.Price,s.name,t.id,t.Name,i.id,i.name
GO

drop view AllPizzas

CREATE PROCEDURE GetPizzaPrices @Id INT
AS
SELECT Size,Price FROM AllPizzas WHERE Id=@Id
GROUP BY Size,Price
ORDER BY Price

GO

CREATE PROCEDURE LittleInfoAboutPizzas @Id INT
AS
SELECT p.id, p.Name AS 'Pizza Name', pr.Price, s.Name AS 'Size', t.Name AS 'Type' 
FROM PIZZAS AS p

JOIN Prices AS pr
ON p.Id=pr.PizzaID

JOIN Sizes As s
ON pr.SizeID=s.Id

LEFT JOIN PizzaTypes AS pt
ON p.Id=pt.PizzaID
LEFT JOIN [Types] AS t
On t.Id=pt.TypeID

JOIN PizzaIngredients AS pin
ON pin.PizzaID=p.Id
WHERE p.id=@Id
GROUP BY p.id, p.Name, pr.Price, s.Name , t.Name 

GO 

------------------------------------------------------------------------------------------------- 
insert into pizzas values (1,'PapaJohns')
insert into prices values (7.90,21,1),(14.90,21,2),(18.90,21,3)
insert into PizzaTypes values(21,1)
insert into PizzaIngredients values(21,1)

select ingid,Ingredients from AllPizzas where id=7
group by ingid,Ingredients
order by ingid


select * from pizzas 
delete from pizzas where id=30
delete from PizzaIngredients where pizzaid=28
delete from prices where pizzaid=28
delete from PizzaTypes where PizzaID=28



select * from Ingredients order by id

select * from sizes 

select * from types order by id

EXEC GetPizzaPrices @Id=1
 
 EXEC LittleInfoAboutPizzas @id=1 
select id from sizes order by id


select * from types order by id	
delete from PizzaIngredients where pizzaid=25

 select name from prices
delete from prices where pizzaid=25

 select * from pizzatypes
delete from pizzatypes where pizzaid=25

