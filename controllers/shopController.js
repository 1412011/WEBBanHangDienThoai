var express = require('express');

var sanphamRepo = require('../repos/sanphamRepo');
var nhasanxuatRepo = require('../repos/nhasanxuatRepo');
var loaisanphamRepo = require('../repos/loaisanphamRepo');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/shop/tat-ca-san-pham');
});

router.get('/tat-ca-san-pham', (req, res) => {

	var spage = req.query.page;
    if (!spage) {
        spage = 1;
    }
    var page = +spage;

    var PRODUCT_PER_PAGE = 6;
    var offset = (page - 1) * PRODUCT_PER_PAGE;

	var p1 = sanphamRepo.loadAll_limit(PRODUCT_PER_PAGE, offset);  
	var p2 = nhasanxuatRepo.loadAll_in_all_product();
	var p3 = sanphamRepo.countAll();

	Promise.all([p1,p2,p3]).then(([rsp, rnsx, count]) => {
		
		var total = count[0].total;
		var nPages = total / PRODUCT_PER_PAGE;
        if (total % PRODUCT_PER_PAGE > 0) { 
            nPages++;
        }

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }

		var vm ={
					sp: rsp,
					nsx: rnsx,
					page_numbers: numbers,
					curPage: page,
					max_page: nPages,
					isMaxPage: page === nPages,
					isMinPage: page === 1,
				};
		res.render('shop/shopping', vm)
	
	});
});

router.get('/:namecat', (req, res) => {

	var spage = req.query.page;
    if (!spage) {
        spage = 1;
    }
    var page = +spage;

    var PRODUCT_PER_PAGE = 6;
	var offset = (page - 1) * PRODUCT_PER_PAGE;
	var namecat = req.params.namecat;
	var id;
	// if(namecat === 'dien-thoai') id = 1;
	// else id = 2;
	loaisanphamRepo.load_from_name(namecat).then(cats => {

		if(cats.length>0){
			id = cats[0].idLoaiSanPham;

			var p1 = sanphamRepo.load_theoloai_limit(id, PRODUCT_PER_PAGE, offset);
			var p2 = nhasanxuatRepo.loadAll_in_cat_product(id);
			var p3 = sanphamRepo.count_loai(id);

			Promise.all([p1,p2,p3]).then(([rsp, rnsx, count]) => {
			
				var total = count[0].total;
				var nPages = total / PRODUCT_PER_PAGE;
		        if (total % PRODUCT_PER_PAGE > 0) { 
		            nPages++;
		        }

		        var numbers = [];
		        for (i = 1; i <= nPages; i++) {
		            numbers.push({
		                value: i,
		                isCurPage: i === page
		            });
		        }

				var vm ={
					sp: rsp,
					nsx: rnsx,
					page_numbers: numbers,
					curPage: page,
					max_page: nPages,
					isMaxPage: page === nPages,
					isMinPage: page === 1,
				};
				res.render('shop/shopping', vm)
			
			});
		}
	});

});

router.get('/:ncat/:nnsx', (req, res) => {

	var spage = req.query.page;
    if (!spage) {
        spage = 1;
    }
    var page = +spage;

    var PRODUCT_PER_PAGE = 6;
    var offset = (page - 1) * PRODUCT_PER_PAGE;
	var namecat = req.params.ncat;
	var namensx = req.params.nnsx;

	var p1 = loaisanphamRepo.load_from_name(namecat);
	var p2 = nhasanxuatRepo.load_from_name(namensx);

	Promise.all([p1,p2]).then(([rloai, rnsx]) => {

		if(rloai.length > 0 && rnsx.length > 0)
		{
			var idloai = rloai[0].idLoaiSanPham;
			var idnsx = rnsx[0].idNhaSanXuat;

			var p3 = sanphamRepo.load_theoloainsx_limit(idloai, idnsx, PRODUCT_PER_PAGE, offset);
			var p4 = nhasanxuatRepo.loadAll_in_cat_nsx_product(idloai, idnsx);
			var p5 = sanphamRepo.count_loainsx(idloai, idnsx);

			Promise.all([p3,p4, p5]).then(([rsp, rnsx, count]) => {
			
				var total = count[0].total;
				var nPages = total / PRODUCT_PER_PAGE;
		        if (total % PRODUCT_PER_PAGE > 0) { 
		            nPages++;
		        }

		        var numbers = [];
		        for (i = 1; i <= nPages; i++) {
		            numbers.push({
		                value: i,
		                isCurPage: i === +page
		            });
		        }

				var vm ={
					sp: rsp,
					nsx: rnsx,
					page_numbers: numbers,
					curPage: page,
					max_page: nPages,
					isMaxPage: page === nPages,
					isMinPage: page === 1,
				};
				res.render('shop/shopping', vm)
			
			});
		}
		
	});
});

module.exports = router; 