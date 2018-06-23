var db = require('../fn/db');

exports.load_1_product = (id, loai) => {
	var sql = `select * from hinhanh where idSanPham = ${id} and loaiHinhAnh = ${loai}`;
	return db.load(sql);
}
