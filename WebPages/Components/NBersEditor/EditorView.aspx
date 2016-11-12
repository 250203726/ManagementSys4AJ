<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditorView.aspx.cs" Inherits="WebPages.Components.NBersEditor.EditorView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文章查看</title>
    <link rel="stylesheet" href="themes/default/default.css" />
    <link rel="stylesheet" href="plugins/code/prettify.css" />
    <script src="../../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 
    <script charset="utf-8" src="kindeditor.js"></script>
    <script charset="utf-8" src="lang/zh_CN.js"></script>
    <script charset="utf-8" src="plugins/code/prettify.js"></script>
    <script src="../../assets/lib/jquery.PrintArea.js"></script>
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
    <script type="text/javascript">
        $(document).on("click","input[type=button]",function(){
            $(".post_content").printArea();
        });
    </script>
</head>
<body>
    <div style="height:20px;width:100%;text-align:right;vertical-align:bottom;display:none">
        <input type="button" name="print" value="打印" />
    </div>
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
