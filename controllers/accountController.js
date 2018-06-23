
var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/account/profile')
});

router.get('/profile', (req, res) => {
	res.render('account/profile');
});

router.get('/order-history', (req, res) => {
	res.render('account/order-history');
});


module.exports = router;