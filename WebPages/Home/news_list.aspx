<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_list.aspx.cs" Inherits="WebPages.Home.news_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <%--<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">--%>
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/normalize.css" rel="stylesheet" />
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <%--<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>--%>
    <script src="../assets/js/jquery-1.11.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <%--<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>--%>
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
    </style>
</head>
<body>
    <div class="container">
        <div class="div_logo">
        </div>
        <nav class="navbar navbar-default " role="navigation" style="margin-bottom: 15px;">
            <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-7">
                        <span class="sr-only">菜单</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">荆力总包
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-7">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">首页</a></li>
                        <li><a href="#">安全稽查</a></li>
                        <li><a href="#">安全网络图</a></li>
                        <li><a href="#">规章制度</a></li>
                        <li><a href="#">上级来文</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
        <ol class="breadcrumb">
            <li>首页</li>
            <li class="active">安全稽查</li>
        </ol>
        <div>
           <ul class="news_list">
               <%
                   foreach (var item in newslist)
                   {
                       Response.Write("<li><a href='"+item.id.ToString()+"'  target='_blank'>"+item.title+"</a><span>"+item.create_date.ToString("yyyy-MM-dd")+"</span></li>");
                   }; 
                   %>               
           </ul>

        </div>
    </div>

</body>
</html>

