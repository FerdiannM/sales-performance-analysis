SELECT 
	p.pelanggan_id,
	p.nama,
	p.provinsi,

	pr.produk_id,
	pr.nama_produk,
	pr.kategori,
	pr.harga,

	o.order_id,
	o.tanggal,

	od.jumlah,
	od.subtotal,
	o.status

INTO dbo.sales_analysis

FROM dbo.orders AS o

JOIN dbo.pelanggan AS p
	ON o.pelanggan_id = p.pelanggan_id

JOIN dbo.detil_order AS od
	ON o.order_id = od.order_id

JOIN dbo.produk AS pr
	ON od.produk_id = pr.produk_id;

SELECT * FROM dbo.sales_analysis;

SELECT * FROM dbo.sales_analysis
WHERE pelanggan_id IS NULL
OR produk_id IS NULL
OR order_id IS NULL;

SELECT 
	SUM(subtotal) AS revenue
FROM dbo.sales_analysis;

SELECT COUNT(*) FROM dbo.sales_analysis;

SELECT SUM(jumlah) FROM dbo.sales_analysis;

SELECT COUNT(DISTINCT order_id) FROM dbo.sales_analysis;