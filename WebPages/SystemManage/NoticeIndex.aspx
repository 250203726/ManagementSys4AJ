<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeIndex.aspx.cs" Inherits="WebPages.SystemManage.NoticeIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>公告管理</title>
    <link href="../resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" />
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
                    { display: '公告标题', name: 'title', minWidth: 60, align: 'left', render: g_render4name },
                    { display: '公告内容', name: 'content', minWidth: 400, align: 'left',  },
                    { display: '发布状态', name: 'ispublish', width: 60, render: g_render4publish },
                    { display: '发布人', name: 'create_user', width: 80, },
                    { display: '最新编辑', name: 'create_date', width: 120, render: g_render4time }
                ],
                //data:grid_data.data,
                url: "../NB_JsonHttp.aspx?oprtype=GetArticle4Grid&strkey=" + myEscape('部门公告'),
                pageSize: 30,
                rownumbers: true,
             toolbar:     {
                    items: 
                    [
                          { line: true },
                        { text: "新增", click: itemclick, icon: "add" },
                          { line: true },
                          { text: "修改", click: itemclick, icon: "edit" },
                          { line: true },
                        { text: "删除", click: itemclick, icon: "../assets/lib/ligerUI/skins/icons/delete.gif" },
                          { line: true },
                    ]
                },
                //autoFilter: true
                //{ line: true },
                //{ text: "下载", click: OnKeyDown, icon: "download", options: { id: "123" } },
            });
             window['f'] = $("#myform_notice").ligerForm({
                 inputWidth: 250, labelWidth: 90, space: 60,
                 fields: [
                     { type: "hidden", name: "id", value: "0" },
                      { name: "art_type", type: "hidden", options: { value: "部门公告" } },
                      { display: "公告标题", name: "title", type: "text", labelAlign: "right", validate: { required: true } },
                      { display: "公告内容", name: "content", type: "textarea", labelAlign: "right", validate: { required: true } },
                      { display: "是否发布", name: "ispublish", type: "checkbox", labelAlign: "right"},
                 ]
             });
            $("#pageloading").hide();
        });

        function OnKeyDown(obj)
        {
            
        }

        //点击新增按钮事件
        function itemclick(btn) {
            if (btn.text == "新增") {
                var form_null = {};
                form_null.id = 0;
                form_null.title = "";
                form_null.content = "";
                form_null.ispublish = 0;
                f.setData(form_null);

                $.ligerDialog.open({
                    target: $("#form_notice"), width: 480, title: btn.text +"公告",
                    buttons: [
                        { text: '确定', onclick: function (item, dialog) { f_save(dialog) } },
                        { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                    ]
                });
            } else if (btn.text == "修改") {
                var rows = g.getSelectedRows();
                if (rows.length != 1) {
                    myTips("请选择一条数据进行编辑！");
                    return;
                }

                var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "GetArticleByID", rows[0].id);

                f.setData(returnStr.data);
                $.ligerDialog.open({
                    target: $("#form_notice"), width: 480, title: btn.text + "公告",
                    buttons: [
                        { text: '确定', onclick: function (item, dialog) { f_save(dialog); } },
                        { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                    ]
                });

            } else if (btn.text == "删除") {
                deleteRow();
            }
            
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
            var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "DELETEARTICLES", ids, "", null);

            if (returnStr.result) {
                g.deleteSelectedRow();
                myTips(returnStr.msg);
            } else {
                myTips("删除失败，请联系管理员！");
            }
        }

        function f_save(dailog) {
            var post_data = f.getData();
            if (post_data.ispublish) {
                post_data.ispublish = 1;
            } else {
                post_data.ispublish = 0;
            }
            var Rtn = GetDataByAjax("../../NB_JsonHttp.aspx", "SAVEARTICLE", "", "", JSON.stringify(post_data));
            if (Rtn.result) {
                myTips("保存公告成功！");
                g.reload();
            } else {
                myTips(Rtn.msg);
            }
            dailog.hidden();
        }
       

        
        //渲染文件名称为超链接  add by wonder4 2016年11月5日15:41:23
        function g_render4name(rowdata, index, colvalue) {
            if (typeof (colvalue) == "undefined") {
                return;
            }
            var docname = colvalue.length > 50 ? colvalue.substr(0, 50) +"...": colvalue;
            return docname;
        }
        function g_render4publish(rowdata, index, colvalue) {
            if (typeof (colvalue) == "undefined") {
                return;
            }
            var docname = colvalue == "1" ? "<font color='green'>启用</font>" : "<font color='red'>禁用</font>";
            return docname;
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
        <div id ="form_notice" class="form_notice" style="width:99%; margin:3px; display:none;">
        <div id="myform_notice"></div>
    </div>
</body>
</html>
