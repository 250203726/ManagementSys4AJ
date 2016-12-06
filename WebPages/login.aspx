<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebPages.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>欢迎登录</title>
    <link rel="stylesheet" type="text/css" href="resources/css/theme/entrance.teal.css" />
    <link rel="shoucut icon" href="assets/ico/favicon.png" type="image/x-icon"/>
    <link href="resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/base.css" rel="stylesheet" type="text/css" />
    <link href="assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <script src="resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="assets/lib/ligerUI/js/ligerui.all.js"></script>
    
    
   
    <script src="assets/js/Util.js"></script>
    <script type="text/javascript">
        var server_data;
        //误删，避免frameset中的登陆界面session过期在子框架加载的问题
        if (top.location != self.location) {
            top.location = self.location;
        }
        function check() {
            var username = $("#wscrm_Username").val();
            var password = $("#wscrm_Password").val();
            var authCode = $("#authCode").val();
            if (username == "") {
                $("#wscrm_Username").focus();
                myAlerts("请输入用户名！", "提示", "warn");
                return false;
            }
            if (password == "") {
                $("#wscrm_Password").focus();
                myAlerts("请输入密码！", "提示", "warn");
                return false;
            }
            if (authCode == "") {
                $("#authCode").focus();
                myAlerts("请输入验证码！", "提示", "warn");
                return false;
            }
            return true;
        }

        function showImage(node) {
            $(node).attr("src", "Validate.aspx?rand=" + Math.random());
        }
        
        $(function () {
            $(document).on("click", "input[type=submit]", function (e) {
                if (!check()) {
                    e.stopPropagation();
                    e.preventDefault();
                }
            });

            //处理服务器返回
            var server_json = $.parseJSON(server_data);
            if (server_json && !server_json.status) {
                myAlerts(server_json.msg, "提示", "warn");
            }
        });

    </script>
</head>
<body>
    <div class="loginbox">
        <div class="loginlogo"></div>
        <div class="loginpanel">
            <div class="panel-h"></div>
            <div class="panel-c">
                <div class="panel-c-l">
                    <form runat="server" role="form" action="login.aspx" method="post">
                        <table>
                            <tbody>
                                <tr>
                                    <td colspan="2" style="text-align: left;">
                                        <h3>
                                            <em class="title">&nbsp;管 理 登 录</em>
                                            <em class="icn-border direct-r r-ext"></em>
                                        </h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="right">账&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
                                    <td style="text-align: left;">
                                        <input type="text" name="form-username" id="wscrm_Username" class="login-text" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                    <td class="left">
                                        <input type="password" name="form-password" id="wscrm_Password" class="login-text" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="right">验证码：</td>
                                    <td class="left">
                                        <input type="text" name="authCode" id="authCode" class="login-text" style="width: 90px;" />
                                        <img alt="" src="Validate.aspx" onclick="showImage(this)" width="100" height="25" style="vertical-align: middle;"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        <div class="ht_10"></div>
                                        <a class="login-btn" href="index.aspx">
                                            <input type="submit" value="登&nbsp;&nbsp;录&nbsp;&nbsp;" class="login-btn" />
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="panel-c-r">
                    <h1 class="t-orgname">内部管理系统&nbsp;&raquo;</h1>
                    <div class="ht_10"></div>
                    <div>
                        <ul class="ul-tips">
                            <li>请从左侧输入账号和密码</li>
                            <li>如果遇到系统问题，请联系网络管理员。</li>
                            <li>如果没有账号，请联系网站管理员。 </li>
                        </ul>
                    </div>
                    <p>...</p>
                </div>
            </div>
            <div class="panel-f"></div>
        </div>
        <div class="logincopyright">
            <p>
                <span style="font-family: 'Microsoft Yahei', arial, Sans-Serif;">&copy;</span> 2016 新兵工作室 N_Bers Co.,Ltd.
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    Powered  by N_Bers.
            </p>
        </div>
    </div>
</body>
</html>
