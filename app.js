var express = require('express');
var exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
var path = require('path');

var app = express();

var sanphamRepo = require('./repos/sanphamRepo');
 
app.engine('hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: express_handlebars_sections()
    } 
}));
app.set('view engine', 'hbs');

app.use(express.static(path.resolve(__dirname, 'public')));

app.get('/', (req, res) => {
	res.redirect('/home/index');
});

app.get('/home/index', (req, res) => {
	res.render('home/index')
});
app.get('/home/about', (req, res) => {
	res.render('home/about')
});

app.get('/shop/shopping', (req, res) => {
	res.render('shop/shopping')
});

app.get('/cart/cart', (req, res) => {
	res.render('cart/cart')
});

app.get('/cart/order', (req, res) => {
	res.render('cart/order')
});

app.get('/cart/checkout', (req, res) => {
	res.render('cart/checkout')
});

app.listen(3333, () => {
    console.log('Site running on port 3333');
});

