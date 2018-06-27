
var express = require('express'),
	SHA256 = require('crypto-js/sha256'),
    moment = require('moment');

var restrict = require('../middle-wares/restrict'),
	nguoidungRepo = require('../repos/nguoidungRepo');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/account/profile')
});

router.get('/profile', restrict, (req, res) => {
	res.render('account/profile');
});

router.get('/order-history', restrict, (req, res) => {
	res.render('account/order-history');
});

router.get('/register', (req, res) => {
	res.render('account/register');
});

router.get('/login', (req, res) => {
	res.render('account/login');
});


router.post('/login', (req, res) => {
	var user = {
		email: req.body.email,
		pass: SHA256(req.body.PWD).toString()
	};
	nguoidungRepo.login(user).then(rows => {

		if (rows.length > 0) {

            req.session.isLogged = true;
            req.session.user = rows[0];
            req.session.cart = [];

            res.send(rows[0]);
        }
        else
        {
        	var user={
        		idNguoiDung : 0
        	}
        	res.send(user);
        }
	});

});

router.post('/register', (req, res) => {

	var dob = moment(req.body.dob, 'D/M/YYYY')
        .format('YYYY-MM-DDTHH:mm');

	var user = {
		email: req.body.email,
		pass: SHA256(req.body.PWD).toString(),
		name: req.body.name,
		dob: dob,
		phone: req.body.phone,
		f_permission : 0,
		gt: 'Nam'
	};
 	
	nguoidungRepo.add(user).then(value => {

		if(value.affectedRows > 0)
		{
			nguoidungRepo.single(value.insertId).then(rows=> {
				req.session.isLogged = true;
				req.session.user = rows[0];
				req.session.cart = [];

				res.send(rows[0]);
			});
		}

	});

});

router.post('/logout', (req, res) => {
	req.session.isLogged = false;
    req.session.user = null;

    var ret = {
    	succ: 1
    };
    res.send(ret);
});

module.exports = router;