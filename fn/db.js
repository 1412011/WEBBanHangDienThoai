var mysql  = require('mysql');

exports.load = sql => {
	return new Promise((resolve, reject) => {
		var cnn = mysql.createConnection({
			host : '127.0.0.1',
			port : 3306,
			user : 'root',
			password : 'root',
			database : 'quanlybanhang',
			insecureAuth : true
		});

		cnn.connect();

		cnn.query(sql, function(error, rows, fields){
			if(error){
				reject(error);
			}else{
				resolve(rows);
			}

			cnn.end();
		});
	});
}