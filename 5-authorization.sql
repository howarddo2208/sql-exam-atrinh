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
