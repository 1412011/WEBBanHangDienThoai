
var express = require('express');
var sanphamRepo = require('../repos/sanphamRepo');
var hinhanhRepo = require('../repos/hinhanhRepo');
var thongsoktRepo = require('../repos/thongsoktRepo');

var config = require('../config/config');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/product/product-detail')
});

router.get('/product-detail', (req, res) => {

	var idsp = req.query.id;

	var p1 = sanphamRepo.single(idsp);
	var p2 = hinhanhRepo.load_1_product(idsp, 1);
	var p3 = hinhanhRepo.load_1_product(idsp, 2);

	Promise.all([p1,p2,p3]).then(([s, h, f]) => { 

		var p4 = sanphamRepo.load_cungloai(s, 5, 1);
		var p5 = sanphamRepo.load_cungloai(s, 2, 6);
		var p6 = sanphamRepo.load_cungnsx(s, 7, 1);
		Promise.all([p4,p5,p6]).then(([cloai, cloai2 ,cnsx]) => { 
			
			var lengths=[];
	  		for(var i = 1 ; i <= f.length; i++){
	  			lengths.push(i);
	  		}

			var vm = {
				sp: s,
				ha: h,
				f_ha: f,
				lg: lengths,
				loai: cloai,
				loai2: cloai2,
				nsx: cnsx
			};

			res.render('product/product-detail', vm);
		});
	});
});

router.post('/quickview', (req, res) => {
	
	sanphamRepo.load_1_sp(req.body.id).then(rows => {

			res.send(rows[0]);
	});
});


module.exports = router;