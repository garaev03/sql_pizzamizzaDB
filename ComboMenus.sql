USE PizzaMizzaDB
CREATE TABLE ComboMenus(
Id INT PRIMARY KEY IDENTITY,
CategoryID INT REFERENCES Categories(Id),
Name NVARCHAR(50) UNIQUE NOT NULL,
withPizza CHAR(1) CHECK(withPizza='T' OR withPizza='F') DEFAULT'F' NULL 
)

CREATE TABLE ComboWithPizza(
Id INT PRIMARY KEY IDENTITY,
ComboId INT REFERENCES ComboMenus(Id),
PizzaId INT REFERENCES Pizzas(Id)
)

CREATE TABLE ComboPrice(
Id INT PRIMARY KEY IDENTITY,
Price DECIMAL(10,2) NOT NULL,
ComboId INT REFERENCES ComboMenus(Id)
)

CREATE TABLE ComboImages(
Id INT PRIMARY KEY IDENTITY,
ComboID INT REFERENCES ComboMenus(Id),
ImageID INT REFERENCES Images(Id)
)

CREATE TABLE ComboTypes(
Id INT PRIMARY KEY IDENTITY,
ComboID INT REFERENCES ComboMenus(Id),
TypeID INT REFERENCES [Types](Id),
)

CREATE TABLE ComboIngredients(
Id INT PRIMARY KEY IDENTITY,
ComboID INT REFERENCES ComboMenus(Id),
IngredientID INT REFERENCES Ingredients(Id),
)

--------------------------------------------------------------

INSERT INTO Categories VALUES
('ComboMenus')

GO

CREATE TRIGGER AddToCombo
ON ComboMenus
AFTER INSERT
AS BEGIN
DECLARE @Id INT
SELECT @Id=Id FROM ComboMenus WHERE withPizza='T'
INSERT INTO ComboWithPizza VALUES 
(@Id,1),(@Id,2),(@Id,3),(@Id,4),(@Id,5),(@Id,6),(@Id,7),
(@Id,8),(@Id,9),(@Id,10),(@Id,11),(@Id,12),(@Id,13),(@Id,14),
(@Id,15),(@Id,16),(@Id,17),(@Id,18),(@Id,19),(@Id,20)
END

GO

INSERT INTO ComboMenus VALUES
(2,'Roll Kombo','F'),
(2,'Dord Fesil Kombo','F'),
(2,'Ailevi Kombo','T')

INSERT INTO ComboPrice VALUES
(9.90,1),(19.90,2),(28.90,3)

INSERT INTO Images VALUES
('https://pizzamizza.az/upload/iblock/037/037f4936fd08c7e875543d219dcb8826.png?1667132732237823'),
('https://pizzamizza.az/upload/resize_cache/iblock/7cf/520_520_2/7cf1cf33128c87ec5e1ee9a535d40dac.jpg?1650108344150322'),
('https://pizzamizza.az/upload/iblock/adf/adfafaf8112e1081c6b91c5768f15ffb.png?1667132289239133')

INSERT INTO ComboImages VALUES
(1,21),(2,22),(3,23)

INSERT INTO ComboTypes VALUES
(2,1)

INSERT INTO Ingredients VALUES
('Coca-cola 0.33L'),('Coca-cola 1L'),('Boyuk Pizza'),('Qarisiq panini(6 eded)'),('Naggetsler(6 eded)')

INSERT INTO ComboIngredients VALUES
(1,25),(2,20),(2,26),(3,27),(3,28),(3,29),(3,20),(3,26)

--------------------------------------------------------------

GO

CREATE VIEW ComboAllInfo
AS
SELECT cm.Id,cm.Name,cm.withPizza,cp.Price,t.id as 'typeid',t.Name AS 'Type',count(p.Name) AS 'Available Pizzas', inn.id as 'inid',inn.Name AS 'Ingredients'
FROM ComboMenus AS cm

LEFT JOIN ComboPrice AS cp
ON cm.Id=cp.ComboId

LEFT JOIN ComboTypes AS ct
ON cm.Id=ct.ComboID
LEFT JOIN TYPES AS t
ON ct.TypeID=t.Id

LEFT JOIN ComboWithPizza AS cwp
ON cm.Id=cwp.ComboId
LEFT JOIN Pizzas AS p
On cwp.PizzaId=p.Id

LEFT JOIN ComboIngredients AS cin
ON cin.ComboID=cm.Id
LEFT JOIN Ingredients AS inn
ON inn.Id=cin.IngredientId

LEFT JOIN ComboImages AS cim
ON cm.Id=cim.ComboID
LEFT JOIN Images AS im
ON im.Id=cim.ImageID

GROUP BY cm.Id,cm.Name,cm.withPizza,cp.Price,t.id,t.Name, inn.id,inn.name

drop view ComboAllInfo
GO

CREATE PROCEDURE LittleInfoAboutCombos @Id INT
AS


select typeid,type from comboallinfo where id=2 group by typeid,type order by typeid

EXEC LittleInfoAboutCombos @Id=1
select Name from ComboMenus order by id

select * from ComboAllInfo 
group by type

select * from ComboAllInfo 

select * from Types
select * from images

order by id

select * from comboimages
select * from combotypes
select * from comboprice
select * from comboingredients


