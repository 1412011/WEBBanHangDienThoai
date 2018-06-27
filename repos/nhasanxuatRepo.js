var db = require('../fn/db');

exports.load_from_name = (name) => {
	var sql = `select * from nhasanxuat where alias like '%${name}%'`;
	return db.load(sql);
}

exports.loadAll = () => {
	var sql = `select * from nhasanxuat`;
	return db.load(sql);
}

exports.loadAll_in_cat_product = (idCat) => {
	var sql = `select* from nhasanxuat n where n.idNhaSanXuat in 
							(select distinct sp.idNhaSanXuat from sanpham sp where sp.idLoaiSanPham =${idCat})`;
	return db.load(sql);
}

exports.loadAll_in_cat_nsx_product = (idCat, idnsx) => {
	var sql = `select* from nhasanxuat n where n.idNhaSanXuat in 
							(select distinct sp.idNhaSanXuat from sanpham sp where sp.idLoaiSanPham =${idCat} and sp.idNhaSanXuat=${idnsx} )
			`;
	return db.load(sql);
}

exports.loadAll_in_all_product = () => {
	var sql = `select* from nhasanxuat n where n.idNhaSanXuat in (select distinct sp.idNhaSanXuat from sanpham sp)`;
	return db.load(sql);
}
