<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebPages.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>后台管理系统</title>
    <link rel="shoucut icon" href="assets/ico/favicon.ico" type="image/x-icon"/>
    <link href="resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/ui.css" rel="stylesheet" type="text/css" />

    <script src="assets/lib/jquery/jquery-1.9.0.min.js"></script>
    <script src="assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="assets/lib/jquery.cookie.js" type="text/javascript"></script>
    <script src="assets/lib/json2.js"></script>
    <script src="assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tab = null;
        var accordion = null;
        var tree = null;
        var tabItems = [];
        var sysKey=<%=sysKeyValue%>;
        var sidebarData = GetDataByAjax('../NB_JsonHttp.aspx', "getParentMenusByJson");
        var navigateData = GetDataByAjax('../NB_JsonHttp.aspx', "getSubMenusByJson");
        $(function () {
            //自定义步骤，写入一级菜单资源的 HTML，需在 LigerUI 布局方法之前完成
            var tempHtml = "";
            $.each(sidebarData.data, function () {
                tempHtml += "<div title='" + this.name + "' class='1-scroll'>"
						   + "	<ul data-module='" + this.moduleId + "' id='tree_" + this.menuId + "' style='margin-top:1px;'>"
						   + "</div>";
            });
            $("#accordion1").html(tempHtml);

            //布局
            $("#layout1").ligerLayout({ leftWidth: 190, height: '100%', heightDiff: -32, space: 0, onHeightChanged: f_heightChanged });

            var height = $(".l-layout-center").height();

            //Tab
            $("#framecenter").ligerTab({
                height: height,
                showSwitchInTab: true,
                showSwitch: true,
                onAfterAddTabItem: function (tabdata) {
                    tabItems.push(tabdata);
                    saveTabStatus();
                },
                onAfterRemoveTabItem: function (tabid) {
                    for (var i = 0; i < tabItems.length; i++) {
                        var o = tabItems[i];
                        if (o.tabid == tabid) {
                            tabItems.splice(i, 1);
                            saveTabStatus();
                            break;
                        }
                    }
                },
                onReload: function (tabdata) {
                    var tabid = tabdata.tabid;
                }
            });

            //面板
            $("#accordion1").ligerAccordion({
                height: height - 32,
                speed: null
            });

            $(".l-link").hover(function () {
                $(this).addClass("l-link-over");
            }, function () {
                $(this).removeClass("l-link-over");
            });

            //Build Tress 菜单资源树
            var treeArray = $("#accordion1>.l-accordion-content>ul");
            $.each(treeArray, function () {
                //取得某一个 ul#tree 的code
                var moduleId = $(this).attr("data-module");
                //根据 code 过滤 navigateData 中属于该 code 的子菜单资源
                var myData = $.grep(navigateData.data, function (item) {
                    return item.moduleId == moduleId;
                }, false);

                //实例化一个ligerTree()
                $(this).ligerTree({
                    data: myData,
                    isExpand: false,
                    checkbox: false,
                    slide: true,
                    btnClickToToggleOnly: false,
                    nodeWidth: 120,
                    idFieldName: 'menuId',
                    parentIDFieldName: 'parentId',
                    textFieldName: 'name',
                    onClick: function (node) {
                        if (!node.data.url) return;
                        var tabid ="tab_"+ node.data.id;
                        if (!tabid) {
                            $(node.target).attr("tabid", tabid);
                        }
                        f_addTab(tabid, node.data.name, node.data.url);
                    }
                });
            });

            tab = liger.get("framecenter");
            accordion = liger.get("accordion1");


            tree = liger.get("tree1");
            $("#pageloading").hide();


            //页签初始化
           // pages_init();			
        });

        //高度适应
        function f_heightChanged(options) {
            if (tab)
                tab.addHeight(options.diff);
            if (accordion && options.middleHeight - 32 > 0)
                accordion.setHeight(options.middleHeight - 32);
        }

        //添加页签
        function f_addTab(tabid, text, url) {
            tab.addTabItem({
                tabid: tabid,
                text: text,
                url: url
            });
        }

        //页签初始化
        function pages_init() {
            var tabJson = $.cookie('liger-home-tab');
            if (tabJson) {
                var tabitems = JSON2.parse(tabJson);
                for (var i = 0; tabitems && tabitems[i]; i++) {
                    f_addTab(tabitems[i].tabid, tabitems[i].text, tabitems[i].url);
                }
            }
        }

        //保存页签状态
        function saveTabStatus() {
           // $.cookie('liger-home-tab', JSON2.stringify(tabItems));
        }



        //附加 <link> 资源
        function attachLinkToFrame(iframeId, filename) {
            if (!window.frames[iframeId]) return;
            var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
            var fileref = window.frames[iframeId].document.createElement("link");
            if (!fileref) return;
            fileref.setAttribute("rel", "stylesheet");
            fileref.setAttribute("type", "text/css");
            fileref.setAttribute("href", filename);
            head.appendChild(fileref);
        }

        //获取 <link> 资源
        function getLinkPrevHref(iframeId) {
            if (!window.frames[iframeId]) return;
            var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
            var links = $("link:first", head);
            for (var i = 0; links[i]; i++) {
                var href = $(links[i]).attr("href");
                if (href && href.toLowerCase().indexOf("ligerui") > 0) {
                    return href.substring(0, href.toLowerCase().indexOf("Content"));
                }
            }
        }

        //时钟
        function tick() {
            var hours, minutes, seconds;
            var intHours, intMinutes, intSeconds;
            var today;
            today = new Date();
            intHours = today.getHours();
            intMinutes = today.getMinutes();
            intSeconds = today.getSeconds();

            if (intHours == 0) {
                hours = "00:";
            } else if (intHours < 10) {
                hours = "0" + intHours + ":";
            } else {
                hours = intHours + ":";
            }

            if (intMinutes < 10) {
                minutes = "0" + intMinutes + ":";
            } else {
                minutes = intMinutes + ":";
            }
            if (intSeconds < 10) {
                seconds = "0" + intSeconds + " ";
            } else {
                seconds = intSeconds + " ";
            }
            var timeString = hours + minutes + seconds;

            var weekday = new Array(7);
            weekday[0] = "星期日";
            weekday[1] = "星期一";
            weekday[2] = "星期二";
            weekday[3] = "星期三";
            weekday[4] = "星期四";
            weekday[5] = "星期五";
            weekday[6] = "星期六";

            document.getElementById("clock").innerHTML = weekday[today.getDay()] + "&nbsp;&nbsp;&nbsp;&nbsp;" + timeString;
            window.setTimeout("tick();", 1000);
        }
        window.onload = tick;
    </script>
</head>
<body>
    <!--  加载转圈效果 -->
    <div id="pageloading">
    </div>
    <div id="topmenu" class="l-topmenu">
        <div class="topmask">
            <div class="l-topmenu-logo">
                <div class="sysname">
                    <span class="spliter">
                        <img src="resources/images/sysicon.gif" width="30" height="22" alt="公司Logo" />
                    </span>
                    <span class="h2">管理系统</span>
                </div>
            </div>
            <div class="l-topmenu-welcome fix_profile" data-toggle="dropdown" style="min-width: 120px;">
                <label id="wel_label" class="wel_label">
                    欢迎您：
                	<a>
                        <%= ((N_Bers.Business.Model.UserModel)Session[N_Bers.Business.Core.BaseConst.USERSESSION]).nickname %>
                        <span class="caret"></span>
                    </a>
                </label>
                <ul class="t_profile" id="dropdown-menu" style="display: none;">
                    <li class="fir">
                        <a class="myaccount" id="userInfo">
                            <span class="icon"></span>
                            <span>我的资料</span>
                        </a>
                    </li>
                    <li>
                        <a class="modifypwd" id="changePwd">
                            <span class="icon"></span>
                            <span>修改密码</span>
                        </a>
                    </li>
                    <li>
               			<a class="logout" href="login.aspx?RemoveSession=1">
               				<span class="icon"></span>
	               			<span>退&nbsp;&nbsp;出</span>               			
               			</a>
               		</li>
                </ul>
            </div>
<%--            <div class="l-topmenu-welcome">
                <span class="wel_links">
                    <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1003535092&amp;site=qq&amp;menu=yes" class="icn_help" title="点击求助： @N_bers" target="_blank">在线求助
                    </a>
                </span>
            </div>--%>
        </div>
    </div>
    <div id="layout1" style="width: 100%; margin: 0 auto;">
        <div position="left" title="系统功能菜单" id="accordion1" style="overflow-y: auto;">
        </div>
        <div position="center" id="framecenter">
            <div tabid="home" title="<span class='icn_home'>我的主页</sapn>" style="height: 290px">
                <iframe frameborder="0" name="home" id="home" src="main.html"></iframe>
            </div>
        </div>
    </div>
    <div class="l-bottom">
        <span id="clock"></span>
    </div>
    <div style="display: none">
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("div[data-toggle='dropdown']").mouseenter(function () {
                $("#dropdown-menu").toggle();
                $(this).toggleClass("profileHover");
            }).mouseleave(function () {
                $("#dropdown-menu").toggle();
                $(this).toggleClass("profileHover");
            });
            $("#userInfo").click(function (e) {
                f_addTab("grzl", "个人资料", "UserManage/UserInfo.aspx");
                e.preventDefault();
            });
            $("#changePwd").click(function (e) {
                $.ligerDialog.open({
                    target: $("#form_changepwd"), width: 380, title: "修改密码",
                    buttons: [
                        { text: '确定', onclick: function (item, dialog) { f_changepwd(dialog) } },
                        { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                    ]
                });
                e.preventDefault();
            });
            window['f'] = $("#myform_changepwd").ligerForm({
                inputWidth: 170, labelWidth: 90, space: 60,
                fields: [
                     { display: "新密码", name: "new_pwd", type: "password", labelAlign: "right", validate: { required: true } },
                     { display: "确认密码", name: "re_pwd", type: "password", labelAlign: "right", validate: { required: true } },
                ]
            });
        });

        
        function f_changepwd()
        {
            var changeData = f.getData();
            if (changeData.new_pwd.length==0) {
                myTips("请输入新密码");
                return;
            }
            if (changeData.re_pwd.length == 0) {
                myTips("请输入确认密码");
                return;
            }
            if (changeData.new_pwd != changeData.re_pwd) {
                $.ligerDialog.error('两次密码输入不一样!');
                return;
            }
            var returnJson = GetDataByAjax("NB_JsonHttp.aspx", "changepwd", changeData.new_pwd, "", null);
            if (returnJson.result) {
                myTips(returnJson.msg);
            }
             dialog.hidden();
        }
    </script>
    <div id ="form_changepwd" class="form_changepwd" style="width:99%; margin:3px; display:none;">
        <div id="myform_changepwd"></div>
    </div>
</body>
</html>
