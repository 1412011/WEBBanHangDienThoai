var express = require('express');
var exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
var path = require('path');
var bodyParser = require('body-parser');
var wnumb = require('wnumb');

var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);

var homeController = require('./controllers/homeController'),
	cartController = require('./controllers/cartController'),
	accountController = require('./controllers/accountController'),
    adminController = require('./controllers/adminController'),
	productController = require('./controllers/productController'),
	shopController = require('./controllers/shopController');
 
var handle404MDW = require('./middle-wares/handle404'),
    handleLayoutMDW = require('./middle-wares/handleLayout');

var app = express();

var sanphamRepo = require('./repos/sanphamRepo');
 
app.engine('hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: express_handlebars_sections(),
        number_format: n => {
            var nf = wnumb({
                thousand: ' ',
                suffix: 'đ'
            });
            return nf.to(n);
        },
        minus_1_interger: n =>{
            return n-1;
        },
        plus_1_interger: n => {
            return n+1;
        },
    } 
}));
app.set('view engine', 'hbs');

app.use(express.static(path.resolve(__dirname, 'public')));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));
 
// session

var sessionStore = new MySQLStore({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'quanlybanhang',
    createDatabaseTable: true,
    schema: {
        tableName: 'sessions',
        columnNames: {
            session_id: 'session_id',
            expires: 'expires',
            data: 'data'
        }
    }
});

app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false
}));

app.use(handleLayoutMDW);

app.get('/', (req, res) => {
	res.redirect('/home');
});

app.use('/home', homeController);
app.use('/shop', shopController);
app.use('/cart', cartController);
app.use('/product', productController);
app.use('/account', accountController);
app.use('/admin', adminController);

app.use(handle404MDW); 

app.listen(3333, () => {
    console.log('Site running on port 3333');
});

