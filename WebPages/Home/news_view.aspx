<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_view.aspx.cs" Inherits="WebPages.Home.news_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="shoucut icon" href="../assets/ico/favicon.ico" type="image/x-icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link rel="shoucut icon" href="../assets/ico/favicon.ico" type="image/x-icon"/>
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/normalize.css" rel="stylesheet" />
    <script src="../assets/js/jquery-1.11.1.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/Util.js"></script>
    <link href="../Components/NBersEditor/themes/default/default.css" rel="stylesheet" />
    <link href="../Components/NBersEditor/plugins/code/prettify.css" rel="stylesheet" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js"></script>
    <script src="../Components/NBersEditor/kindeditor.js"></script>
    <script src="../Components/NBersEditor/plugins/code/prettify.js"></script>    
    <script src="../assets/lib/jquery.PrintArea.js"></script>
       <style type="text/css">
        .post_content_main h1 {
            font: bold 20px/1 "Microsoft Yahei";
            color: #404040;
            text-align:center;
            border-bottom:1px dashed #dedede;
            padding-bottom:12px;
        }
           .post_time_source {
               margin-top: 20px;
               color: #888;
               text-align:right;
               padding:0 15px;
           }
    </style>
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
            height: 145px;
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
        .div_entersys {
            height: 65px;
            z-index: 9999;
            position: absolute;
            text-align: right;
            width: 90px;
        }
        .post_body {
            margin-top: 10px;
            padding: 15px;
            line-height: 25px;
        }
    </style>
    <script>
        $(function () {
            setRight();
        });
        function setRight() {
            var margin_r = $("div.container:eq(0)").offset().left + 15;
            $("div.div_entersys").attr("style", "right:" + margin_r + "px")
        }
        window.onresize = function () {
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
                        <li><a href="../Home/unit_decription.aspx?news_type=unit_manage">部门管理</a></li>
                        <li><a href="../Home/unit_decription.aspx?news_type=safety_manage">安全管理</a></li>
                        <li><a href="../Home/unit_decription.aspx?news_type=quality_manage">质量管理</a></li>
                        <li><a href="../Home/unit_decription.aspx?news_type=branch_manage">分公司管控</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
    </div>
    </div>
    <div class="container">
  <div class="post_content post_area clearfix">
      <div class="post_content_main">
          <h1><%= artM.title %></h1>
          <div class="post_time_source" >
            　<%= artM.create_user %> 于 <%= artM.create_date %> 在 <%= artM.art_type %> 发布</div>
          <div class="post_body">
              <%= artM.content %>
          </div>
      </div>
      </div>
        </div>
</body>
</html>
