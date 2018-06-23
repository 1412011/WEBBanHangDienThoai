var express = require('express');

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

module.exports = router; 