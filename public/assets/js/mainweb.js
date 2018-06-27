
$('document').ready(function(){ 

  $('a.add_to_cart').on('click',function(){

    var item_name = 'IPhone X 256 GB';
    var item_img = 'images/imgs/ip-x-w-0.png';
    var item_price = '34 790 000 đ';
    var item_quantity = 1;
    var li_item = `
                    <li class="item">
                      <a href="#" class="product-media"><img src="images/imgs/oppo-f5-0.png" alt="img"></a>
                      <div class="product-info">
                          <div class="price">
                              <label class="unit-price">10 000 000đ</label>
                              <label class="lable-mulx-minicart" style="color: #000;">x</label>                            
                              <a href="javascript:;" class="sign minus"><i class="fa fa-minus"></i></a>
                              <label class="quantity-mini-cart">1</label>                       
                              <a href="javascript:;" class="sign plus"><i class="fa fa-plus"></i></a>
                          </div>
                          <div class="product-name"><a href="#">OPPO F7 128 GB</a></div>
                      </div>
                      <a href="javascript:;" class="remove-li">x</a>
                    </li>  
                  `;
    $('ul.items').append(li_item); 
    var count = parseInt($('span.count:first').text());
    ++count;
    $('span.count').text(count);

    var total = getMoney($('.subtotal span:first').text());

    total = total + 10000000;

    var fm_total = formatMoney(total);
    $('.subtotal span').text(fm_total);
    $('.header-mini-cart span.total').text(fm_total);

  });

  // remove product cart 
  $('ul.items').on('click','.remove-li',function(){
    $(this).closest('li').remove();

    var count = parseInt($('span.count:first').text());
    --count;
    $('span.count').text(count);

    var c = $(this).parent().find('label.quantity-mini-cart').text();
    var count = parseInt(c);

    var unitprice = getMoney($(this).parent().find('label.unit-price').text());
    var total = getMoney($('.subtotal span:first').text());

    total = total - unitprice*count;

    var fm_total = formatMoney(total);
    $('.subtotal span').text(fm_total);
    $('.header-mini-cart span.total').text(fm_total);

  });

  //only press number product cart 
  $('#quantity-cart,#text-onlynumber').on('keypress',function(e){
    
      if(e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57))
      {
        return false;
      }
  });

  //  + -  số lượng ở mini cart
  $('ul.items').on('click','.price .minus',function(){
      var id = $(this).closest('li').index();
     var parent = $(this).parent();
      culc_money(-1, parent);
  });
  $('ul.items').on('click','.price .plus',function(){
     var id = $(this).closest('li').index();
     var parent = $(this).parent();
      culc_money(1, parent);
  });

  function culc_money(c, parent){
    var quantity = parseInt(parent.find('label.quantity-mini-cart').text());

      if(c < 0){
        if(quantity<2)return;
        --quantity;
      }else ++quantity;

       parent.find('label.quantity-mini-cart').text(quantity);
      
      //tăng tiền tổng
      var fm_price = parent.find('label.unit-price').text();
      var unitprice = getMoney(fm_price);

      var t = $('.subtotal span:first').text();
      var total = getMoney(t);

      if(c < 0){
          total = total - unitprice;
      }else total = total + unitprice;

      var fm_total = formatMoney(total);
      $('.subtotal span').text(fm_total);
      $('.header-mini-cart span.total').text(fm_total);
    
  }

  function getMoney(fm_money){
    var fm = fm_money.replace(/ /g,"");
    var fm = fm.replace("đ","");
    var money = parseInt(fm);
    return money;
  }
  function formatMoney(money){
    var strmoney = money.toString();

    var l = strmoney.length;
    var sodayphay = Math.ceil(l/3) - 1;
    for(var i = 1;i<= sodayphay; i++){
      strmoney = insert(strmoney,l-i*3,' ');
    }
    strmoney = strmoney + 'đ';
    return strmoney;
  }
  function insert(str, index, value) {
    return str.substr(0, index) + value + str.substr(index);
  }

  $('a.update').on('click',function(){
    var tr = `<tr class="cart-item">
                <td class="product-thumbnail" data-title="Image">
                    <a href="#"><img class="thumb-item-cart" src="images/items1.jpg" alt="img"/></a>
                </td>
                <td class="product-name" data-title="Product Name">
                    <a href="#">Apple The New MacBook Retina</a>
                </td>
                <td class="product-price" data-title="Price">
                    <span class="price">9690000</span>
                </td>
                <td class="product-quantity" data-title="Quantity">
                    <div class="quantity">
                        <a href="#" class="sign minus"><i class="fa fa-angle-left"></i></a>
                        <input type="text" id="quantity-cart" value="2" title="Qty" class="input-text qty text" size="1">
                        <a href="#" class="sign plus"><i class="fa fa-angle-right"></i></a>
                    </div>
                </td>
                <td class="product-subtotal" data-title="Total">
                    <span class="price">17590000</span>
                </td>
                <td class="product-remove">
                    <a href="javascript:;" class="remove-item-cart"><i class="fa fa-times"></i></a>
                </td>
            </tr>
          `;

    $('#list-item-cart').append(tr);
  });

  $('#list-item-cart').on('click', '.remove-item-cart' ,function(){
      $(this).closest('tr').remove();
  });

    $("#datepicker").datepicker({         
    autoclose: true,         
    todayHighlight: true 
    }).datepicker('update', new Date());

    // $('button.submit-login').on('click',function(){
    //     var user = $('.form-login-input form :text').val();
    //     var pass = $('.form-login-input form :password').val();

    //     if(user === 'user1' && pass === '123'){  
    //       $('.box-items-right .dropdown').toggleClass('hide-div');
    //       $('.box-items-right .login-register').toggleClass('hide-div');
    //       $('button.submit-login').attr('data-dismiss','modal');
    //     }else if(user === 'admin' && pass === '123'){
    //       window.location.href='./pages/admin-order.html';
    //     }else{
    //       $('button.submit-login').removeAttr('data-dismiss');
    //     }
    // });
      
    // $('.info-profile a.process').on('click',function(){
    //     var tr =`
    //           <tr>
    //               <td width="20%">Địa chỉ 1:</td>
    //               <td>146 Phố Hàng Gà, Ba Đình, Đông Anh, Hà Nội</td>
    //               <td><a href="javascript:;" class='remove-address'>xóa</a></td>
    //           </tr>
    //     `;
    //      $('#list-address-profile').append(tr);
    // });

    //
    // button dang nhap
    $('#btn-register-submit').on('click', function(e){
        e.preventDefault();
        var user = {
            email: $('#email-reg').val(),
            PWD: $('#pwd-reg').val(),
            name: $('#name-reg').val(),
            dob: $('#txtDOB').val(),
            phone: $('#phone-reg').val()
        }

        $.ajax({
            type: 'POST',
            url: '/account/register',
            contentType : "application/json",
            dataType : 'json',
            data: JSON.stringify(user),
            success: function(user){
              var div = `
                  <div class="dropdown">
                    <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-toggle="dropdown">${user.tenNguoiDung}
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/account/profile">Hồ Sơ</a></li>
                        <li><a href="/account/order-history">Đơn Hàng</a></li>
                        <li><a href="javascript:;" id="logout-user">Đăng xuất</a></li>
                    </ul>
                  </div>
              `;
              $('.box-items-right').append(div);
              $('.box-items-right .login-register').remove();
              $('#close-modal-register').click();
              swal("Đăng ký tài khoản thành công", "Bạn đã đăng nhập", "success");
            },
            error: function(e){
                console.log('ERROR: ' + e);
            }

        });
    }); 

    $('#btn-login-submit').on('click', function(e){
        e.preventDefault();

        var user = {
            email: $('#email-login').val(),
            PWD: $('#pwd-login').val()
        }

        $.ajax({
                  type: 'POST',
                  url: '/account/login',
                  contentType : "application/json",
                  dataType : 'json',
                  data: JSON.stringify(user),
                  success: function(user){
                    var div = `
                        <div class="dropdown">
                          <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-toggle="dropdown">${user.tenNguoiDung}
                          <span class="caret"></span></a>
                          <ul class="dropdown-menu">
                              <li><a href="/account/profile">Hồ Sơ</a></li>
                              <li><a href="/account/order-history">Đơn Hàng</a></li>
                              <li><a href="javascript:;" id="logout-user">Đăng xuất</a></li>
                          </ul>
                        </div>
                    `;
                    $('.box-items-right').append(div);
                    $('.box-items-right .login-register').remove();
                    $('#close-modal-login').click();
                    swal("Đăng nhập tài khoản thành công", "Bạn đã đăng nhập", "success");
                  },
                  error: function(e){
                      console.log('ERROR: ' + e);
                  }

              }); 
    });

    $('#logout-user').on('click', function(e){
        e.preventDefault();
        $.ajax({
                  type: 'POST',
                  url: '/account/logout',
                  contentType : "application/json",
                  dataType : 'json',
                  success: function(res){
                    var div = `
                        <div class="login-register " >
                            <a data-toggle="modal" href="#modal-login" class="">Đăng nhập</a>
                            <label> / </label>
                            <a data-toggle="modal" href="#modal-register" class="">Đăng ký</a>
                        </div>
                    `;
                    $('.box-items-right').append(div);
                    $('.box-items-right .dropdown').remove();
                    swal("Bạn đã đăng xuất", "Đăng nhập để lưu lịch sử mua hàng", "success");
                  },
                  error: function(e){
                      console.log('ERROR: ' + e);
                  }

              }); 
    });

    $('a.quick-view').on('click', function(){
        var id = +$(this).data('id');
        var user = {
          id: id
        }
        console.log(user);
        $.ajax({
                  type: 'POST',
                  url: '/product/quickview',
                  contentType : "application/json",
                  dataType : 'json',
                  data: JSON.stringify(user),
                  success: function(user){
                    console.log(user);
                      $('.preview-image-product').attr('src',user.duongDan);
                      $('.view-more').text(user.tenNhaSanXuat);
                      $('.product-title').text(user.tenSanPham);
                      $('#giaxemnhanh').text(formatMoney(user.gia));
                      $('#soluotxem').text(user.soLuotXem);
                      $('#soluongban').text(user.soLuongBan);
                      $('#soluongton').text(user.soLuongTon);

                      $('#modal-quickview').modal('show');
                  },
                  error: function(e){
                      console.log('ERROR: ' + e);
                  }

              }); 
    });

    $('#list-address-profile').on('click', '.remove-address' ,function(){
      $(this).closest('tr').remove();
  });

    $('.info-profile a.process').on('click',function(){
      $('.add-new-address').toggle(1000);
    });
    $('button.submit-add-address').on('click',function(){
        var sl = $('#list-address-profile tr').length;
        sl = sl + 1;
        var address = $('#addr').val();
        var tr =`
                  <tr>
                       <td width="20%">Địa chỉ `+sl+`:</td>
                       <td>`+address+`</td>
                       <td><a href="javascript:;" class='remove-address'>xóa</a></td>
                  </tr>
               `;
         $('#list-address-profile').append(tr);
    });

    $('#txtDOB').datepicker({
        "format": "dd/mm/yyyy",
        "autoclose": true,
    }).datepicker('update', new Date());

    //
    // validation register
    $('#email-reg').on('blur', function(){
        var email = $('#email-reg').val();
        if(email === ''){
            errorShow('Email không được trống');
            $('#email-reg').focus();
            return;
        }
        if(!isEmail(email)){
           errorShow('Email không chính xác (vd: @gmail, @yahoo ...)');
           $('#email-reg').focus();
           return;
        }
        errorHide();
    });
    $('#pwd-reg').on('blur', function(){
        var pwd = $('#pwd-reg').val();
        if(pwd === ''){
            errorShow('Mật khẩu không được trống');
            $('#pwd-reg').focus();
            return;
        }
        if(pwd.length < 5){
            errorShow('Mật khẩu phải dài hơn 4 ký tự');
            $('#pwd-reg').focus();
            return;
        }
        errorHide();
    });
    $('#repwd-reg').on('blur', function(){
        var vr = $('#repwd-reg').val();
        var re = $('#pwd-reg').val();
        if(vr !== re){
            errorShow('Mật khẩu không khớp');
            return;
        }
        errorHide();
    });
    $('#repwd-reg').on('blur', function(){
        var vr = $('#repwd-reg').val();
        var re = $('#pwd-reg').val();
        if(vr !== re){
            errorShow('Mật khẩu không khớp');
            return;
        }
        errorHide();
    });
    $('#name-reg').on('blur', function(){
        var vr = $('#name-reg').val();
        if(vr === ''){
            errorShow('Tên không được trống');
            return;
        }
        errorHide();
    });
    $('#phone-reg').on('blur', function(){
        var vr = $('#phone-reg').val();
        if(vr === ''){
            errorShow('Số điện thoại không được trống');
            return;
        }
        errorHide();
    });
    function errorShow(msg) {
        $('#error-register').text(msg);
        $('#error-register').removeClass('hide-div');
    }
    function errorHide() {
        $('#error-register').addClass('hide-div');
    }

    $('#email-login').on('blur', function(){
        var email = $('#email-login').val();
        if(email === ''){
            errorShowlogin('Email không được trống');
            $('#email-login').focus();
            return;
        }
        if(!isEmail(email)){
           errorShow('Email không chính xác (vd: @gmail, @yahoo ...)');
           $('#email-login').focus();
           return;
        }
        errorHidelogin();
    });
    function errorShowlogin(msg) {
        $('#error-login').text(msg);
        $('#error-login').removeClass('hide-div');
    }
    function errorHidelogin() {
        $('#error-login').addClass('hide-div');
    }

      function isEmail(email) {
      var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      return regex.test(email);
    }
    //
    //

});

  function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
  }

  // Get the element with id="defaultOpen" and click on it
  document.getElementById("defaultOpen").trigger('click');
