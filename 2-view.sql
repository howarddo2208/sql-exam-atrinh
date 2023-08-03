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
SELECT MaCTHoaDon, MaHoaDon, MaThuoc, SoLuong, ThanhTien
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
