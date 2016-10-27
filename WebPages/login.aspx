<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebPages.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>欢迎登录</title>
    <link rel="stylesheet" type="text/css" href="resources/css/theme/entrance.teal.css" />
    <link href="resources/css/ui.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/base.css" rel="stylesheet" type="text/css" />
    <script src="resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="resources/js/config.js" type="text/javascript"></script>
    <script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
    <script type="text/javascript">

        //误删，避免frameset中的登陆界面session过期在子框架加载的问题
        if (top.location != self.location) {
            top.location = self.location;
        }

        /*function check(){
	    	var username = $("#txtUsername").val();
            var password = $("#txtPassword").val();
            var authCode = $("#authCode").val();
            if (username == "")            {
                Public.tips({type: 1, content : '账号不能为空!'});
                $("#txtUsername").focus();
                return false;
            }
            if (password == "")            {
                Public.tips({type: 1, content : '密码不能为空!'});
                $("#txtPassword").focus();
                return false;
            }
            if(authCode==""){
            	Public.tips({type: 1, content : '验证码不能为空!'});
                $("#authCode").focus();
                return false;
            }
            return true;
	    }*/

        function showImage(node) {
            var imageHtml = '<img src="authImg?rand=' + Math.random() + '" onclick="showImage(this);" width="100" height="26"/>';
            $(node).replaceWith(imageHtml);
        }
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
                                        <input type="text" name="form-username" id="wscrm_Username" class="login-text" value="admin" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                    <td class="left">
                                        <input type="password" name="form-password" id="wscrm_Password" class="login-text" value="21232f297a57a5a743894a0e4a801fc3" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="right">验证码：</td>
                                    <td class="left">
                                        <input type="text" name="authCode" id="authCode" class="login-text" style="width: 90px;" />
                                        <img alt="" src="authImg" onclick="showImage(this)" width="100" height="25" style="vertical-align: middle;">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
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
                    <h1 class="t-orgname">工程项目资金与合同管理系统&nbsp;&raquo;</h1>
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
                <span style="font-family: 'Microsoft Yahei', arial, Sans-Serif;">&copy;</span> 2014 宜昌望朔信息科技有限责任公司 Wangshuo Co.,Ltd.
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    Powered  by WSMIS.
            </p>
        </div>
    </div>
</body>
</html>
