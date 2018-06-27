 var db = require('../fn/db');

 exports.login = (user) => {
 	var sql = `select* from nguoidung where email = '${user.email}' and matKhau='${user.pass}' `;
 	return db.load(sql);
 }

 exports.add = (user) => {
 	var sql = `insert into nguoidung(tenNguoiDung, gioiTinh, sdt, ngaySinh, email, matKhau, f_Permission)
 				values ('${user.name}', '${user.gt}','${user.phone}','${user.dob}','${user.email}','${user.pass}',${user.f_permission})`;
 	return db.save(sql);
 }

 exports.single = (id) => {
 	var sql = `select* from nguoidung where idNguoiDung = ${id}`;
 	return db.load(sql);
 }
