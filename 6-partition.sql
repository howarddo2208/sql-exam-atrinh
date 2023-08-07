-- Tạo các bảng phân tán
-- Tạo bảng tblHoaDon_Partitioned theo phân tán ngang (theo năm NgayLap)
CREATE TABLE tblHoaDon_Partitioned (
    MaHoaDon INT PRIMARY KEY,
    MaKhachHang INT,
    MaNhanVien INT,
    NgayLap DATE,
    TongTien DECIMAL(10, 2),
    CONSTRAINT PK_tblHoaDon_Partitioned PRIMARY KEY CLUSTERED (NgayLap, MaHoaDon)
);

-- Tạo bảng tblCTHoaDon_Partitioned theo phân tán ngang (theo năm NgayLap)
CREATE TABLE tblCTHoaDon_Partitioned (
    MaCTHoaDon INT PRIMARY KEY,
    MaHoaDon INT,
    MaThuoc INT,
    SoLuong INT,
    ThanhTien DECIMAL(10, 2),
    CONSTRAINT PK_tblCTHoaDon_Partitioned PRIMARY KEY CLUSTERED (NgayLap, MaCTHoaDon)
);

-- Tạo bảng tblHoaDon_Vertical_Partitioned theo phân tán dọc (theo MaKhachHang)
CREATE TABLE tblHoaDon_Vertical_Partitioned (
    MaHoaDon INT PRIMARY KEY,
    MaKhachHang INT,
    MaNhanVien INT,
    NgayLap DATE,
    TongTien DECIMAL(10, 2),
    CONSTRAINT PK_tblHoaDon_Vertical_Partitioned PRIMARY KEY CLUSTERED (MaKhachHang, MaHoaDon)
);

-- Tạo bảng tblCTHoaDon_Vertical_Partitioned theo phân tán dọc (theo MaKhachHang)
CREATE TABLE tblCTHoaDon_Vertical_Partitioned (
    MaCTHoaDon INT PRIMARY KEY,
    MaHoaDon INT,
    MaThuoc INT,
    SoLuong INT,
    ThanhTien DECIMAL(10, 2),
    CONSTRAINT PK_tblCTHoaDon_Vertical_Partitioned PRIMARY KEY CLUSTERED (MaKhachHang, MaCTHoaDon)
);

-- Phân tán ngang dữ liệu bảng tblHoaDon
INSERT INTO tblHoaDon_Partitioned (MaHoaDon, MaKhachHang, MaNhanVien, NgayLap, TongTien)
SELECT MaHoaDon, MaKhachHang, MaNhanVien, NgayLap, TongTien
FROM tblHoaDon
WHERE YEAR(NgayLap) = 2023; -- Thay đổi năm theo năm cần phân tán

-- Phân tán ngang dữ liệu bảng tblCTHoaDon
INSERT INTO tblCTHoaDon_Partitioned (MaCTHoaDon, MaHoaDon, MaThuoc, SoLuong, ThanhTien)
SELECT MaCTHoaDon, MaHoaDon, MaThuoc, SoLuong, ThanhTien
FROM tblCTHoaDon
WHERE EXISTS (SELECT 1 FROM tblHoaDon WHERE tblCTHoaDon.MaHoaDon = tblHoaDon.MaHoaDon AND YEAR(NgayLap) = 2023); -- Thay đổi năm theo năm cần phân tán

-- Phân tán dọc dữ liệu bảng tblHoaDon
INSERT INTO tblHoaDon_Vertical_Partitioned (MaHoaDon, MaKhachHang, MaNhanVien, NgayLap, TongTien)
SELECT MaHoaDon, MaKhachHang, MaNhanVien, NgayLap, TongTien
FROM tblHoaDon;

-- Phân tán dọc dữ liệu bảng tblCTHoaDon
INSERT INTO tblCTHoaDon_Vertical_Partitioned (MaCTHoaDon, MaHoaDon, MaThuoc, SoLuong, ThanhTien)
SELECT MaCTHoaDon, MaHoaDon, MaThuoc, SoLuong, ThanhTien
FROM tblCTHoaDon;


DELETE FROM tblHoaDon WHERE YEAR(NgayLap) = 2023; -- Thay đổi năm theo năm cần phân tán

DELETE FROM tblCTHoaDon WHERE EXISTS (SELECT 1 FROM tblHoaDon WHERE tblCTHoaDon.MaHoaDon = tblHoaDon.MaHoaDon AND YEAR(NgayLap) = 2023); -- Thay đổi năm theo năm cần phân tán

-- DEMO 6
-- 1. Truy vấn dữ liệu của bảng tblHoaDon_Partitioned theo năm NgayLap (phân tán ngang)
-- Kết quả mong đợi: Trả về tất cả các hoá đơn được tạo trong năm 2023.
SELECT *
FROM tblHoaDon_Partitioned
WHERE YEAR(NgayLap) = 2023;

-- 2. Truy vấn dữ liệu của bảng tblCTHoaDon_Partitioned theo năm NgayLap (phân tán ngang)
-- Kết quả mong đợi: Trả về tất cả các chi tiết hoá đơn của những hoá đơn được tạo trong năm 2023.
SELECT *
FROM tblCTHoaDon_Partitioned
WHERE EXISTS (SELECT 1 FROM tblHoaDon_Partitioned WHERE tblCTHoaDon_Partitioned.MaHoaDon = tblHoaDon_Partitioned.MaHoaDon AND YEAR(NgayLap) = 2023);

-- 3. Truy vấn dữ liệu của bảng tblHoaDon_Vertical_Partitioned theo MaKhachHang (phân tán dọc)
-- Kết quả mong đợi: Trả về tất cả các hoá đơn của một khách hàng có MaKhachHang = 2.
SELECT *
FROM tblHoaDon_Vertical_Partitioned
WHERE MaKhachHang = 2;

-- 4. Truy vấn dữ liệu của bảng tblCTHoaDon_Vertical_Partitioned theo MaKhachHang (phân tán dọc)
-- Kết quả mong đợi: Trả về tất cả các chi tiết hoá đơn của những hoá đơn mà khách hàng có MaKhachHang = 2.
SELECT *
FROM tblCTHoaDon_Vertical_Partitioned
WHERE EXISTS (SELECT 1 FROM tblHoaDon_Vertical_Partitioned WHERE tblCTHoaDon_Vertical_Partitioned.MaHoaDon = tblHoaDon_Vertical_Partitioned.MaHoaDon AND MaKhachHang = 2);

