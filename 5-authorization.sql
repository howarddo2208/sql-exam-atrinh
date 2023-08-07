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

-- DEMO
-- Đăng nhập bằng tài khoản "chutiem"
USE DrugstoreManagement;
EXECUTE AS LOGIN = 'chutiem';

-- Thực hiện các câu lệnh query có quyền đầy đủ
-- Ví dụ: Xem thông tin tất cả các bảng
SELECT * FROM tblThuoc;
SELECT * FROM tblKhachHang;
SELECT * FROM tblNhanVien;
SELECT * FROM tblHoaDon;
SELECT * FROM tblCTHoaDon;

-- Thực hiện các thủ tục có quyền EXECUTE
-- Ví dụ: Gọi thủ tục tính tổng số lượng tồn của một loại thuốc
EXEC spTongSoLuongTonThuoc @MaThuoc = 1;

-- Thực hiện các thủ tục không có quyền EXECUTE
-- Ví dụ: Gọi thủ tục tính tổng số lượng mua của một hoá đơn
-- (Chú ý: tài khoản "chutiem" không có quyền EXECUTE thủ tục này)
-- EXEC spTongSoLuongMuaTheoHoaDon @MaHoaDon = 1;

-- Thoát khỏi chế độ đăng nhập "chutiem"
REVERT;


-- Đăng nhập bằng tài khoản "nhanvien"
USE DrugstoreManagement;
EXECUTE AS LOGIN = 'nhanvien';

-- Thực hiện các câu lệnh SELECT trên các bảng
-- Ví dụ: Xem thông tin tất cả các bảng
SELECT * FROM tblThuoc;
SELECT * FROM tblKhachHang;
SELECT * FROM tblNhanVien;
SELECT * FROM tblHoaDon;
SELECT * FROM tblCTHoaDon;

-- Thực hiện các câu lệnh INSERT trên bảng tblHoaDon và tblCTHoaDon
-- Ví dụ: Thêm dữ liệu vào bảng tblHoaDon
INSERT INTO tblHoaDon (MaHoaDon, MaKhachHang, MaNhanVien, NgayLap, TongTien)
VALUES (6, 3, 1, '2023-08-03', 250000);

-- Thực hiện các câu lệnh không có quyền INSERT trên các bảng khác
-- Ví dụ: Thêm dữ liệu vào bảng tblThuoc
-- INSERT INTO tblThuoc (MaThuoc, TenThuoc, DonViTinh, GiaTien, SoLuongTon)
-- VALUES (6, N'New Drug', N'Viên', 20000, 50);

-- Thoát khỏi chế độ đăng nhập "nhanvien"
REVERT;

