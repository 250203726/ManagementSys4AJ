<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_list.aspx.cs" Inherits="WebPages.Home.news_list" %>

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
            height: 65px;
            z-index: 9999;
            position: absolute;
            text-align: right;
            width: 90px;
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
    </style>
    <script type="text/javascript">
        $(function () {
            setRight();
        });
        $(document).on("click", "li.mylist", function (e) {
            alert($(this).html());
        });
        function changeFrameHeight() {
            var ifm = $("#myiframe");
            ifm.attr("height", document.documentElement.clientHeight);
        }
        function setRight() {
            var margin_r = $("div.container:eq(0)").offset().left + 15;
            $("div.div_entersys").attr("style", "right:" + margin_r + "px")
        }
        window.onresize = function () {
            changeFrameHeight();
            setRight();
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
                        <li><a href="../Home/unit_decription.aspx?news_type=unit">部门管理</a></li>
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
        <div class="col-md-10">
           <ul class="news_list">
               <%
                   int i = 0;
                   foreach (var item in newslist)
                   {
                       i++;
                       Response.Write("<li><a href='news_view.aspx?oid="+item.id.ToString()+"'  target='_blank'>"+i.ToString()+". "+item.title+"</a><span>"+item.create_date.ToString("yyyy-MM-dd")+"</span></li>");
                   };
                   %>               
           </ul>
            <nav>
                <ul class="pagination" style="float:right;">
        <li class="disabled"><a href="#">«</a></li>
        <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">»</a></li>
     </ul>
            </nav>
        </div>
    </div>
    <%--页脚--%> 
    <div class="container footer">
        Copyright©2016 荆力总包版权所有     地址：荆州**　 邮编：123456</br>
            鄂ICP备05003329号  鄂公网安备 42050202000133号 
    </div>
</body>
</html>

