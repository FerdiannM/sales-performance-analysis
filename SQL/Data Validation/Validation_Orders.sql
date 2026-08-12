-- ==========================================
-- DATA VALIDATION - ORDERS
-- ==========================================

-- 1. Jumlah data
SELECT COUNT(*) AS total_data
FROM dbo.orders;


-- 2. Cek NULL
SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_null,
    SUM(CASE WHEN pelanggan_id IS NULL THEN 1 ELSE 0 END) AS pelanggan_id_null,
    SUM(CASE WHEN tanggal IS NULL THEN 1 ELSE 0 END) AS tanggal_null,
    SUM(CASE WHEN total IS NULL THEN 1 ELSE 0 END) AS total_null,
    SUM(CASE WHEN status IS NULL THEN 1 ELSE 0 END) AS status_null
FROM dbo.orders;


-- 3. Duplicate order_id
SELECT
    order_id,
    COUNT(*) AS jumlah
FROM dbo.orders
GROUP BY order_id
HAVING COUNT(*) > 1;


-- 4. Total negatif
SELECT *
FROM dbo.orders
WHERE total < 0;


-- 5. Total = 0
SELECT *
FROM dbo.orders
WHERE total = 0;


-- 6. Rentang tanggal
SELECT
    MIN(tanggal) AS tanggal_min,
    MAX(tanggal) AS tanggal_max
FROM dbo.orders;


-- 7. Status NULL / kosong
SELECT *
FROM dbo.orders
WHERE status IS NULL
   OR TRIM(status) = '';


-- 8. Nilai unik status
SELECT DISTINCT status
FROM dbo.orders
ORDER BY status;


-- 9. Validasi relasi pelanggan
SELECT o.*
FROM dbo.orders o
LEFT JOIN dbo.pelanggan p
    ON o.pelanggan_id = p.pelanggan_id
WHERE p.pelanggan_id IS NULL;