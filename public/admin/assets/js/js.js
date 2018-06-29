window.onscroll = function() {
            var scrollBottom = $(window).scrollTop() + $(window).height();
			if (document.documentElement.scrollTop > 10) {
                $("#pre-header").addClass("pre-header-fixed").removeClass("pre-header");
                $("#header").addClass("header-fixed").removeClass("header");
        		$("#AnhLogo").addClass("AnhLogo-fixed").removeClass("AnhLogo");
                $("#NavbarSearch").addClass("NavbarSearch-fixed").removeClass("NavbarSearch");
                $("#NavBar").addClass("NavBar-fixed").removeClass("NavBar");
            };

            if (document.documentElement.scrollTop > 348) {
                $("#CotCategory").addClass("CotCategory-fixed");
            }

            if (document.documentElement.scrollTop > 40) {
                $("#CotCategory2").addClass("CotCategory-fixed");
            }

    		if (document.documentElement.scrollTop < 10) {
                $("#pre-header").addClass("pre-header").removeClass("pre-header-fixed");
                $("#header").addClass("header").removeClass("header-fixed");
        		$("#AnhLogo").addClass("AnhLogo").removeClass("AnhLogo-fixed");
                $("#NavbarSearch").addClass("NavbarSearch").removeClass("NavbarSearch-fixed");
                $("#NavBar").addClass("NavBar").removeClass("NavBar-fixed");
            };

            if (document.documentElement.scrollTop < 348) {
                $("#CotCategory").removeClass("CotCategory-fixed");
            }

            if (document.documentElement.scrollTop < 40) {
                $("#CotCategory2").removeClass("CotCategory-fixed");
            }
		};

$(document).ready(function(){
    $("#TaiKhoan").click(function(){
        $("#PopupTaiKhoan").toggle();
    });

    $("#TaiKhoanEmail").click(function(){
        $("#subTaiKhoanEmail").toggle();
    });
});
