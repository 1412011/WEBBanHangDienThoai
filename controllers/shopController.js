var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/shop/shopping')
});

router.get('/shopping', (req, res) => {
	res.render('shop/shopping')
});

module.exports = router; 