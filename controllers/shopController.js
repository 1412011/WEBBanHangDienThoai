var express = require('express');

var sanphamRepo = require('../repos/sanphamRepo');
var nhasanxuatRepo = require('../repos/nhasanxuatRepo');
var loaisanphamRepo = require('../repos/loaisanphamRepo');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/shop/tat-ca-san-pham');
});

router.get('/tat-ca-san-pham', (req, res) => {

	sanphamRepo.loadAll().then(rows => {
		var vm ={
			sp: rows
		};
		res.render('shop/shopping', vm)
	});
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

router.get('/:ncat/:nnsx', (req, res) => {

	var namecat = req.params.ncat;
	var namensx = req.params.nnsx;

	var p1 = loaisanphamRepo.load_from_name(namecat);
	var p2 = nhasanxuatRepo.load_from_name(namensx);

	Promise.all([p1,p2]).then(([rloai, rnsx]) => {

		var idloai = rloai[0].idLoaiSanPham;
		var idnsx = rnsx[0].idNhaSanXuat;

		sanphamRepo.load_sp_theoloai_nsx(idloai, idnsx).then(sps => {

			var vm = {
			sp: sps
		};
	 	res.render('shop/shopping', vm);

	 	}); 
	});
});

module.exports = router; 