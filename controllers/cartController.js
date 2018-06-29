var express = require('express');
var cartRepo = require('../repos/cartRepo');
var sanphamRepo = require('../repos/sanphamRepo');

var router = express.Router();

router.get('/', (req, res) => {
	res.redirect('/cart/cart')
});

router.get('/cart', (req, res) => {
	res.render('cart/cart')
});

router.get('/order', (req, res) => {
	res.render('cart/order')
});

router.get('/checkout', (req, res) => {
	res.render('cart/checkout')
});

router.post('/add', (req, res) =>{
	var item = {
        idSanPham: req.body.idSanPham,
        Quantity: req.body.soluong,
    };

    if(item.idSanPham > 0)
	{
	    cartRepo.add(req.session.cart, item);
	    sanphamRepo.load_1_sp(item.idSanPham).then(r => {
	    	if(r.length > 0){
	    		var vm = {
	    			sp: r[0],
	    			soluong: item.Quantity,
	    			isResult: 1
	    		}
				res.send(vm);
	    	}else{
	    		res.send({isResult: 0});
	    	}
	    })
	}else{
		res.send({isResult: 0});
	}


});
module.exports = router; 