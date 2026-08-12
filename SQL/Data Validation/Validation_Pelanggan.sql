-- 1. Jumlah data
SELECT COUNT(*) AS total_data
FROM dbo.pelanggan;


-- 2. Cek NULL
SELECT
    SUM(CASE WHEN pelanggan_id IS NULL THEN 1 ELSE 0 END) AS pelanggan_id_null,
    SUM(CASE WHEN nama IS NULL THEN 1 ELSE 0 END) AS nama_null,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS email_null,
    SUM(CASE WHEN alamat IS NULL THEN 1 ELSE 0 END) AS alamat_null,
    SUM(CASE WHEN kota IS NULL THEN 1 ELSE 0 END) AS kota_null,
    SUM(CASE WHEN provinsi IS NULL THEN 1 ELSE 0 END) AS provinsi_null,
    SUM(CASE WHEN no_hp IS NULL THEN 1 ELSE 0 END) AS no_hp_null
FROM dbo.pelanggan;


-- 3. Duplicate pelanggan_id
SELECT
    pelanggan_id,
    COUNT(*) AS jumlah
FROM dbo.pelanggan
GROUP BY pelanggan_id
HAVING COUNT(*) > 1;


-- 4. Duplicate nomor HP
SELECT
    no_hp,
    COUNT(*) AS jumlah
FROM dbo.pelanggan
WHERE no_hp IS NOT NULL
GROUP BY no_hp
HAVING COUNT(*) > 1
ORDER BY jumlah DESC;


-- 5. Duplicate email
SELECT
    email,
    COUNT(*) AS jumlah
FROM dbo.pelanggan
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY jumlah DESC;


-- 6. Panjang nama
SELECT
    MIN(LEN(nama)) AS nama_min,
    MAX(LEN(nama)) AS nama_max
FROM dbo.pelanggan;


-- 7. Data kota dengan karakter mencurigakan
SELECT DISTINCT kota
FROM dbo.pelanggan
WHERE kota LIKE '%[^A-Za-z ]%'
ORDER BY kota;


-- 8. Kota NULL atau kosong
SELECT *
FROM dbo.pelanggan
WHERE kota IS NULL
   OR TRIM(kota) = '';


-- 9. Provinsi NULL atau kosong
SELECT *
FROM dbo.pelanggan
WHERE provinsi IS NULL
   OR TRIM(provinsi) = '';