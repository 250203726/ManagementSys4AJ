<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="unit_decription.aspx.cs" Inherits="WebPages.Home.unit_decription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link rel="shoucut icon" href="../assets/ico/favicon.ico" type="image/x-icon"/>
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/normalize.css" rel="stylesheet" />
    <script src="../assets/js/jquery-1.11.1.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/Util.js"></script>
    <style type="text/css">
        .news_list {
        padding-left:0;
        }
         .news_list  li{
        list-style:none;
        line-height:31px;
        border-bottom:1px dotted #dedede;
        }
            .news_list li a{
                text-decoration:none;
            }
            .news_list li span {
            float:right
            }
        .footer {
            text-align: center;
            padding: 15px 0;
            line-height: 25px;
        }
        .div_banner {
            background: url('../assets/img/line.png') repeat-x top center;
            width: 100%;
        }
        .navbar-wonder4 {
            color: #fff !important;
            background-color: #337ab7 !important;
            border-color: #337ab7 !important;
        }
        .navbar-nav > .active > a {
            color: #fff !important;
            background-color: #337ab7!important;
        }
        .navbar-default .navbar-brand {
        color:#fff!important;
        }
        .navbar-default .navbar-nav > li > a {
        color:#fff!important;
        font-size:15px
        }
        .navbar-default .navbar-nav > li > a:hover {
        font-size:16px;
        background-color:#2a7fc7!important;
        }
        .navbar {
        border-radius:12px 0px 0px 0px !important;
        font-family:'Microsoft YaHei UI','Microsoft YaHei'
        }
        .div_entersys {
        height:65px;
        z-index:9999;
        position:absolute;
        text-align:right;
        right:14%;
        width:90px;
        }
        .page_l {
        padding-left:0px;
        border-right:3px solid #dedede;
        min-height:480px;
        padding-right:0px!important;
        }
        .mylist {
        cursor:pointer;
        border-right:none;
        }
        .page_r {
        min-height:480px;
        }
        .news_list {
        padding:10px;
        }
         .news_list  li{
        list-style:none;
        line-height:31px;
        border-bottom:1px dotted #dedede;
        }
            .news_list li a{
                text-decoration:none;
            }
            .news_list li span {
            float:right
            }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".page_l li:eq(0)").addClass("active");
        });

        $(document).on("click", "li.mylist", function (e) {
            var all_li = $(".page_l li");
            var click_li = $(this);            
            var myframe = $("#myiframe");
            if (click_li.html()) {
                all_li.removeClass("active");
                click_li.addClass("active");
            } 
            switch (click_li.html()) {
                case "形象及宗旨":
                    myframe.show();
                    myframe.attr("src", "../Components/NBersEditor/EditorView.aspx?oid=24");
                    break;
                case "部门职责":
                    myframe.show();
                    myframe.attr("src", "../Components/NBersEditor/EditorView.aspx?oid=25");
                    break;
                case "岗位职责":
                    myframe.hide();
                    render4stationduty();
                    break;
                case "公司安全网络图":                    
                    openMyWin("../UnitManage/NetworkMap_New.aspx", "荆力总包安质部-网络安全图");
                    break;
                default:
                    break;

            }
        });

        function render4stationduty() {
            var station_duty = GetDataByAjax("../NB_JsonHttp.aspx", "GetStationDuty4Grid");
            var tpl = "<li><a href='news_view.aspx?oid=@id'  target='_blank'>@rowid. @title</a><span>@time</span></li>";
            var ul = $("ul.news_list");
            if (station_duty && station_duty.Rows && station_duty.Rows.length != $("ul.news_list li").length) {
                for (var i = 0; i < station_duty.Total; i++) {
                    ul.append(tpl.replace("@id", station_duty.Rows[i].id).replace("@title", station_duty.Rows[i].title).replace("@rowid", i + 1).replace("@time", g_render4time(null, null, station_duty.Rows[i].create_date)));
                }                
            }           
        }

        function changeFrameHeight() {
            var ifm = $("#myiframe");
            ifm.attr("height", document.documentElement.clientHeight);
        }
        window.onresize = function () {
            changeFrameHeight();
        }
    </script>
</head>
<body>
    <div class="div_banner">    
    <div class="container">
         <a href="../index.aspx" target="_blank"><div class="div_entersys"></div></a>
        <img src="../assets/img/banner-index.png" width="100%" />
        <nav class="navbar navbar-default navbar-wonder4 " role="navigation" style="margin-bottom: 15px;">
            <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
            <div class="container-fluid" style="border-bottom:solid 3px #ff9900">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-7">
                        <span class="sr-only">菜单</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">荆力总包安质部
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-7">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="../Home/index.aspx">首页</a></li>
                        <li><a href="../Home/unit_decription.aspx?news_type=unit_decription">部门概况</a></li>
                        <li><a href="../Home/news_list.aspx?news_type=unit_manage">部门管理</a></li>
                        <li><a href="../Home/news_list.aspx?news_type=safety_manage">安全管理</a></li>
                        <li><a href="../Home/news_list.aspx?news_type=quality_manage">质量管理</a></li>
                        <li><a href="../Home/news_list.aspx?news_type=branch_manage">分公司管控</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
    </div>
    </div>
    <div class="container">
        <ol class="breadcrumb" style="margin-bottom:5px;">
            <li>首页</li>
            <li class="active"><%=art_type %></li>
        </ol>
        <div class="col-md-2 page_l" >
            <ul class="list-group">
                <%
                    foreach (var item in type_tree)
                    {
                        Response.Write("<li class='list-group-item mylist'>"+item.name+"</li>");
                    }
                    %>
            </ul>
        </div>
        <div class="col-md-10 page_r">
            <iframe id="myiframe" src="../Components/NBersEditor/EditorView.aspx?oid=24"  width="100%" scrolling="no" onload="changeFrameHeight()" frameborder="0"></iframe>
            <div class="station_list">
                 <ul class="news_list">            
                  </ul>
            </div>
        </div>
    </div>
    <%--页脚--%> 
    <div class="container footer">
        Copyright©2016 荆力总包版权所有     地址：荆州**　 邮编：123456</br>
            鄂ICP备05003329号  鄂公网安备 42050202000133号 
    </div>
</body>
</html>
