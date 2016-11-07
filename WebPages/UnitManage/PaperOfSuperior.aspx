﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaperOfSuperior.aspx.cs" Inherits="WebPages.UnitManage.PaperOfSuperior" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>上级来文</title>
     <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
             window["g"] =
            $("#maingrid").ligerGrid({
                height: '99%',
                checkbox:true,
                columns: [
                    { display: '文件名称', name: 'DocName', minWidth: 460, align: 'left', render: g_render4name },
                    { display: '上传用户', name: 'CreateUser', width: 150 },
                    { display: '文件大小', name: 'Filesize', width: 120, render: g_render4filesize },
                    { display: '上传时间', name: 'CreateOn', width:120,render: g_render4time }
                ],
                //data:grid_data.data,
                url: "../NB_JsonHttp.aspx?oprtype=getfiles4grid&strkey=上级来文",
                pageSize: 30,
                rownumbers: true,
             toolbar:     {
                    items: 
                    [
                        { line: true },
                        { text: "下载", click: OnKeyDown, icon: "download" },
                          { line: true },
                        { text: "上传", click: OnUpfiles, icon: "upfiles" },
                          { line: true },
                        { text: "删除", click: deleteRow, icon: "../assets/lib/ligerUI/skins/icons/delete.gif" },
                          { line: true },
                    ]
                },
                //autoFilter: true
            });


            $("#pageloading").hide();
        });

        function OnKeyDown(obj)
        {
            
        }
        function OnUpfiles() { }
        function deleteRow() { }

        //文件大小转换 add by wonder4 2016年11月5日15:41:23
        function g_render4filesize(rowdata, index, colvalue) {
            var fileSize = Math.round(colvalue / 1024);
            var suffix = 'KB';
            if (fileSize > 1000) {
                fileSize = Math.round(fileSize / 1000);
                suffix = 'MB';
            }
            var fileSizeParts = fileSize.toString().split('.');
            fileSize = fileSizeParts[0];
            if (fileSizeParts.length > 1) {
                fileSize += '.' + fileSizeParts[1].substr(0, 2);
            }
            fileSize += suffix;
            return fileSize;
        }

        
        //渲染文件名称为超链接  add by wonder4 2016年11月5日15:41:23
        function g_render4name(rowdata, index, colvalue) {
            var docname = colvalue.length > 50 ? colvalue.substr(0, 50) +"...": colvalue;
            return "<a href='../Components/NBersFileServices/DownloadHandler.ashx?fileids=" + rowdata.id + " 'rel='" + rowdata.id + " 'target='_blank'>" + docname + "</a>";
        }
    </script>
</head>
<body style="overflow-x:hidden; padding:2px;">
<div class="l-loading" style="display:block" id="pageloading"></div>
 <div class="l-clear"></div>
    <div id="maingrid"></div>
  <div style="display:none;">
</div>
</body>
</html>
