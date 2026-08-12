SELECT * FROM dbo.detil_order;

-- 1. Berapa total detail order?
SELECT 
	COUNT(*) AS jumlah_detail_order
FROM dbo.detil_order;

-- 2. Berapa total produk yang terjual?
SELECT 
	SUM(jumlah) AS total_produk
FROM dbo.detil_order;

-- 3. Berapa rata-rata quantity per detail order?
SELECT 
	AVG(jumlah) AS avg_quantity
FROM dbo.detil_order;

-- 4. Berapa total revenue?
SELECT 
	SUM(subtotal) AS total_revenue
FROM dbo.detil_order;

-- 5. Berapa rata-rata subtotal?
SELECT 
	AVG(subtotal) AS avg_subtotal
FROM dbo.detil_order;

-- 6. Top 10 Produk apa yang paling banyak terjual?
SELECT TOP 10
	p.nama_produk,
	SUM(d.jumlah) AS total_produk_terjual
FROM dbo.detil_order AS d
JOIN dbo.produk AS p ON d.produk_id = p.produk_id
GROUP BY p.nama_produk
ORDER BY total_produk_terjual DESC;

-- 7. Top 10 Produk apa yang menghasilkan revenue terbesar?
SELECT TOP 10
	p.nama_produk,
	SUM(d.subtotal) AS total_revenue
FROM dbo.detil_order AS d
JOIN dbo.produk AS p ON d.produk_id = p.produk_id
GROUP BY p.nama_produk
ORDER BY total_revenue DESC;

-- 8. Berapa total produk yang terjual per kategori
SELECT 
	p.kategori,
	SUM(d.jumlah) AS total_produk_terjual
FROM dbo.detil_order AS d
JOIN dbo.produk AS p ON d.produk_id = p.produk_id
GROUP BY p.kategori
ORDER BY total_produk_terjual DESC;

-- 9. Berapa total revenue per kategori
SELECT 
	p.kategori,
	SUM(d.subtotal) AS total_revenue
FROM dbo.detil_order AS d
JOIN dbo.produk AS p ON d.produk_id = p.produk_id
GROUP BY p.kategori
ORDER BY total_revenue DESC;