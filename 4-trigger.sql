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
