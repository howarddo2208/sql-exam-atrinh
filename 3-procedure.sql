-- 1. Thủ tục tính tổng số lượng tồn của một loại thuốc
CREATE PROCEDURE spTongSoLuongTonThuoc
    @MaThuoc INT
AS
BEGIN
    SELECT SUM(SoLuongTon) AS TongSoLuongTon
    FROM tblThuoc
    WHERE MaThuoc = @MaThuoc;
END;

-- 2. Thủ tục tính tổng số lượng mua của một hoá đơn
CREATE PROCEDURE spTongSoLuongMuaTheoHoaDon
    @MaHoaDon INT
AS
BEGIN
    SELECT SUM(SoLuong) AS TongSoLuongMua
    FROM tblCTHoaDon
    WHERE MaHoaDon = @MaHoaDon;
END;

-- 3. Thủ tục tính tổng tiền bán hàng của một hoá đơn
CREATE PROCEDURE spTongTienBanHangTheoHoaDon
    @MaHoaDon INT
AS
BEGIN
    SELECT SUM(ThanhTien) AS TongTienBanHang
    FROM tblCTHoaDon
    WHERE MaHoaDon = @MaHoaDon;
END;

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

-- 5. Thủ tục lấy thông tin hoá đơn theo mã khách hàng
CREATE PROCEDURE spLayThongTinHoaDonTheoKhachHang
    @MaKhachHang INT
AS
BEGIN
    SELECT hd.MaHoaDon, hd.NgayLap, hd.TongTien
    FROM tblHoaDon hd
    WHERE hd.MaKhachHang = @MaKhachHang;
END;

