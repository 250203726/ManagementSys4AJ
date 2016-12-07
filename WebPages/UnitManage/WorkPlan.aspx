<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkPlan.aspx.cs" Inherits="WebPages.UnitManage.WorkPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>工作计划</title>
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
               checkbox: true,
               columns: [
                   { display: '类别', name: 'art_type', width: 150 },
                   { display: '文章标题', name: 'title', minWidth: 260, align: 'left', render: g_render4name },
                   { display: '摘要', name: 'description', width: 150 },
                   { display: '作者', name: 'create_user', width: 120, },
                   { display: '最新编辑', name: 'create_date', width: 120, render: g_render4time }
               ],
               //data:grid_data.data,
               url: "../NB_JsonHttp.aspx?oprtype=GetArticle4Grid&strkey=" + myEscape('工作计划'),
               pageSize: 30,
               rownumbers: true,
               toolbar: {
                   items:<%= buttonJson %>  
               },
               //autoFilter: true
               //{ line: true },
               //{ text: "下载", click: OnKeyDown, icon: "download", options: { id: "123" } },
           });

            //给工作工作计划名称绑定事件
            $(document).on("click", "table.l-grid-body-table td div.l-grid-row-cell-inner a", function (e) {
                e.stopPropagation();
                e.preventDefault();

                var top_tab = window.top.tab;
                var oid = $(e.target).attr("oid");
                var url = $(e.target).attr("rel");
                var author = $(e.target).attr("author");

                if (top_tab.isTabItemExist("WorkPlan")) {
                    top_tab.setHeader("WorkPlan", author + "-工作计划");
                    top_tab.setTabItemSrc("WorkPlan", url);
                    top_tab.reload("WorkPlan");
                    top_tab.selectTabItem("WorkPlan");
                    return;
                }

                window.top.f_addTab("WorkPlan", author + "-工作计划", url);

            });

            $("#pageloading").hide();
        });

        function AddItem(btn) {
            window.top.f_addTab("Save_WorkPlan", btn.text + "-工作计划", "/UnitManage/SavePage/SaveWorkPlan.aspx?mode=1&v=" + Math.random());
        }
        function EditItem(btn) {
            var rows = g.getSelectedRows();
            if (rows.length != 1) {
                myTips("请选择一条数据进行编辑！");
                return;
            }
            window.top.f_addTab("Save_WorkPlan", btn.text + "-工作计划", "/UnitManage/SavePage/SaveWorkPlan.aspx?mode=2&oid=" + rows[0].id + "&v=" + Math.random());
        }
        //function itemclick(btn) {
        //    if (btn.text == "新增") {
                
        //    } else if (btn.text == "修改") {
        //        var rows = g.getSelectedRows();
        //        if (rows.length != 1) {
        //            myTips("请选择一条数据进行编辑！");
        //            return;
        //        }
        //        window.top.f_addTab("Save_WorkPlan", btn.text + "-工作计划", "/UnitManage/SavePage/SaveWorkPlan.aspx?mode=2&oid=" + rows[0].id + "&v=" + Math.random());
        //    } else if (btn.text == "删除") {
        //        deleteRow();
        //    }
        //}

        //删除数据 add wonder4 2016年11月7日22:54:21
        function deleteRow() {
            var rows = g.getSelectedRows();
            if (rows.length == 0) {
                myTips("请选择数据进行删除！");
                return;
            }
            //服务端删除，合并id为ids
            var ids = rows.map(function (data, index) { return data.id }).join(",");
            var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "DELETEARTICLES", ids, "", null);

            if (returnStr.result) {
                g.deleteSelectedRow();
                myTips(returnStr.msg);
            } else {
                myTips("删除失败，请联系管理员！");
            }
        }




        //渲染文件名称为超链接  add by wonder4 2016年11月5日15:41:23
        function g_render4name(rowdata, index, colvalue) {
            var docname = colvalue.length > 50 ? colvalue.substr(0, 50) + "..." : colvalue;
            return "<a href='javascript:void(0);' rel='/Components/NBersEditor/EditorView.aspx?oid=" + rowdata.id + " 'oid='" + rowdata.id + " 'author='" + rowdata.create_user + "'>" + docname + "</a>";
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
