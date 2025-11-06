--Buat Database TokoRentalDB
CREATE DATABASE TokoRentalDB;

--Gunakan DB TokoRentalDB
USE TokoRentalDB

--Membuat Tabel KategoriProduk
 CREATE TABLE KategoriProduk (
	KategoriID INT IDENTITY(1,1) PRIMARY KEY,
	NamaKategori VARCHAR(100) NOT NULL UNIQUE
 );

 --Membuat Table Produk
 CREATE TABLE Produk (
	ProdukID INT IDENTITY(1001,1) PRIMARY KEY, 
	SKU VARCHAR(20) NOT NULL UNIQUE,
	NamaProduk VARCHAR(150) NOT NULL,
	Harga DECIMAL(10,2) NOT NULL,
	Stok INT NOT NULL,
	KategoriID INT NULL,

	 --Harganya Gaboleh Negatif
	CONSTRAINT CHK_HargaPositif CHECK (Harga >= 0),
	--Stoknya Gaboleh Negatif
	CONSTRAINT CHK_StokPositif CHECK (Stok >= 0),
	--Relasikan Dengan Tabel KategoriProduk Melalui KategoriID
	CONSTRAINT FK_Produk_Kategori
		FOREIGN KEY (KategoriID)
		REFERENCES KategoriProduk(KategoriID)
 );

	--Memasukan data ke tabel kategoriproduk
	INSERT INTO KategoriProduk (NamaKategori)
	VALUES 
	('Elektronik');
    
	INSERT INTO KategoriProduk (NamaKategori)
	VALUES 
	('Pakaian'),
	('Buku');

	--Menampilkan tabel kategoriproduk
	SELECT *
	FROM KategoriProduk

	--Hanya menampilkan Namakategori
	SELECT Namakategori
	FROM KategoriProduk;

	--Menambahkan data ke tabel produk
	INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
	VALUES 
	('ELEC-001', 'Laptop gaming', 15000000.00, 50, 2);

	INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
	VALUES 
	('SLEC_992', 'HP Gaming', 50000000.00, 50, 1);

	--Menampilkan tabel produk 
	SELECT *
	FROM Produk;

	--Mengubah data stok laktop gaming menjadi 30 
	UPDATE Produk
	SET Stok = 30
	WHERE ProdukID = 1001;

	--Menghapus data HP gaming 
	BEGIN TRANSACTION;

	DELETE FROM Produk 
	WHERE ProdukID = 1002;

	--Cek apakah sudah terhapus atau belum
	SELECT *
	FROM Produk;

	COMMIT TRANSACTION;

	--menambahkan data lagi ke tabel produk
	INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
	VALUES 
	('BAJU-001', 'Kaos putih', 50000.00, 30, 2);

	INSERT INTO Produk (SKU, NamaProduk, Harga, Stok, KategoriID)
	VALUES 
	('BAJU-002', 'Kaos putih', 50000.00, 30, 2);

	SELECT*FROM Produk;

	--Menghapus kaos putih
	BEGIN TRAN;

	DELETE FROM Produk 
	WHERE ProdukID =  1004;

	ROLLBACK TRANSACTION;

	COMMIT TRANSACTION;
    


