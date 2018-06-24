var db = require('../fn/db');
var config = require('../config/config');

exports.loadAll = () => {
	var sql = 'select * from sanpham';
	return db.load(sql);
}

exports.load_sp_theoloai = (idloai) => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan
			from sanpham sp, nhasanxuat nsx, hinhanh ha
    		where sp.idLoaiSanPham = ${idloai}
    		and sp.idNhaSanXuat=nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0`;
	return db.load(sql);
}

exports.load_cungloai = (s, limit, offset) => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia, duongDan 
				from sanpham sp, hinhanh ha, loaisanpham l
				where l.idLoaiSanPham = sp.idLoaiSanPham and ${s.idLoaiSanPham} = l.idLoaiSanPham and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0
				LIMIT ${limit} OFFSET ${offset}`;
	return db.load(sql);
}

exports.load_cungnsx = (s, limit, offset) => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan 
				from sanpham sp, nhasanxuat nsx, hinhanh ha
				where sp.idNhaSanXuat = nsx.idNhaSanXuat and ${s.idNhaSanXuat} = nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0
				LIMIT ${limit} OFFSET ${offset}`;
	return db.load(sql);
}

// load main

exports.load_sp_sieupham_dt = () => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan from sanpham sp, nhasanxuat nsx, hinhanh ha
				where sp.idNhaSanXuat=nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0 and sp.idLoaiSanPham = 1
				order by gia DESC LIMIT ${config.SAN_PHAM_TRANG_CHU}`; 
	return db.load(sql);
}

exports.load_sp_sieupham_mtb = () => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan from sanpham sp, nhasanxuat nsx, hinhanh ha
				where sp.idNhaSanXuat=nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0 and sp.idLoaiSanPham = 2
				order by gia DESC LIMIT ${config.SAN_PHAM_TRANG_CHU}`; 
	return db.load(sql);
}

exports.load_sp_Lasest = () => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan from sanpham sp, nhasanxuat nsx, hinhanh ha
				where sp.idNhaSanXuat=nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0
				order by ngayNhapHang DESC LIMIT ${config.SAN_PHAM_TRANG_CHU}`;
	return db.load(sql);
}

exports.load_sp_MostView = () => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan from sanpham sp, nhasanxuat nsx, hinhanh ha
				where sp.idNhaSanXuat=nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0 
				order by soLuotXem DESC LIMIT ${config.SAN_PHAM_TRANG_CHU}`;
	return db.load(sql);
}

exports.load_sp_BestSeller = () => {
	var sql = `select sp.idSanPham, tenSanPham, gia, giaGiam, danhGia ,tenNhaSanXuat, duongDan from sanpham sp, nhasanxuat nsx, hinhanh ha
				where sp.idNhaSanXuat=nsx.idNhaSanXuat and ha.idSanPham=sp.idSanPham and ha.loaiHinhAnh=0 
				order by soLuongBan DESC LIMIT ${config.SAN_PHAM_TRANG_CHU}`;
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