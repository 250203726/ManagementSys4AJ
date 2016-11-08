<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkSummary.aspx.cs" Inherits="WebPages.UnitManage.WorkSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>工作总结</title>
         <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 

    <script src="../Components/NBersFileServices/jquery.uploadify.js" type="text/javascript"></script>
    <link href="../Components/NBersFileServices/uploadify.css" rel="stylesheet" />

    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
             window["g"] =
            $("#maingrid").ligerGrid({
                height: '99%',
                checkbox:true,
                columns: [
                    { display: '文章标题', name: 'title', minWidth: 460, align: 'left', render: g_render4name },
                    { display: '摘要', name: 'description', width: 150 },
                    { display: '作者', name: 'create_user', width: 120, },
                    { display: '上传时间', name: 'create_date', width: 120, render: g_render4time }
                ],
                //data:grid_data.data,
                url: "../NB_JsonHttp.aspx?oprtype=GetArticle4Grid&strkey=岗位职责",
                pageSize: 30,
                rownumbers: true,
             toolbar:     {
                    items: 
                    [

                          { line: true },
                        { text: "上传", click: OnUpfiles, icon: "upfiles" },
                          { line: true },
                        { text: "删除", click: deleteRow, icon: "../assets/lib/ligerUI/skins/icons/delete.gif" },
                          { line: true },
                    ]
                },
                //autoFilter: true
                //{ line: true },
                //{ text: "下载", click: OnKeyDown, icon: "download", options: { id: "123" } },
            });


            $("#pageloading").hide();
        });

        function OnKeyDown(obj)
        {
            
        }

        //点击上传按钮的操作 add wonder4 2016年11月7日22:54:21
        function OnUpfiles() {
            //TODO：清理上传列表
            $.ligerDialog.open({
                target: $("#mytarget"), width: 500,minHeight:300, title: "上传文件",
                buttons: [
                    { text: '取消', onclick: function (item, dialog) { g.reload(); dialog.hidden(); } }
                ]
            });
        }
         
        //删除数据 add wonder4 2016年11月7日22:54:21
        function deleteRow() {
            var rows = g.getSelectedRows();
            if (rows.length == 0) {
                myTips("请选择数据进行删除！");
                return;
            }
            //服务端删除，合并id为ids
            var ids = rows.map(function (data, index) { return data.id }).join(",");
            var returnStr = GetDataByAjax("../Components/NBersFileServices/DeleteFileHandle.ashx?", "", "", "", {fileids:ids});

            if (returnStr.result) {
                g.deleteSelectedRow();
                myTips(returnStr.msg);
            } else {
                myTips("删除失败，请联系管理员！");
            }
        }

       

        
        //渲染文件名称为超链接  add by wonder4 2016年11月5日15:41:23
        function g_render4name(rowdata, index, colvalue) {
            var docname = colvalue.length > 50 ? colvalue.substr(0, 50) +"...": colvalue;
            return "<a href='../Components/NBersEditor/EditorView.aspx?oid=" + rowdata.id + " 'rel='" + rowdata.id + " 'target='_blank'>" + docname + "</a>";
        }
       </script>
</head>
<body style="overflow-x:hidden; padding:2px;">
<div class="l-loading" style="display:block" id="pageloading"></div>
 <div class="l-clear"></div>
    <div id="maingrid"></div>
  <div style="display:none;">
</div>
         <div id="mytarget" style="width:99%; margin:3px; display:none;">
             <input type="file" name="file_upload" id="file_upload" />
     </div> 
</body>
</html>
