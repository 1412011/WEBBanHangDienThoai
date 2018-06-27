var express = require('express');

var sanphamRepo = require('../repos/sanphamRepo');
var nhasanxuatRepo = require('../repos/nhasanxuatRepo');
var loaisanphamRepo = require('../repos/loaisanphamRepo');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/shop/tat-ca-san-pham');
});

router.get('/tat-ca-san-pham', (req, res) => {

	var p1 = sanphamRepo.loadAll();
	var p2 = nhasanxuatRepo.loadAll_in_all_product();

	Promise.all([p1,p2]).then(([rsp, rnsx]) => {
	
		var vm ={
			sp: rsp,
			nsx: rnsx
		};
		res.render('shop/shopping', vm)
	
	});
});

router.get('/:namecat', (req, res) => {

	var namecat = req.params.namecat;
	var id;
	// if(namecat === 'dien-thoai') id = 1;
	// else id = 2;
	loaisanphamRepo.load_from_name(namecat).then(cats => {

		if(cats.length>0){
			id = cats[0].idLoaiSanPham;

			var p1 = sanphamRepo.load_sp_theoloai(id);
			var p2 = nhasanxuatRepo.loadAll_in_cat_product(id);

			Promise.all([p1,p2]).then(([rsp, rnsx]) => {
			
				var vm ={
					sp: rsp,
					nsx: rnsx
				};
				res.render('shop/shopping', vm)
			
			});
		}
	});

});

router.get('/:ncat/:nnsx', (req, res) => {

	var namecat = req.params.ncat;
	var namensx = req.params.nnsx;

	var p1 = loaisanphamRepo.load_from_name(namecat);
	var p2 = nhasanxuatRepo.load_from_name(namensx);

	Promise.all([p1,p2]).then(([rloai, rnsx]) => {

		if(rloai.length > 0 && rnsx.length > 0)
		{
			var idloai = rloai[0].idLoaiSanPham;
			var idnsx = rnsx[0].idNhaSanXuat;

			var p3 = sanphamRepo.load_sp_theoloai_nsx(idloai, idnsx);
			var p4 = nhasanxuatRepo.loadAll_in_cat_nsx_product(idloai, idnsx);

			Promise.all([p3,p4]).then(([rsp, rnsx]) => {
			
				var vm ={
					sp: rsp,
					nsx: rnsx
				};
				res.render('shop/shopping', vm)
			
			});
		}
		
	});
});

module.exports = router; 