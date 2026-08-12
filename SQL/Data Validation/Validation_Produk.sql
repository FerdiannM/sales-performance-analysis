-- 1. Jumlah data
SELECT COUNT(*) AS total_data
FROM dbo.produk;


-- 2. Cek NULL
SELECT
    SUM(CASE WHEN produk_id IS NULL THEN 1 ELSE 0 END) AS produk_id_null,
    SUM(CASE WHEN nama_produk IS NULL THEN 1 ELSE 0 END) AS nama_produk_null,
    SUM(CASE WHEN kategori IS NULL THEN 1 ELSE 0 END) AS kategori_null,
    SUM(CASE WHEN harga IS NULL THEN 1 ELSE 0 END) AS harga_null,
    SUM(CASE WHEN stok IS NULL THEN 1 ELSE 0 END) AS stok_null
FROM dbo.produk;


-- 3. Duplicate produk_id
SELECT
    produk_id,
    COUNT(*) AS jumlah
FROM dbo.produk
GROUP BY produk_id
HAVING COUNT(*) > 1;


-- 4. Harga negatif
SELECT *
FROM dbo.produk
WHERE harga < 0;


-- 5. Harga nol
SELECT *
FROM dbo.produk
WHERE harga = 0;


-- 6. Stok negatif
SELECT *
FROM dbo.produk
WHERE stok < 0;


-- 7. Nama produk kosong
SELECT *
FROM dbo.produk
WHERE nama_produk IS NULL
   OR TRIM(nama_produk) = '';


-- 8. Kategori kosong
SELECT *
FROM dbo.produk
WHERE kategori IS NULL
   OR TRIM(kategori) = '';


-- 9. Panjang nama produk
SELECT
    MIN(LEN(nama_produk)) AS nama_min,
    MAX(LEN(nama_produk)) AS nama_max
FROM dbo.produk;


-- 10. Kategori dengan karakter yang perlu diperiksa
SELECT DISTINCT kategori
FROM dbo.produk
WHERE kategori LIKE '%[^A-Za-z0-9 &-]%'
ORDER BY kategori;