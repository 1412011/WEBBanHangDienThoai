
var express = require('express'),
	SHA256 = require('crypto-js/sha256'),
    moment = require('moment');

var restrict = require('../middle-wares/restrict'),
	adminRepo = require('../repos/adminRepo');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/admin/login')
});

// router.get('/Dashboard', restrict, (req, res) => {
// 	var vm = {layout: 'DashboardLayouts.handlebars'};
// 	res.render('admin/Dashboard',vm);
// });

router.get('/Dashboard', (req, res) => {
	var vm = {layout: 'DashboardLayouts.handlebars'};
	res.render('admin/Dashboard',vm);
});

router.get('/admin-CapNhatThongTin', (req, res) => {
	var vm = {layout: 'DashboardLayouts.handlebars'};
	res.render('admin/admin-CapNhatThongTin',vm);
});

router.get('/admin-QuanLySanPham', (req, res) => {
	var vm = {layout: 'DashboardLayouts.handlebars'};
	res.render('admin/admin-QuanLySanPham',vm);
});

router.get('/admin-QuanLyNSX', (req, res) => {
	var vm = {layout: 'DashboardLayouts.handlebars'};
	res.render('admin/admin-QuanLyNSX',vm);
});

router.get('/admin-QuanLyDonHang', (req, res) => {
	var vm = {layout: 'DashboardLayouts.handlebars'};
	res.render('admin/admin-QuanLyDonHang',vm);
});

router.get('/QuenMatKhau', (req, res) => {
	var vm = {layout: 'AdminLayouts.handlebars'};
	res.render('admin/QuenMatKhau',vm);
});

router.get('/DangKi', (req, res) => {
	var vm = {layout: 'AdminLayouts.handlebars'};
	res.render('admin/DangKi',vm);
});

router.get('/login', (req, res) => {
	var vm = {layout: 'AdminLayouts.handlebars'};
	res.render('admin/login',vm);
});


router.post('/login', (req, res) => {
	var admin = {
		email: req.body.email,
		pass: SHA256(req.body.PWD).toString()
	};
	adminRepo.login(admin).then(rows => {

		if (rows.length > 0) {

            req.session.isLogged = true;
            req.session.admin = rows[0];

            res.send(rows[0]);
        }
        else
        {
        	var admin={
        		idAdmin : 0
        	}
        	res.send(admin);
        }
	});

});

// router.post('/register', (req, res) => {

// 	var dob = moment(req.body.dob, 'D/M/YYYY')
//         .format('YYYY-MM-DDTHH:mm');

// 	var user = {
// 		email: req.body.email,
// 		pass: SHA256(req.body.PWD).toString(),
// 		name: req.body.name,
// 		dob: dob,
// 		phone: req.body.phone,
// 		f_permission : 0,
// 		gt: 'Nam'
// 	};
 	
// 	nguoidungRepo.add(user).then(value => {

// 		if(value.affectedRows > 0)
// 		{
// 			nguoidungRepo.single(value.insertId).then(rows=> {
// 				req.session.isLogged = true;
// 				req.session.user = rows[0];
// 				req.session.cart = [];

// 				res.send(rows[0]);
// 			});
// 		}

// 	});

// });

// router.post('/logout', (req, res) => {
// 	req.session.isLogged = false;
//     req.session.user = null;

//     var ret = {
//     	succ: 1
//     };
//     res.send(ret);
// });

module.exports = router;