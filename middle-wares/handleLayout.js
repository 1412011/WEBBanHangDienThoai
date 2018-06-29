var cartRepo = require('../repos/cartRepo');
var sanphamRepo = require('../repos/sanphamRepo');

module.exports = (req, res, next) => {
	
	if (req.session.isLogged === undefined) {
		req.session.isLogged = false;
	}
	var count = 0;
	var total = 0;
	var items = [];
	var arr_p = [];
    for (var i = 0; i < req.session.cart.length; i++) {
        var cItem = req.session.cart[i];
        var p = sanphamRepo.load_1_sp(cItem.idSanPham);
        arr_p.push(p); 
    }

	Promise.all(arr_p).then(result => {
        for (var i = result.length - 1; i >= 0; i--) {
            var pro = result[i][0];
            var item = {
                sp: pro,
                soluong: req.session.cart[i].Quantity,
                Amount: pro.gia * req.session.cart[i].Quantity
            };
            items.push(item);

            total += item.Amount;
            count += req.session.cart[i].Quantity;
        }

   //      var vm ={
			// isLogged: req.session.isLogged,
	  //       curUser: req.session.user,
	  //       isNumCart: req.session.cart.length !== 0,
	  //       items: items,
	  //       total: total,
	  //       count: count
   //      }
   //      console.log(vm);

        	res.locals.layoutVM = {
			isLogged: req.session.isLogged,
	        curUser: req.session.user,
	        isNumCart: req.session.cart.length !== 0,
	        items: items,
	        total: total,
	        count: count
        };

    });


	next();
};