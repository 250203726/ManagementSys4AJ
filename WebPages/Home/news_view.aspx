<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_view.aspx.cs" Inherits="WebPages.Home.news_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Components/NBersEditor/themes/default/default.css" rel="stylesheet" />
    <link href="../Components/NBersEditor/plugins/code/prettify.css" rel="stylesheet" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js"></script>
    <script src="../Components/NBersEditor/kindeditor.js"></script>
    <script src="../Components/NBersEditor/plugins/code/prettify.js"></script>    
    <script src="../assets/lib/jquery.PrintArea.js"></script>
       <style type="text/css">
        body {
            margin:20px auto;
            margin-top:0px;
            width:90%;
        }
        .post_content_main h1 {
            font: bold 20px/1 "Microsoft Yahei";
            color: #404040;
        }
           .post_time_source {
               margin-top: 20px;
               color: #888;
           }
    </style>
</head>

<body>
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
</body>
</html>
