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
        .footer {
            text-align: center;
            padding: 15px 0;
            line-height: 25px;
            position:absolute;
            bottom:5px;
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
                    <a class="navbar-brand" href="#">荆力总包安质部
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-7">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">首页</a></li>
                        <li><a href="#">部门概况</a></li>
                        <li><a href="#">部门管理</a></li>
                        <li><a href="#">安全管理</a></li>
                        <li><a href="#">质量管理</a></li>
                        <li><a href="#">分公司管控</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
        <ol class="breadcrumb">
            <li>首页</li>
            <li class="active"><%=art_type %></li>
        </ol>
        <div>
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
      <ul class="pagination" style="float:right;display:none">
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
        <div class="container footer">
        Copyright©2016 荆力总包版权所有     地址：荆州**　 邮编：123456</br>
            鄂ICP备05003329号  鄂公网安备 42050202000133号 
    </div>
</body>
</html>

