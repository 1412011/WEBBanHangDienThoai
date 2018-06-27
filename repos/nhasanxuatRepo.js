var db = require('../fn/db');

exports.load_from_name = (name) => {
	var sql = `select * from nhasanxuat where alias like '%${name}%'`;
	return db.load(sql);
}
