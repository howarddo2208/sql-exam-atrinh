-- Thêm dữ liệu vào bảng tblThuoc (Thuốc)
INSERT INTO tblThuoc (MaThuoc, TenThuoc, DonViTinh, GiaTien, SoLuongTon)
VALUES
    (1, N'Paracetamol', N'Viên', 15000, 100),
    (2, N'Amoxicillin', N'Viên', 25000, 50),
    (3, N'Ibuprofen', N'Viên', 18000, 80),
    (4, N'Vitamin C', N'Viên', 30000, 120),
    (5, N'Aspirin', N'Viên', 20000, 70);

-- Thêm dữ liệu vào bảng tblKhachHang (Khách hàng)
INSERT INTO tblKhachHang (MaKhachHang, TenKhachHang, DiaChi, DienThoai)
VALUES
    (1, N'Nguyễn Văn A', N'Hà Nội', N'0901234567'),
    (2, N'Trần Thị B', N'Hồ Chí Minh', N'0912345678'),
    (3, N'Lê Văn C', N'Đà Nẵng', N'0987654321'),
    (4, N'Phạm Thị D', N'Hải Phòng', N'0888888888'),
    (5, N'Hoàng Văn E', N'Bắc Ninh', N'0999999999');

-- Thêm dữ liệu vào bảng tblNhanVien (Nhân viên)
INSERT INTO tblNhanVien (MaNhanVien, TenNhanVien, ChucVu, NgaySinh, Luong)
VALUES
    (1, N'Nguyễn Thị X', N'Quản lý', '1990-05-15', 20000000),
    (2, N'Trần Văn Y', N'Nhân viên bán hàng', '1995-11-10', 12000000),
    (3, N'Lê Thị Z', N'Nhân viên kho', '1992-08-20', 15000000),
    (4, N'Phạm Văn K', N'Nhân viên giao hàng', '1993-12-30', 13000000),
    (5, N'Hoàng Thị L', N'Nhân viên kế toán', '1991-03-25', 18000000);

-- Thêm dữ liệu vào bảng tblHoaDon (Hoá đơn)
INSERT INTO tblHoaDon (MaHoaDon, MaKhachHang, MaNhanVien, NgayLap, TongTien)
VALUES
    (1, 2, 4, '2023-08-01', 50000),
    (2, 1, 3, '2023-08-01', 100000),
    (3, 5, 2, '2023-08-02', 300000),
    (4, 3, 1, '2023-08-02', 150000),
    (5, 4, 5, '2023-08-02', 200000);

-- Thêm dữ liệu vào bảng tblCTHoaDon (Chi tiết hoá đơn)
INSERT INTO tblCTHoaDon (MaCTHoaDon, MaHoaDon, MaThuoc, SoLuong, ThanhTien)
VALUES
    (1, 1, 3, 2, 36000),
    (2, 2, 1, 5, 75000),
    (3, 2, 5, 3, 60000),
    (4, 3, 2, 10, 250000),
    (5, 3, 4, 2, 60000);
