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

function escape(str)
{
    return str;
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
    $.ligerDialog.tip({
        title: stitle, content: scontent, callback: function (data) {
            if (typeof (callback)=="function") {
                fncallback(data);
            }
        }
    });
}

//
var company_name = "安质管理工程局";

//json时间 转换 add by wonder4 2016年11月5日15:41:23
function g_render4time(rowdata, index, colvalue) {
    var milli = colvalue.replace(/\/Date\((-?\d+)\)\//, '$1');
    var s = "";
    var dt = new Date(parseInt(milli));
    if (dt && (dt instanceof Date)) {
        if (dt.getFullYear() != 1)
            s = dt.getFullYear() + "年" + (dt.getMonth() + 1) + "月" + dt.getDate() + "日";
    }
    return s;
}