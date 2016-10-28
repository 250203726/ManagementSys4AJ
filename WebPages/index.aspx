<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebPages.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
    <title>管理系统</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="shoucut icon" href="favicon.ico" type="image/x-icon">
    <link href="resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="resources/css/index.css" rel="stylesheet" type="text/css">
    <link href="resources/css/ui.css" rel="stylesheet" type="text/css" />
    <script src="resources/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="resources/ligerUI/js/ligerui.all.js"></script>
    <script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="resources/js/config.js" type="text/javascript"></script>
    <script src="assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tab = null;
        var accordion = null;
        var tree = null;
        var tabItems = [];
        var sidebarData = GetDataByAjax('../myHandler.ashx', "getParentMenusByJson");
		//[
		//{ "menuId": "1420714976353939", "version": 3, "icon": "", "name": "系统设置", "code": "", "url": "", "params": null, "levels": 1, "sortCode": 1, "parentId": "0", "moduleId": "admin", "enable": "1" },
		//{ "menuId": "1420711336094951", "version": 2, "icon": "", "name": "基础信息", "code": "", "url": "", "params": null, "levels": 1, "sortCode": 2, "parentId": "0", "moduleId": "basic", "enable": "1" },
		//{ "menuId": "14772850175791039", "version": 2, "icon": "", "name": "固定资产", "code": "gdzc", "url": "", "params": null, "levels": 1, "sortCode": 3, "parentId": "0", "moduleId": "asset", "enable": "1" }];
        var navigateData = GetDataByAjax('../myHandler.ashx', "getSubMenusByJson");
        //[
        //{ "menuId": "14772852690089630", "version": 0, "icon": "", "name": "部门", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 1, "parentId": "1420711336094951", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772852925375921", "version": 0, "icon": "", "name": "供应商", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 2, "parentId": "1420711336094951", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772865293066423", "version": 0, "icon": "", "name": "厂商", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 3, "parentId": "1420711336094951", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772865535855333", "version": 0, "icon": "", "name": "项目", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 4, "parentId": "1420711336094951", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772865656659681", "version": 0, "icon": "", "name": "维护公司", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 5, "parentId": "1420711336094951", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714763978062", "version": 3, "icon": "", "name": "客户（模板）", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 6, "parentId": "1420711336094951", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714774585853", "version": 3, "icon": "", "name": "施工单位（模板）", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 7, "parentId": "1420711336094951", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714784255032", "version": 3, "icon": "", "name": "项目经理（模板）", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 8, "parentId": "1420711336094951", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714805866899", "version": 1, "icon": "", "name": "客户新建", "code": "", "url": "/customer/add", "params": null, "levels": 3, "sortCode": 1, "parentId": "1420714763978062", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714835269892", "version": 2, "icon": "", "name": "客户列表", "code": "khlb", "url": "/customer/toList", "params": null, "levels": 3, "sortCode": 2, "parentId": "1420714763978062", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714861773820", "version": 1, "icon": "", "name": "单位新建", "code": "", "url": "/company/add", "params": null, "levels": 3, "sortCode": 1, "parentId": "1420714774585853", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714878474292", "version": 2, "icon": "", "name": "单位列表", "code": "dwlb", "url": "/company/toList", "params": null, "levels": 3, "sortCode": 2, "parentId": "1420714774585853", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714906132844", "version": 1, "icon": "", "name": "项目经理新建", "code": "", "url": "/manager/add", "params": null, "levels": 3, "sortCode": 1, "parentId": "1420714784255032", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714929015955", "version": 1, "icon": "", "name": "项目经理列表", "code": "", "url": "/manager/toList", "params": null, "levels": 3, "sortCode": 2, "parentId": "1420714784255032", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1420714987907349", "version": 1, "icon": "", "name": "用户", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 1, "parentId": "1420714976353939", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715003825582", "version": 1, "icon": "", "name": "角色", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 2, "parentId": "1420714976353939", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715080055842", "version": 1, "icon": "", "name": "url过滤", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 3, "parentId": "1420714976353939", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715096172014", "version": 1, "icon": "", "name": "系统资源", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 4, "parentId": "1420714976353939", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715114059104", "version": 1, "icon": "", "name": "数据导入", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 5, "parentId": "1420714976353939", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715154089567", "version": 1, "icon": "", "name": "用户新建", "code": "", "url": "/userRole/add", "params": null, "levels": 3, "sortCode": 1, "parentId": "1420714987907349", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715180833246", "version": 2, "icon": "", "name": "用户列表", "code": "yhlb", "url": "/user/toList", "params": null, "levels": 3, "sortCode": 2, "parentId": "1420714987907349", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715229679779", "version": 1, "icon": "", "name": "角色新建", "code": "", "url": "/role/add", "params": null, "levels": 3, "sortCode": 1, "parentId": "1420715003825582", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715239271120", "version": 1, "icon": "", "name": "角色列表", "code": "", "url": "/role/toList", "params": null, "levels": 3, "sortCode": 2, "parentId": "1420715003825582", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715259164060", "version": 1, "icon": "", "name": "url新建", "code": "", "url": "/urlFilter/add", "params": null, "levels": 3, "sortCode": 1, "parentId": "1420715080055842", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715277527339", "version": 2, "icon": "", "name": "url列表", "code": "ljlb", "url": "/urlFilter/toList", "params": null, "levels": 3, "sortCode": 2, "parentId": "1420715080055842", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715296434232", "version": 2, "icon": "", "name": "菜单", "code": "cdlb", "url": "/menu/list", "params": null, "levels": 3, "sortCode": 1, "parentId": "1420715096172014", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715311385655", "version": 2, "icon": "", "name": "权限", "code": "qxlb", "url": "/auth/list", "params": null, "levels": 3, "sortCode": 2, "parentId": "1420715096172014", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715328320527", "version": 3, "icon": "", "name": "总包导入", "code": "", "url": "/import/zb", "params": null, "levels": 3, "sortCode": 1, "parentId": "1420715114059104", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "14211187290244018", "version": 2, "icon": "", "name": "分包导入", "code": "fbdr", "url": "/import/fb", "params": null, "levels": 2, "sortCode": 2, "parentId": "1420715114059104", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "1420715342703513", "version": 3, "icon": "", "name": "资金导入", "code": "zjdr", "url": "/import/fund", "params": null, "levels": 3, "sortCode": 3, "parentId": "1420715114059104", "moduleId": "admin", "enable": "1" },
        //{ "menuId": "14772852154601912", "version": 0, "icon": "", "name": "资产", "code": "zc", "url": "", "params": null, "levels": 2, "sortCode": 1, "parentId": "14772850175791039", "moduleId": "asset", "enable": "1" },
        //{ "menuId": "14772867472516161", "version": 0, "icon": "", "name": "资产名称", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 2, "parentId": "14772850175791039", "moduleId": "asset", "enable": "1" },
        //{ "menuId": "14772867607857754", "version": 0, "icon": "", "name": "资产类别", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 3, "parentId": "14772850175791039", "moduleId": "asset", "enable": "1" },
        //{ "menuId": "14772867720972587", "version": 0, "icon": "", "name": "资产购置", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 4, "parentId": "14772850175791039", "moduleId": "asset", "enable": "1" },
        //{ "menuId": "14772868833544411", "version": 0, "icon": "", "name": "资产报损", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 5, "parentId": "14772850175791039", "moduleId": "asset", "enable": "1" },
        //{ "menuId": "14772869040906982", "version": 0, "icon": "", "name": "资产维护", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 6, "parentId": "14772850175791039", "moduleId": "asset", "enable": "1" },
        //{ "menuId": "14772869338986538", "version": 0, "icon": "", "name": "资产调拨", "code": "", "url": "", "params": null, "levels": 2, "sortCode": 7, "parentId": "14772850175791039", "moduleId": "asset", "enable": "1" },
        //{ "menuId": "14772854018894844", "version": 1, "icon": "", "name": "部门新建", "code": "", "url": "/infomanage/depart/add", "params": null, "levels": 3, "sortCode": 1, "parentId": "14772852690089630", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772864882915599", "version": 2, "icon": "", "name": "部门列表", "code": "", "url": "/infomanage/depart/toList", "params": null, "levels": 3, "sortCode": 2, "parentId": "14772852690089630", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772854190891008", "version": 0, "icon": "", "name": "供应商新建", "code": "", "url": "", "params": null, "levels": 3, "sortCode": 1, "parentId": "14772852925375921", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772865108746357", "version": 0, "icon": "", "name": "供应商列表", "code": "", "url": "", "params": null, "levels": 3, "sortCode": 2, "parentId": "14772852925375921", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772866147062469", "version": 0, "icon": "", "name": "厂商新建", "code": "", "url": "", "params": null, "levels": 3, "sortCode": 1, "parentId": "14772865293066423", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772866301533281", "version": 0, "icon": "", "name": "厂商列表", "code": "", "url": "", "params": null, "levels": 3, "sortCode": 2, "parentId": "14772865293066423", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772866557058439", "version": 0, "icon": "", "name": "项目新建", "code": "", "url": "", "params": null, "levels": 3, "sortCode": 1, "parentId": "14772865535855333", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772866691464823", "version": 0, "icon": "", "name": "项目列表", "code": "", "url": "", "params": null, "levels": 3, "sortCode": 2, "parentId": "14772865535855333", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "1477286681754305", "version": 0, "icon": "", "name": "维护公司新建", "code": "", "url": "", "params": null, "levels": 3, "sortCode": 1, "parentId": "14772865656659681", "moduleId": "basic", "enable": "1" },
        //{ "menuId": "14772866946501411", "version": 0, "icon": "", "name": "维护公司列表", "code": "", "url": "", "params": null, "levels": 3, "sortCode": 2, "parentId": "14772865656659681", "moduleId": "basic", "enable": "1" }];
        $(function () {
            //自定义步骤，写入一级菜单资源的 HTML，需在 LigerUI 布局方法之前完成
            var tempHtml = "";
            $.each(sidebarData, function () {
                tempHtml += "<div title='" + this.name + "' class='1-scroll'>"
						   + "	<ul data-module='" + this.moduleId + "' id='tree_" + this.menuId + "' style='margin-top:1px;'>"
						   + "</div>";
            });
            $("#accordion1").html(tempHtml);

            //布局
            $("#layout1").ligerLayout({ leftWidth: 190, height: '100%', heightDiff: -34, space: 0, onHeightChanged: f_heightChanged });

            var height = $(".l-layout-center").height();

            //Tab
            $("#framecenter").ligerTab({
                height: height,
                showSwitchInTab: true,
                showSwitch: true,
                onAfterAddTabItem: function (tabdata) {
                    tabItems.push(tabdata);
                    //saveTabStatus();
                },
                onAfterRemoveTabItem: function (tabid) {
                    for (var i = 0; i < tabItems.length; i++) {
                        var o = tabItems[i];
                        if (o.tabid == tabid) {
                            tabItems.splice(i, 1);
                            //saveTabStatus();
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
                height: height - 32, speed: null
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
                var myData = $.grep(navigateData, function (item) {
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
                        var tabid = node.data.code;
                        if (!tabid) {
                            tabid = new Date().getTime();
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
            //pages_init();			
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
            $.cookie('liger-home-tab', JSON2.stringify(tabItems));
        }

        //获取 Url 参数值
        function getQueryString(name) {
            var nowUrl = document.location.search.slice(1), qArray = nowUrl.split('&');
            for (var i = 0; i < qArray.length; i++) {
                var vArray = qArray[i].split('=');
                if (vArray[0] == name) {
                    return vArray[1];
                }
            }
            return false;
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
                    <span class="h2">内部同管理系统</span>
                </div>
            </div>
            <div class="l-topmenu-welcome fix_profile" data-toggle="dropdown">
                <label id="wel_label" class="wel_label">欢迎您：
                	<a>
                		测试用户
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
               			<a class="logout" href="${path }/logonOut">
               				<span class="icon"></span>
	               			<span>退&nbsp;&nbsp;出</span>               			
               			</a>
               		</li>
               	</ul>
            </div>
            <div class="l-topmenu-welcome">            	
                <span class="wel_links">
                    <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1003535092&amp;site=qq&amp;menu=yes" class="icn_help" title="点击求助： @三峡大学计算机与信息学院" target="_blank">
                        在线求助
                    </a>
                </span>
            </div>
        </div>
    </div>
    <div id="layout1" style="width: 100%; margin: 0 auto;">
        <div position="left" title="系统功能菜单" id="accordion1" style="overflow-y:auto;">
            
        </div>
        <div position="center" id="framecenter">
            <div tabid="home" title="<span class='icn_home'>我的主页</sapn>" style="height: 300px">
                
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
                f_addTab("grzl", "个人资料", "user/userInfo?id=${USERSESSION.user.userId}");
                e.preventDefault();
            });
            $("#changePwd").click(function (e) {
                f_addTab("xgmm", "修改密码", "user/changePwd");
                e.preventDefault();
            });
        });
    </script>
</body>
</html>
