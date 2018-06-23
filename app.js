var express = require('express');
var exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
var path = require('path');
var bodyParser = require('body-parser');
var wnumb = require('wnumb');

var homeController = require('./controllers/homeController'),
	cartController = require('./controllers/cartController'),
	accountController = require('./controllers/accountController'),
	productController = require('./controllers/productController'),
	shopController = require('./controllers/shopController');

var app = express();

var sanphamRepo = require('./repos/sanphamRepo');
 
app.engine('hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: express_handlebars_sections(),
        number_format: n => {
            var nf = wnumb({
                thousand: ','
            });
            return nf.to(n);
        }
    } 
}));
app.set('view engine', 'hbs');

app.use(express.static(path.resolve(__dirname, 'public')));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.get('/', (req, res) => {
	res.redirect('/home');
});

app.use('/home', homeController);
app.use('/shop', shopController);
app.use('/cart', cartController);
app.use('/product', productController);
app.use('/account', accountController);

app.listen(3333, () => {
    console.log('Site running on port 3333');
});

