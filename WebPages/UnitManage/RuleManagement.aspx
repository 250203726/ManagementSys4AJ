<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RuleManagement.aspx.cs" Inherits="WebPages.UnitManage.RuleManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理制度</title>
     <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 

    <script src="../Components/NBersFileServices/jquery.uploadify.js" type="text/javascript"></script>
    <link href="../Components/NBersFileServices/uploadify.css" rel="stylesheet" />
    <link href="../Components/NBersFileServices/file-icon.css" rel="stylesheet" />

    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            window["g"] =
           $("#maingrid").ligerGrid({
               height: '99%',
               columns: [
                   { display: '类型', name: 'remark', width: 40, render: g_render4type },
                   { display: '文章标题', name: 'title', minWidth: 260, align: 'left', render: g_render4name },
                   { display: '所属分类', name: 'art_type', width: 150 },
                   { display: '作者', name: 'create_user', width: 120, },
                   { display: '最新编辑', name: 'create_date', width: 120, render: g_render4time },
                    { display: '操作', width: 120,render:g_render4handlebar }
               ],
               //data:grid_data.data,
               url: "../NB_JsonHttp.aspx?oprtype=GETFILESANDARTICLE4GRID&strkey="+myEscape('管理制度'),
               pageSize: 30,
               rownumbers: true,
               toolbar: {
                   items:<%= buttonJson %>
               },
           });

            //upfiles 渲染上传控件
            $("#file_upload").uploadify({
                'formData': {
                    'timestamp': Math.random(),
                    'token': "wonder4",
                    'fkGuid': "123456",
                    'docType': '管理制度',
                },
                'swf': '../Components/NBersFileServices/uploadify.swf',
                'uploader': '../Components/NBersFileServices/FileHandler.ashx',
                'buttonText': '上传',
            });
            //给工作工作计划名称绑定事件
            $(document).on("click", "table.l-grid-body-table td div.l-grid-row-cell-inner a[name=article]", function (e) {
                e.stopPropagation();
                e.preventDefault();

                var top_tab = window.top.tab;
                var oid = $(e.target).attr("oid");
                var url = $(e.target).attr("rel");
                var author = $(e.target).attr("author");

                if (top_tab.isTabItemExist("RuleManagement")) {
                    top_tab.setHeader("RuleManagement", author + "-管理制度");
                    top_tab.setTabItemSrc("RuleManagement", url);
                    top_tab.reload("RuleManagement");
                    top_tab.selectTabItem("RuleManagement");
                    return;
                }
                window.top.f_addTab("WorkPlan", author + "-管理制度", url);

            });
            $("#pageloading").hide();
        });

        function EditItem(btn) {
            var rows = g.getSelectedRows();
            if (rows.length != 1) {
                myTips("请选择一条数据进行编辑！");
                return;
            }
            if (rows[0].remark == 'file') {
                myTips("请选择文章类数据编辑！");
                return;
            }
            window.top.f_addTab("Save_RuleManagement", btn.text + "-管理制度", "/UnitManage/SavePage/SaveRuleManagement.aspx?nodeid=29&mode=2&oid=" + rows[0].id + "&v=" + Math.random());
        }

        //点击上传按钮的操作 add wonder4 2016年11月7日22:54:21
        function OnUpfiles() {
            //TODO：清理上传列表
            $.ligerDialog.open({
                target: $("#mytarget"), width: 500, minHeight: 300, title: "管理制度",
                buttons: [
                    { text: '取消', onclick: function (item, dialog) { g.reload(); dialog.hidden(); } }
                ]
            });
        }
        function ItemClick(btn) {
            window.top.f_addTab("Save_RuleManagement", btn.text + "-管理制度", "/UnitManage/SavePage/SaveRuleManagement.aspx?nodeid=29&mode=1&v=" + Math.random());
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
            //服务端删除，合并id为ids
            if (rows[0].remark && rows[0].remark=="file") {//附件
                var returnStr = GetDataByAjax("../Components/NBersFileServices/DeleteFileHandle.ashx?", "", "", "", { fileids: ids });
            }else {
                var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "DELETEARTICLES", ids, "", null);
            }

            if (returnStr.result) {
                g.deleteSelectedRow();
                myTips(returnStr.msg);
            } else {
                myTips("删除失败，请联系管理员！");
            }
        }

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
            if (!colvalue) {
                return;
            }
            var docname = colvalue.length > 50 ? colvalue.substr(0, 50) + "..." : colvalue;
            var fileExt = (/[.]/.exec(colvalue)) ? /[^.]+$/.exec(colvalue.toLowerCase()) : '';
            var cls_icon = "ico-file-ico";
            if (fileExt.length > 0) {
                cls_icon = "ico-file-" + fileExt[0];
            }
            if (rowdata.remark && rowdata.remark=="file") {//附件
                return "<SPAN class='ico-file " + cls_icon + "'></SPAN><a href='../Components/NBersFileServices/DownloadHandler.ashx?fileids=" + rowdata.id + " 'rel='" + rowdata.id + " 'target='_blank'>" + docname + "</a>";
            } else {//文章
                return "<SPAN class='ico-file " + cls_icon + "'></SPAN><a name='article' href='javascript:void(0);' rel='/Components/NBersEditor/EditorView.aspx?oid=" + rowdata.id + " 'oid='" + rowdata.id + " 'author='" + rowdata.create_user + "'>" + docname + "</a>";
            }
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
