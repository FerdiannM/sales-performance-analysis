SELECT * FROM dbo.produk;

-- 1. Berapa banyak produk?
SELECT 
	COUNT(produk_id) AS jumlah_produk
FROM dbo.produk

-- 2. Jumlah produk per kategori?
SELECT
	kategori,
	COUNT(produk_id) as jumlah_produk
FROM dbo.produk
GROUP BY kategori
ORDER BY jumlah_produk DESC;

-- 3. Produk apa yang memiliki harga tertinggi dan harga terendah?
SELECT nama_produk, harga
FROM dbo.produk
WHERE harga = (SELECT MAX(harga) FROM dbo.produk)
   OR harga = (SELECT MIN(harga) FROM dbo.produk);

-- 4. Berapa harga rata-rata per kategori?
SELECT 
	kategori,
	AVG(harga) AS avg_harga
FROM dbo.produk
GROUP BY kategori
ORDER BY avg_harga DESC;

-- 5. Berapa banyak stok per kategori?
SELECT 
	kategori,
	SUM(stok) AS jumlah_stok
FROM dbo.produk
GROUP BY kategori
ORDER BY jumlah_stok DESC;

-- 6. Berapa rata-rata stok per kategori?
SELECT 
	kategori,
	AVG(stok) AS avg_stok
FROM dbo.produk
GROUP BY kategori
ORDER BY avg_stok DESC;