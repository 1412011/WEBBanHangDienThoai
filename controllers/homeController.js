var express = require('express');
var sanphamRepo = require('../repos/sanphamRepo');
var hinhanhRepo = require('../repos/hinhanhRepo');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/home/index');
});

router.get('/index', (req, res) => {
	
	var p1 = sanphamRepo.load_sp_Lasest();
	var p2 = sanphamRepo.load_sp_MostView();
	var p3 = sanphamRepo.load_sp_BestSeller();
	var p4 = sanphamRepo.load_sp_sieupham_dt();
	var p5 = sanphamRepo.load_sp_sieupham_mtb();

	Promise.all([p1,p2,p3,p4,p5]).then(([lrows, vrows, srows, bdt, bmtb]) => {

		var vm = {
			splast: lrows,
			spview: vrows,
			spsell: srows,
			spbestdt: bdt,
			spbestmtb: bmtb
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
