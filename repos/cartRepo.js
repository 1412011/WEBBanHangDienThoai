exports.add = (cart, item) => {
    for (i = cart.length - 1; i >= 0; i--) {
        if (cart[i].idSanPham === item.idSanPham) {
            cart[i].Quantity += item.Quantity;
            return;
        }
    }

    cart.push(item);
}

exports.remove = (cart, idSanPham) => {
    for (var i = cart.length - 1; i >= 0; i--) {
        if (idSanPham === cart[i].idSanPham) {
            cart.splice(i, 1);
            return;
        }
    }
}