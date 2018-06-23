var db = require('../fn/db');

exports.single = (idsp) => {
    return new Promise((resolve, reject) => {
        var sql = `select * from thongsokythuat where idThongSoKyThuat = ${idsp}`;
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