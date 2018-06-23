var express = require('express');
var sanphamRepo = require('../repos/sanphamRepo');
var hinhanhRepo = require('../repos/hinhanhRepo');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/home/index');
});

router.get('/index', (req, res) => {
	
	var p1 = sanphamRepo.load_12_Lasest();
	var p2 = sanphamRepo.load_12_MostView();
	var p3 = sanphamRepo.load_12_BestSeller();

	Promise.all([p1,p2,p3]).then(([lrows, vrows, srows]) => {

		var vm = {
			splast: lrows,
			spview: vrows,
			spsell: srows
		};

		res.render('home/index', vm);
	});
});

router.get('/about', (req, res) => {
	res.render('home/about');
});

router.get('/error', (req, res) => {
	res.render('error/index');
});

module.exports = router; 
