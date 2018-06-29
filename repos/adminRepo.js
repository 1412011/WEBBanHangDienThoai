 var db = require('../fn/db');

 exports.login = (admin) => {
 	var sql = "SELECT * FROM admin WHERE email = '${admin.email}' AND matKhau= '${admin.pass}'";
 	return db.load(sql);
 }

 exports.single = (id) => {
 	var sql = `select * from admin where idAdmin = ${id}`;
 	return db.load(sql);
 }
