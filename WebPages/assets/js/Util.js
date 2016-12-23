/*
功能：基础方法
时间：2016年10月16日21:16:36
作者：wonder4
*/

//去掉空格
function Trim(s) {
    //return s.replace(/^\s+|\s+$/g,'');
    //处理全角空格
    return s.replace(/^[\s　]+|[\s　]+$/g, '');
}

// 功能：取 url 后参数值。暂时处理，需要完善
// 返回：参数值。如果没有参数不存在，返回 undefined
function getQueryString(sURL, sParamName) {
    if (Trim(sURL) == "")
        return undefined;

    var arrParam;
    var sParamValue;

    arrParam = sURL.substring(sURL.indexOf("?") + 1).split("&");
    for (var i = 0; i < arrParam.length; i++) {
        if (arrParam[i].indexOf(sParamName + "=") != -1) {
            var reg = new RegExp(sParamName + "=", "g");
            return arrParam[i].replace(reg, "");
        }
    }

    return undefined;
}

function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg); //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}
// 功能：将字符串进行 HTML 编码，以便实现从 Web 服务器到客户端的可靠的 HTTP 传输
function HtmlEncode(s) {
    s = s.replace(/&/g, "&amp;");
    s = s.replace(/</g, "&lt;");
    s = s.replace(/>/g, "&gt;");
    return s.replace(/\"/g, "&quot;");
}

// 功能：将字符串进行 HTML 编码，以便实现从 Web 服务器到客户端的可靠的 HTTP 传输
function HtmlDecode(s) {
    s = s.replace(/&lt;/g, "<");
    s = s.replace(/&gt;/g, ">");
    s = s.replace(/&quot;/g, "\"");
    s = s.replace(/&amp;/g, "&");
    return s;
}

// 功能：对 URL 字符串进行编码，以便实现从 Web 服务器到客户端的可靠的 HTTP 传输
function URLEncode(s) {
    s = s.replace(/ /g, "%20");
    s = s.replace(/"/g, "%22");
    s = s.replace(/#/g, "%23");
    s = s.replace(/&/g, "%26");
    return s.replace(/\+/g, "%2B");
}

//定义StringBuilder类 改善字符串连接操作性能 
function StringBuilder() {
    this._S = [];
}
StringBuilder.prototype.append = function (s) {
    this._S.push(s);
}
StringBuilder.prototype.appendRange = function () {
    for (var i = 0, n = arguments.length; i < n; i++) {
        this._S.push(arguments[i]);
    }
}
StringBuilder.prototype.toString = function () {
    return this._S.join("");
}

function myEscape(str)
{
    return escape(str);
}

/*
功能：ajax异步请求
参数：
        url 请求地址
        oprtype 业务类别
        strkey 第一个参数
        strkey2 第一个参数
        args post大数据量参数
        returnValue json字符串
更新时间：2016年10月21日11:19:46
*/
function GetDataByAjax(sfile, oprtype, strkey, strkey2, args) {
    if (sfile == "") { sfile = "NB_JsonHttp.aspx"; }
    oprtype = oprtype || '';
    strkey = strkey || '';
    strkey2 = strkey2 || '';
    var returnValue;
    var rdNum = Math.random();
    var url;
    if (sfile.search(/\?/g) > 0)
        url = sfile + "&oprtype=" + escape(oprtype) + "&strkey=" + escape(strkey) + "&strkey2=" + escape(strkey2) + "&rdnum=" + rdNum;
    else
        url = sfile + "?oprtype=" + escape(oprtype) + "&strkey=" + escape(strkey) + "&strkey2=" + escape(strkey2) + "&rdnum=" + rdNum;

    $.ajax({
        type: "POST",            //http请求方式
        url: url,    //服务器段url地址
        data: args,           //发送给服务器段的数据
        dataType: "json",
        success: function (data) {//定义交互完成，并且服务器正确返回数据时调用的回调函数
            returnValue = data;//请求正常，则不做任何处理，便于ligerui的控件采用服务端取数
            //if (!data.result) {
            //    alert(data.msg);//弹出错误提示，不跳转。
                //window.location.href = "../error/404.html";
            //}
        },
        error: function () {
            window.location.href = "../error/404.html";
        },
        async: false
    });
    return returnValue;
}


/*
功能：ajax同步请求
参数：
    url 请求地址
    oprtype 业务类别
    strkey 第一个参数
    strkey2 第一个参数
    args post大数据量参数
    callback 回调函数
更新时间：2016年10月21日11:20:13
*/
function GetDataByAjaxSync(sfile, oprtype, strkey, strkey2, args,callback) {
    var rdNum = Math.random();
    var url;
    if (sfile.search(/\?/g) > 0)
        url = sfile + "&oprtype=" + escape(oprtype) + "&strkey=" + escape(strkey) + "&strkey2=" + escape(strkey2) + "&rdnum=" + rdNum;
    else
        url = sfile + "?oprtype=" + escape(oprtype) + "&strkey=" + escape(strkey) + "&strkey2=" + escape(strkey2) + "&rdnum=" + rdNum;

    $.ajax({
        type: "POST",            //http请求方式
        url: url,    //服务器段url地址
        data: args,           //发送给服务器段的数据
        dataType: "json",//TODO:暂时定义为json，后续要调整再参数化
        success: function (data) {//定义交互完成，并且服务器正确返回数据时调用的回调函数
            if (typeof(callback)=="function") {
                callback(data);
            }
        }
    });
}


//重写tip插件,方便后期优化
function myTips(scontent, stitle, fncallback) {
    stitle = stitle == "" ? "提示信息" : stitle;
    scontent = scontent == "" ? "提示内容" : scontent;
    //全局只有一个实例
    if (typeof (mytips) == "undefined") {
        window['mytips'] = $.ligerDialog.tip({
            title: stitle, content: scontent, callback: function (data) {
                if (typeof (callback) == "function") {
                    fncallback(data);
                }
            }
        });
    }
    else {
        var visabled = mytips.get('visible');
        if (!visabled) mytips.show();
        mytips.set('content', scontent);
        mytips.set('title', stitle);
    }
    //5秒自动关闭
    setTimeout(function () {
        mytips.hidden();
    }, 5000);
}

//重写tip插件,方便后期优化
function myAlerts(scontent, stitle, type, fncallback) {
    stitle = stitle == "" ? "提示信息" : stitle;
    scontent = scontent == "" ? "提示内容" : scontent;
    switch (type) {
        case "success":
            $.ligerDialog.success(scontent, stitle);
            break;
        case "warn":
            $.ligerDialog.warn(scontent, stitle);
            break;
        case "question":
            $.ligerDialog.question(scontent, stitle);
            break;
        case "error":
            $.ligerDialog.error(scontent, stitle);
            break;
        case "confirm":
            $.ligerDialog.confirm('提示内容', function (yes) {
                alert(yes);
            });
            break;
        case "warning":
            $.ligerDialog.warning('提示内容', function (type) {
                alert(type);
            });
            break;
        case "prompt":
            $.ligerDialog.prompt('提示内容', function (yes, value) {
                if (yes) alert(value);
            });
            break;
        case "prompt2":
            $.ligerDialog.prompt('提示内容', '初始化值', function (yes, value) {
                if (yes) alert(value);
            });
            break;
        case "prompt3":
            $.ligerDialog.prompt('提示内容', true, function (yes, value) {
                if (yes) alert(value);
            });
            break;
        case "prompt4":
            $.ligerDialog.prompt('提示内容', '初始化多选框值', true, function (yes, value) {
                if (yes) alert(value);
            });
            break;
        case "waitting":
            $.ligerDialog.waitting('正在保存中,请稍候...');
            setTimeout(function () {
                $.ligerDialog.closeWaitting();
            }, 2000);
            break;
        case "waitting2":
            var manager = $.ligerDialog.waitting('正在保存中2,请稍候...');
            setTimeout(function () {
                manager.close();
            }, 1000);
            break;
    }
}

//json时间 转换 add by wonder4 2016年11月5日15:41:23
function g_render4time(rowdata, index, colvalue) {
    if (!colvalue) {
        return;
    }
    var milli = colvalue.replace(/\/Date\((-?\d+)\)\//, '$1');
    var s = "";
    var dt = new Date(parseInt(milli));
    if (dt && (dt instanceof Date)) {
        if (dt.getFullYear() != 1)
            s = dt.getFullYear() + "年" + (dt.getMonth() + 1) + "月" + dt.getDate() + "日";
    }
    return s;
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

// 功能：以 open 方式打开窗口
function openMyWin(sPath, sName, iX, iY) {
    return openStdWin(sPath, sName, iX, iY);
}

function openStdWin(sPath, sName, iX, iY) {
    if (!iX) iX = 800;
    if (!iY) iY = 552;
    if (!sName) sName = "";

    var iL, iT;
    iL = (window.screen.width - iX) / 2;
    iT = (window.screen.height - iY - 80) / 2;

    if (iL < 0) iL = 0;
    if (iT < 0) iT = 0;

    try {
        return window.open(sPath, sName, "left=" + iL + ",top=" + iT + ",width=" + iX + ",height=" + iY + ",status=1,resizable=1");
    }
    catch (e) {
    }
}
function g_render4type(rowdata, index, colvalue) {
    if (rowdata.remark && rowdata.remark == "file") {//附件
        return "附件";
    } else if (rowdata.remark) {
        return "文章";
    }
}

//点击新增按钮事件
function OnUpfiles() {
    //TODO：清理上传列表
    $.ligerDialog.open({
        target: $("#mytarget"), width: 500, minHeight: 300, title: "上传文件",
        buttons: [
            { text: '取消', onclick: function (item, dialog) { g.reload(); dialog.hidden(); } }
        ]
    });
}

function g_render4handlebar(rowdata, index, colvalue) {
    var ispublish = rowdata.ispublish;
    if ("1" == ispublish) {
        return '<a href="javascript:void(0)" name="handlebar" rel="1" file_type="' + rowdata.remark + '" data-id="' + rowdata .id+ '" update_to="0"">不在首页显示</a>';
    } else {
        return '<a href="javascript:void(0)" name="handlebar" rel="0"  file_type="' + rowdata.remark + '"data-id="' + rowdata.id + '" update_to="1"">发布到首页</a>';
    }
}

$(document).on("click", "table.l-grid-body-table a[name=handlebar]", function (e) {
    e.stopPropagation();
    e.preventDefault();
    var id = $(this).attr("data-id");
    var ispublish = $(this).attr("rel");
    var file_type = $(this).attr("file_type");
    var update_to = $(this).attr("update_to");
    if (!id) {
        return;
    }
    var rtn = GetDataByAjax('../../NB_JsonHttp.aspx', 'PublishArticle', id, null, { ispublish: ispublish, file_type: file_type, update_to: update_to });
    if (rtn && rtn.result) {
        g.reload();
    }
});