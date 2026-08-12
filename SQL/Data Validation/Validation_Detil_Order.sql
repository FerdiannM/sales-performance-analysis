-- ==========================================
-- DATA VALIDATION - DETIL ORDER
-- ==========================================

-- 1. Jumlah data
SELECT COUNT(*) AS total_data
FROM dbo.detil_order;


-- 2. Cek NULL
SELECT
    SUM(CASE WHEN detil_id IS NULL THEN 1 ELSE 0 END) AS detil_id_null,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_null,
    SUM(CASE WHEN produk_id IS NULL THEN 1 ELSE 0 END) AS produk_id_null,
    SUM(CASE WHEN jumlah IS NULL THEN 1 ELSE 0 END) AS jumlah_null,
    SUM(CASE WHEN subtotal IS NULL THEN 1 ELSE 0 END) AS subtotal_null
FROM dbo.detil_order;


-- 3. Duplicate detil_id
SELECT
    detil_id,
    COUNT(*) AS jumlah
FROM dbo.detil_order
GROUP BY detil_id
HAVING COUNT(*) > 1;


-- 4. Jumlah <= 0
SELECT *
FROM dbo.detil_order
WHERE jumlah <= 0;


-- 5. Subtotal negatif
SELECT *
FROM dbo.detil_order
WHERE subtotal < 0;


-- 6. Subtotal = 0
SELECT *
FROM dbo.detil_order
WHERE subtotal = 0;


-- 7. Validasi relasi order
SELECT d.*
FROM dbo.detil_order d
LEFT JOIN dbo.orders o
    ON d.order_id = o.order_id
WHERE o.order_id IS NULL;


-- 8. Validasi relasi produk
SELECT d.*
FROM dbo.detil_order d
LEFT JOIN dbo.produk p
    ON d.produk_id = p.produk_id
WHERE p.produk_id IS NULL;