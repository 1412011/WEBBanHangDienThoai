
var express = require('express');
var sanphamRepo = require('../repos/sanphamRepo');
var hinhanhRepo = require('../repos/hinhanhRepo');
var thongsoktRepo = require('../repos/thongsoktRepo');

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

  		var lengths=[];
  		for(var i = 1 ; i <= f.length; i++){
  			lengths.push(i);
  		}

		var vm = {
			sp: s,
			ha: h,
			f_ha: f,
			lg: lengths
		};
		res.render('product/product-detail', vm);
	});
});



module.exports = router;