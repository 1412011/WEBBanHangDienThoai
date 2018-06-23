var db = require('../fn/db');

exports.loadAll = () => {
	var sql = 'select * from sanpham';
	return db.load(sql);
}

exports.load_12_Lasest = () => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan from sanpham sp, nhasanxuat nsx, hinhanh ha
				where sp.idNhaSanXuat=nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0 
				order by ngayNhapHang DESC LIMIT 8`;
	return db.load(sql);
}

exports.load_12_MostView = () => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan from sanpham sp, nhasanxuat nsx, hinhanh ha
				where sp.idNhaSanXuat=nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0 
				order by soLuotXem DESC LIMIT 8`;
	return db.load(sql);
}

exports.load_12_BestSeller = () => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan from sanpham sp, nhasanxuat nsx, hinhanh ha
				where sp.idNhaSanXuat=nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0 
				order by soLuongBan DESC LIMIT 8`;
	return db.load(sql); 
}

exports.single = (id) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from sanpham sp, nhasanxuat nsx, thongsokythuat ts, loaisanpham l 
        			where idSanPham=${id} and sp.idNhaSanXuat=nsx.idNhaSanXuat and sp.idThongSoKyThuat= ts.idThongSoKyThuat 
        			and sp.idLoaiSanPham = l.idLoaiSanPham`;
        db.load(sql).then(rows => {
            if (rows.length === 0) {
                resolve(null);
            } else {
                resolve(rows[0]);
            }
        }).catch(err => {
            reject(err);
        });
    });
}

exports.load_spcungloai = () => {
	var sql = `select *`
}