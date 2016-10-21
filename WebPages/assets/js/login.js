
$(function () {

    /*
        Fullscreen background
    */
    $.backstretch("assets/img/backgrounds/1.jpg");

    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function () {
        $(this).removeClass('input-error');
        $("p.log_alert").html("");
    });

    $(document).on("click", "#btn_login", function (e) {
        var is_error = false;
        var user_name = $('input[name="form-username"]');
        var user_pwd = $('input[name="form-password"]');
        $('input[type="text"], input[type="password"], textarea').each(function () {
            if ($(this).val() == "") {
                e.preventDefault();
                $(this).addClass('input-error');
                $("p.log_alert").attr("style", "color:red").html("请输入用户名和密码.");
                is_error = true;
            }
            else {
                $(this).removeClass('input-error');
            }
        });
        //if (!is_error) {
        //    var str = GetDataByAjax("myHandler.ashx", "getmenu", "", "", { username: user_name.val(), pwd: user_pwd.val() });
        //}

    });
});
