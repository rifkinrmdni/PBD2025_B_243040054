--Menampilakan semua data pada tabel product
SELECT *
FROM Production.Product;

--Menampilkan Name, ProductNumber, dan ListPrice
SELECT Name, ProductNumber, ListPrice
FROM Production.Product;

--Menampilkan data menggunakan alias kolom 
SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product;

--Menampilkan HargaBaru = ListPrice * 1.1
SELECT Name, ListPrice, (ListPrice * 1.1) AS HargaBaru
FROM Production.Product;

--Meampilkan data dengan menggabungkan string
SELECT Name + '(' + ProductNumber + ')' AS ProdukLengkap
FROM Production.Product;

--Filterisasi data
--Menampilkan produk yang berwarna 'red'
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'red';

--Menampilkan produk yang ListPricenya lebih dari 1000
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 1000;

--Menampilkan produk yang berwarna black DAN List pricenya lebih dari 500
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'Black' AND ListPrice > 500;

--Menampilkan produk yang berwarna red, blue, ATAU black
SELECT Name, Color
FROM Production.Product
WHERE Color IN ('red', 'blue', 'black');

--Menampilkan produk yang namanya mengandung kata 'Road;
SELECT Name, ProductNumber
FROM Production.Product
WHERE Name LIKE '%Road%'; --%Bike% 

--Agregari dan pengelompokan
--Menghitung total baris
SELECT COUNT(*) AS TotalProduk
FROM Production.Product;

--Menampilkan warna produk dan jumlahnya
SELECT Color, COUNT(*) AS JumlahProduk
FROM Production.Product
GROUP BY Color;

--Menampilkan ProductID, jumlah OrderQty, dan rata2 UnitPrice
SELECT ProductID, SUM(OrderQty) AS TotalTerjual, AVG(UnitPrice) AS RataRataHarga
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT * 
FROM Sales.SalesOrderDetail;

--Menampilkan data dengan grouping lebih dari satu kolom
SELECT Color, Size, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color, Size;

SELECT *
FROM Production.Product

--Filter Hasil Agregasi
--Menampilkan warna produk yang jumlahnya lebih dari 20
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color
HAVING COUNT(*) > 2;

--Menampilkan warna produk yang ListPricenya > 500 dan jumlahnya > 1
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
WHERE ListPrice > 500
GROUP BY Color
HAVING COUNT(*) < 10;

--Menampilkan ProductID yang jumlah OrderQty lebih dari 100
SELECT ProductID, SUM(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) > 10

--Menampilkan SpecialOfferID yang rata2 OrderQtynya kurang dari 2
SELECT SpecialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG(OrderQty) > 2;

--Menampilkan warna yang ListPricenya lebih dari 1000 menggunakan MAX
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX(ListPrice) > 3000;

--Advanced Select dan Order by 
--Menampilkan JobTitle tanpa duplikat
SELECT DISTINCT JobTitle
FROM HumanResources.Employee

SELECT JobTitle
FROM HumanResources.Employee

--Menampilkan 5 Nama produk termahal / Kalo tidak memakai top maka data akan tampil semua / kalo termurah ganti ASC
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--OFFSET FETCH 
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 3 ROWS
FETCH NEXT 4 ROWS ONLY;

SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC

SELECT TOP 3 Color, SUM(ListPrice) AS TotalNilaiStok
FROM Production.Product
WHERE ListPrice > 0
GROUP BY Color
ORDER BY TotalNilaiStok DESC

--TUGAS MANDIRI
-- No 1
SELECT ProductID,SUM(LineTotal) AS TotalPendapatan
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

--No 2
SELECT ProductID,OrderQty,UnitPrice,LineTotal
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2;


--No 3
SELECT ProductID,SUM(LineTotal) AS TotalPendapatan
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID;

--No 4
SELECT ProductID,SUM(LineTotal) AS TotalPendapatan
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > 30000; --diganti 50000 menjadi 30000 karna jika menggunakan 50000 tidak tampil ketika di Execute

--No 5
SELECT ProductID,SUM(LineTotal) AS TotalPendapatan
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalPendapatan DESC;

--No 6
SELECT TOP 10 ProductID,SUM(LineTotal) AS TotalPendapatan
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalPendapatan DESC;
