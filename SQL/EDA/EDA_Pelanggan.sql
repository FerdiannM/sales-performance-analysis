SELECT * FROM dbo.pelanggan;

-- 1. Jumlah Pelanggan
SELECT COUNT(*) AS jumlah_pelanggan FROM dbo.pelanggan;

-- 2. Berapa banyak pelanggan berdasarkan kota
SELECT 
	kota, 
	COUNT(*) AS jumlah_pelanggan
FROM dbo.pelanggan
GROUP BY kota
ORDER BY jumlah_pelanggan DESC;

-- 3. Berapa banyak pelanggan berdasarkan provinsi
SELECT 
	provinsi, 
	COUNT(*) AS jumlah_pelanggan
FROM dbo.pelanggan
GROUP BY provinsi
ORDER BY jumlah_pelanggan DESC;

-- 4. Berapa banyak jumlah kota berdasarkan provinsi
SELECT 
	provinsi,
	COUNT(DISTINCT kota) AS jumlah_kota
FROM dbo.pelanggan
GROUP BY provinsi
ORDER BY jumlah_kota DESC;