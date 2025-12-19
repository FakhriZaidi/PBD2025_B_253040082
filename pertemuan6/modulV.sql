--variabel
DECLARE @Nilai INT=100;
PRINT @Nilai;

DECLARE @Nama CHAR(255);
SET @Nama = 'Fakhri';
PRINT @Nama;

--contro of flow
DECLARE @Nilai INT=100;
IF @Nilai > 80
	PRINT 'LULUS'
ELSE 
	PRINT 'TIDAK LULUS'

DECLARE @HargaBarang INT = 120000;
IF @HargaBarang > 100000 
	PRINT 'MAHAL'
ELSE
	PRINT 'BELI'

--view
SELECT * FROM Mahasiswa

SELECT * FROM Mahasiswa M
INNER JOIN Nilai N
ON M.MahasiswaID = N.MahasiswaID

CREATE OR ALTER VIEW vw_mahasiswanilai
AS 
	SELECT M.NamaMahasiswa, M.Prodi, M.Angkatan, N.NilaiAkhir 
	FROM Mahasiswa M
	INNER JOIN Nilai N
	ON M.MahasiswaID = N.MahasiswaID

SELECT * FROM vw_mahasiswanilai
	
CREATE OR ALTER VIEW vw_mahasiswasmt
AS 
	SELECT M.NamaMahasiswa, K.Semester 	
	FROM Mahasiswa M
	INNER JOIN KRS K
	ON M.MahasiswaID = K.MahasiswaID

SELECT * FROM vw_mahasiswasmt


-- stored procedure
CREATE OR ALTER PROCEDURE sp_LihatMahasiswa
AS 
BEGIN
	SELECT * FROM Mahasiswa
END;

EXEC sp_LihatMahasiswa;


CREATE OR ALTER PROCEDURE sp_nilai
AS 
BEGIN
	DECLARE @NilaiAkhir CHAR(1) = 'A';
	IF @NilaiAkhir = 'A'
		SELECT M.NamaMahasiswa, M.Prodi, M.Angkatan, N.NilaiAkhir
		FROM Mahasiswa M
		INNER JOIN Nilai N
		ON M.MahasiswaID = N.MahasiswaID
		WHERE N.NilaiAkhir = 'A';
	ELSE 
		PRINT 'TIDAK LULUS'
END;


EXEC sp_nilai;

