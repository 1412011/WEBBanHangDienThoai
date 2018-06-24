var express = require('express');

var sanphamRepo = require('../repos/sanphamRepo');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/shop/shopping')
});

router.get('/shopping', (req, res) => {

	res.render('shop/shopping')
});

router.get('/:namecat', (req, res) => {

	var namecat = req.params.namecat;
	var id;
	if(namecat === 'dien-thoai') id = 1;
	else id = 2;

	sanphamRepo.load_sp_theoloai(id).then(sps => {
		var vm = {
			sp: sps
		};

		res.render('shop/shopping', vm);
	});
});

module.exports = router; 