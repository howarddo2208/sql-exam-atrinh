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
