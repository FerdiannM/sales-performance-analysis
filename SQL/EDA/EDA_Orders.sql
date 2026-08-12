SELECT * FROM dbo.orders;

-- 1. Berapa jumlah orders?
SELECT 
	COUNT(*) AS jumlah_order
FROM dbo.orders;

-- 2. Berapa jumlah order per tahun?
SELECT 
	YEAR(tanggal) AS tahun,
	COUNT(*) AS jumlah_order
FROM dbo.orders
GROUP BY YEAR(tanggal)
ORDER BY tahun;

-- 3. Berapa jumlah order per bulan?
SELECT 
	LEFT(DATENAME(MONTH, tanggal), 3) AS bulan,
	COUNT(*) AS jumlah_order
FROM dbo.orders
GROUP BY MONTH(tanggal), DATENAME(MONTH, tanggal)
ORDER BY MONTH(tanggal);

-- 4. Berapa rata-rata nilai order?
SELECT 
	AVG(total) AS avg_total
FROM dbo.orders;

-- 5. Berapa rata-rata nilai order per tahun?
SELECT 
	YEAR(tanggal) AS tahun,
	AVG(total) AS avg_total
FROM dbo.orders
GROUP BY YEAR(tanggal);

-- 6. Berapa rata-rata nilai order per bulan?
SELECT 
	LEFT(DATENAME(MONTH, tanggal), 3) AS bulan,
	AVG(total) AS avg_total
FROM dbo.orders
GROUP BY MONTH(tanggal), DATENAME(MONTH, tanggal)
ORDER BY MONTH(tanggal);

-- 7. Berapa jumlah order berdasarkan status
SELECT 
	status,
	COUNT(*) AS jumlah_order
FROM dbo.orders
GROUP BY status
ORDER BY jumlah_order DESC;

-- 8. Berapa jumlah order berdasarkan provinsi pelanggan?
SELECT 
	p.provinsi,
	COUNT(*) AS jumlah_order
FROM dbo.orders AS o
JOIN dbo.pelanggan AS p ON o.pelanggan_id = p.pelanggan_id
GROUP BY p.provinsi
ORDER BY jumlah_order DESC;

-- 9. Provinsi mana yang banyak melakukan pembatalan order?
SELECT 
	p.provinsi,
	COUNT(*) AS status_dibatalkan
FROM dbo.orders AS o
JOIN dbo.pelanggan AS p ON o.pelanggan_id = p.pelanggan_id
WHERE o.status = 'dibatalkan'
GROUP BY p.provinsi
ORDER BY status_dibatalkan DESC;

-- 10. Berapa percentage order yang dibatalkan per provinsi?
SELECT 
	p.provinsi,
	COUNT(*) AS total_order,
	SUM(CASE WHEN o.status = 'dibatalkan' THEN 1 ELSE 0 END) AS jumlah_dibatalkan,
	CAST(
		SUM(CASE WHEN o.status = 'dibatalkan' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)
	) AS persentase_dibatalkan
FROM dbo.orders AS o
JOIN dbo.pelanggan AS p ON o.pelanggan_id = p.pelanggan_id
GROUP BY p.provinsi
ORDER BY persentase_dibatalkan DESC;
