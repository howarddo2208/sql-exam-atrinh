-- Tạo cơ sở dữ liệu
CREATE DATABASE DrugstoreManagement;
GO

-- Sử dụng cơ sở dữ liệu vừa tạo
USE DrugstoreManagement;
GO

-- Tạo bảng tblThuoc (Thuốc)
CREATE TABLE tblThuoc (
    MaThuoc INT IDENTITY(1,1) PRIMARY KEY,
    TenThuoc NVARCHAR(100),
    DonViTinh NVARCHAR(20),
    GiaTien DECIMAL(10, 2),
    SoLuongTon INT
);

-- Tạo bảng tblKhachHang (Khách hàng)
CREATE TABLE tblKhachHang (
    MaKhachHang INT IDENTITY(1,1) PRIMARY KEY,
    TenKhachHang NVARCHAR(100),
    DiaChi NVARCHAR(200),
    DienThoai NVARCHAR(20)
);

-- Tạo bảng tblNhanVien (Nhân viên)
CREATE TABLE tblNhanVien (
    MaNhanVien INT IDENTITY(1,1) PRIMARY KEY,
    TenNhanVien NVARCHAR(100),
    ChucVu NVARCHAR(50),
    NgaySinh DATE,
    Luong FLOAT
);

-- Tạo bảng tblHoaDon (Hoá đơn)
CREATE TABLE tblHoaDon (
    MaHoaDon INT IDENTITY(1,1) PRIMARY KEY,
    MaKhachHang INT,
    MaNhanVien INT,
    NgayLap DATE,
    TongTien DECIMAL(10, 2),
    FOREIGN KEY (MaKhachHang) REFERENCES tblKhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVien) REFERENCES tblNhanVien(MaNhanVien)
);

-- Tạo bảng tblCTHoaDon (Chi tiết hoá đơn)
CREATE TABLE tblCTHoaDon (
    MaHoaDon INT,
    MaThuoc INT,
    SoLuong INT,
    ThanhTien DECIMAL(10, 2),
    PRIMARY KEY (MaHoaDon, MaThuoc),
    FOREIGN KEY (MaHoaDon) REFERENCES tblHoaDon(MaHoaDon),
    FOREIGN KEY (MaThuoc) REFERENCES tblThuoc(MaThuoc)
);


-- Thêm dữ liệu vào bảng tblThuoc (Thuốc)
INSERT INTO tblThuoc (TenThuoc, DonViTinh, GiaTien, SoLuongTon)
VALUES
    (N'Paracetamol', N'Viên', 15000, 100),
    (N'Amoxicillin', N'Viên', 25000, 50),
    (N'Ibuprofen', N'Viên', 18000, 80),
    (N'Vitamin C', N'Viên', 30000, 120),
    (N'Aspirin', N'Viên', 20000, 70);

-- Thêm dữ liệu vào bảng tblKhachHang (Khách hàng)
INSERT INTO tblKhachHang (TenKhachHang, DiaChi, DienThoai)
VALUES
    (N'Nguyễn Văn A', N'Hà Nội', N'0901234567'),
    (N'Trần Thị B', N'Hồ Chí Minh', N'0912345678'),
    (N'Lê Văn C', N'Đà Nẵng', N'0987654321'),
    (N'Phạm Thị D', N'Hải Phòng', N'0888888888'),
    (N'Hoàng Văn E', N'Bắc Ninh', N'0999999999');

-- Thêm dữ liệu vào bảng tblNhanVien (Nhân viên)
INSERT INTO tblNhanVien (TenNhanVien, ChucVu, NgaySinh, Luong)
VALUES
    (N'Nguyễn Thị X', N'Quản lý', '1990-05-15', 20000000),
    (N'Trần Văn Y', N'Nhân viên bán hàng', '1995-11-10', 12000000),
    (N'Lê Thị Z', N'Nhân viên kho', '1992-08-20', 15000000),
    (N'Phạm Văn K', N'Nhân viên giao hàng', '1993-12-30', 13000000),
    (N'Hoàng Thị L', N'Nhân viên kế toán', '1991-03-25', 18000000);

-- Thêm dữ liệu vào bảng tblHoaDon (Hoá đơn)
INSERT INTO tblHoaDon (MaKhachHang, MaNhanVien, NgayLap, TongTien)
VALUES
    (2, 4, '2023-08-01', 50000),
    (1, 3, '2023-08-01', 100000),
    (5, 2, '2024-08-02', 300000),
    (3, 1, '2024-08-02', 150000),
    (4, 5, '2024-08-02', 200000);

-- Thêm dữ liệu vào bảng tblCTHoaDon (Chi tiết hoá đơn)
INSERT INTO tblCTHoaDon (MaHoaDon, MaThuoc, SoLuong, ThanhTien)
VALUES
    (1, 3, 2, 36000),
    (2, 1, 5, 75000),
    (2, 5, 3, 60000),
    (3, 2, 10, 250000),
    (3, 4, 2, 60000);
GO

-- View lấy thông tin từ bảng tblThuoc (Thuốc)
CREATE VIEW vwThongTinThuoc AS
SELECT MaThuoc, TenThuoc, DonViTinh, GiaTien, SoLuongTon
FROM tblThuoc;
GO

-- View lấy thông tin từ bảng tblKhachHang (Khách hàng)
CREATE VIEW vwThongTinKhachHang AS
SELECT MaKhachHang, TenKhachHang, DiaChi, DienThoai
FROM tblKhachHang;
GO

-- View lấy thông tin từ bảng tblNhanVien (Nhân viên)
CREATE VIEW vwThongTinNhanVien AS
SELECT MaNhanVien, TenNhanVien, ChucVu, NgaySinh, Luong
FROM tblNhanVien;
GO

-- View lấy thông tin từ bảng tblHoaDon (Hoá đơn)
CREATE VIEW vwThongTinHoaDon AS
SELECT MaHoaDon, MaKhachHang, MaNhanVien, NgayLap, TongTien
FROM tblHoaDon;
GO

-- View lấy thông tin từ bảng tblCTHoaDon (Chi tiết hoá đơn)
CREATE VIEW vwThongTinCTHoaDon AS
SELECT MaHoaDon, MaThuoc, SoLuong, ThanhTien
FROM tblCTHoaDon;
GO

-- View lấy thông tin một bảng và tính tổng tiền của từng hoá đơn
CREATE VIEW vwTongTienHoaDon AS
SELECT MaHoaDon, TongTien
FROM tblHoaDon;
GO

-- View lấy thông tin nhiều bảng và tính tổng tiền của từng hoá đơn bao gồm thông tin khách hàng
CREATE VIEW vwThongTinHoaDonVaKhachHang AS
SELECT hd.MaHoaDon, kh.TenKhachHang, hd.NgayLap, hd.TongTien
FROM tblHoaDon hd
INNER JOIN tblKhachHang kh ON hd.MaKhachHang = kh.MaKhachHang;
GO

-- View lấy thông tin từ bảng tblThuoc và tính tổng số lượng tồn trong kho của mỗi loại thuốc
CREATE VIEW vwTongSoLuongTonThuoc AS
SELECT TenThuoc, SUM(SoLuongTon) AS TongSoLuongTon
FROM tblThuoc
GROUP BY TenThuoc;
GO

-- View lấy thông tin từ bảng tblHoaDon và tính tổng số lượng mua của mỗi hoá đơn
CREATE VIEW vwTongSoLuongMuaTheoHoaDon AS
SELECT MaHoaDon, SUM(SoLuong) AS TongSoLuongMua
FROM tblCTHoaDon
GROUP BY MaHoaDon;
GO

-- View lấy thông tin từ bảng tblHoaDon và tính tổng số tiền bán hàng trong mỗi hoá đơn
CREATE VIEW vwTongTienBanHangTheoHoaDon AS
SELECT hd.MaHoaDon, SUM(ct.ThanhTien) AS TongTienBanHang
FROM tblHoaDon hd
INNER JOIN tblCTHoaDon ct ON hd.MaHoaDon = ct.MaHoaDon
GROUP BY hd.MaHoaDon;
GO

-- 1. Thủ tục tính tổng số lượng tồn của một loại thuốc
CREATE PROCEDURE spTongSoLuongTonThuoc
    @MaThuoc INT
AS
BEGIN
    SELECT SUM(SoLuongTon) AS TongSoLuongTon
    FROM tblThuoc
    WHERE MaThuoc = @MaThuoc;
END;
GO

-- 2. Thủ tục tính tổng số lượng mua của một hoá đơn
CREATE PROCEDURE spTongSoLuongMuaTheoHoaDon
    @MaHoaDon INT
AS
BEGIN
    SELECT SUM(SoLuong) AS TongSoLuongMua
    FROM tblCTHoaDon
    WHERE MaHoaDon = @MaHoaDon;
END;
GO

-- 3. Thủ tục tính tổng tiền bán hàng của một hoá đơn
CREATE PROCEDURE spTongTienBanHangTheoHoaDon
    @MaHoaDon INT
AS
BEGIN
    SELECT SUM(ThanhTien) AS TongTienBanHang
    FROM tblCTHoaDon
    WHERE MaHoaDon = @MaHoaDon;
END;
GO

-- 4. Thủ tục cập nhật thông tin hoá đơn khi có chi tiết hoá đơn mới
CREATE PROCEDURE spCapNhatThongTinHoaDon
    @MaHoaDon INT
AS
BEGIN
    UPDATE tblHoaDon
    SET TongTien = (
        SELECT SUM(ThanhTien)
        FROM tblCTHoaDon
        WHERE MaHoaDon = @MaHoaDon
    )
    WHERE MaHoaDon = @MaHoaDon;
END;
GO

-- 5. Thủ tục lấy thông tin hoá đơn theo mã khách hàng
CREATE PROCEDURE spLayThongTinHoaDonTheoKhachHang
    @MaKhachHang INT
AS
BEGIN
    SELECT hd.MaHoaDon, hd.NgayLap, hd.TongTien
    FROM tblHoaDon hd
    WHERE hd.MaKhachHang = @MaKhachHang;
END;
GO

-- 1. Trigger thay đổi số lượng tồn của thuốc khi có chi tiết hoá đơn mới được thêm vào
CREATE TRIGGER trUpdateSoLuongTonThuoc
ON tblCTHoaDon
AFTER INSERT
AS
BEGIN
    DECLARE @MaThuoc INT;
    DECLARE @SoLuong INT;
    
    SELECT @MaThuoc = MaThuoc, @SoLuong = SoLuong FROM inserted;
    
    UPDATE tblThuoc
    SET SoLuongTon = SoLuongTon - @SoLuong
    WHERE MaThuoc = @MaThuoc;
END;
GO

-- 2. Trigger cập nhật số lượng tồn của thuốc khi có chi tiết hoá đơn bị xóa
CREATE TRIGGER trUpdateSoLuongTonThuocAfterDelete
ON tblCTHoaDon
AFTER DELETE
AS
BEGIN
    DECLARE @MaThuoc INT;
    DECLARE @SoLuong INT;
    
    SELECT @MaThuoc = MaThuoc, @SoLuong = SoLuong FROM deleted;
    
    UPDATE tblThuoc
    SET SoLuongTon = SoLuongTon + @SoLuong
    WHERE MaThuoc = @MaThuoc;
END;
GO

-- 3. Trigger cập nhật số lượng tồn của thuốc khi có chi tiết hoá đơn bị sửa đổi số lượng
CREATE TRIGGER trUpdateSoLuongTonThuocAfterUpdate
ON tblCTHoaDon
AFTER UPDATE
AS
BEGIN
    DECLARE @MaThuoc INT;
    DECLARE @SoLuongCu INT;
    DECLARE @SoLuongMoi INT;
    
    SELECT @MaThuoc = MaThuoc, @SoLuongCu = SoLuong FROM deleted;
    SELECT @SoLuongMoi = SoLuong FROM inserted;
    
    UPDATE tblThuoc
    SET SoLuongTon = SoLuongTon + @SoLuongCu - @SoLuongMoi
    WHERE MaThuoc = @MaThuoc;
END;
GO

-- 4. Trigger cập nhật tổng tiền hoá đơn khi có chi tiết hoá đơn mới được thêm vào
CREATE TRIGGER trUpdateTongTienHoaDonAfterInsert
ON tblCTHoaDon
AFTER INSERT
AS
BEGIN
    DECLARE @MaHoaDon INT;
    
    SELECT @MaHoaDon = MaHoaDon FROM inserted;
    
    UPDATE tblHoaDon
    SET TongTien = (
        SELECT SUM(ThanhTien)
        FROM tblCTHoaDon
        WHERE MaHoaDon = @MaHoaDon
    )
    WHERE MaHoaDon = @MaHoaDon;
END;
GO

-- 5. Trigger cập nhật tổng tiền hoá đơn khi có chi tiết hoá đơn bị xóa
CREATE TRIGGER trUpdateTongTienHoaDonAfterDelete
ON tblCTHoaDon
AFTER DELETE
AS
BEGIN
    DECLARE @MaHoaDon INT;
    
    SELECT @MaHoaDon = MaHoaDon FROM deleted;
    
    UPDATE tblHoaDon
    SET TongTien = (
        SELECT SUM(ThanhTien)
        FROM tblCTHoaDon
        WHERE MaHoaDon = @MaHoaDon
    )
    WHERE MaHoaDon = @MaHoaDon;
END;
GO

-- Tạo người dùng "chutiem"
CREATE LOGIN chutiem WITH PASSWORD = 'ChuTiemPass123!';
CREATE USER chutiem FOR LOGIN chutiem;
-- Chủ tiệm có quyền đầy đủ trên tất cả các bảng và thủ tục
GRANT SELECT, INSERT, UPDATE, DELETE ON tblThuoc TO chutiem;
GRANT SELECT, INSERT, UPDATE, DELETE ON tblKhachHang TO chutiem;
GRANT SELECT, INSERT, UPDATE, DELETE ON tblNhanVien TO chutiem;
GRANT SELECT, INSERT, UPDATE, DELETE ON tblHoaDon TO chutiem;
GRANT SELECT, INSERT, UPDATE, DELETE ON tblCTHoaDon TO chutiem;
GRANT EXECUTE ON spTongSoLuongTonThuoc TO chutiem;
GRANT EXECUTE ON spTongSoLuongMuaTheoHoaDon TO chutiem;
GRANT EXECUTE ON spTongTienBanHangTheoHoaDon TO chutiem;
GRANT EXECUTE ON spCapNhatThongTinHoaDon TO chutiem;
GRANT EXECUTE ON spLayThongTinHoaDonTheoKhachHang TO chutiem;

-- Tạo người dùng "nhanvien"
CREATE LOGIN nhanvien WITH PASSWORD = 'NhanVienPass456!';
CREATE USER nhanvien FOR LOGIN nhanvien;
-- Nhân viên có quyền SELECT trên tất cả các bảng và thủ tục, và quyền INSERT trên bảng tblHoaDon và tblCTHoaDon
GRANT SELECT ON tblThuoc TO nhanvien;
GRANT SELECT ON tblKhachHang TO nhanvien;
GRANT SELECT ON tblNhanVien TO nhanvien;
GRANT SELECT, INSERT ON tblHoaDon TO nhanvien;
GRANT SELECT, INSERT ON tblCTHoaDon TO nhanvien;
GRANT EXECUTE ON spTongSoLuongTonThuoc TO nhanvien;
GRANT EXECUTE ON spTongSoLuongMuaTheoHoaDon TO nhanvien;

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
