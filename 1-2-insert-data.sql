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

-- DEMO 
SELECT * FROM tblThuoc WHERE TenThuoc = N'Paracetamol';

DELETE FROM tblThuoc WHERE TenThuoc = N'Aspirin';

UPDATE tblNhanVien
SET ChucVu = N'Quản lý kinh doanh', Luong = 25000000
WHERE TenNhanVien = N'Nguyễn Thị X';
