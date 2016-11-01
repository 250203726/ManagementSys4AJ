<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnitIndex.aspx.cs" Inherits="WebPages.UserManage.Unitindex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>部门管理</title>
    <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
<%--    <script src="../assets/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="../assets/lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>--%>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <style type="text/css">
        #layout1{  width:100%;margin:0; padding:0;  }
    </style>
    <script type="text/javascript">
        var data = [];
        $(function () {

            var tree_data = GetDataByAjax('../NB_JsonHttp.aspx', "GetUnits", "");

            var tree = $("#tree1").ligerTree({
                data: tree_data.data,
                idFieldName: 'id',
                textFieldName: 'unit_name',
                parentIDFieldName: 'pid',
                checkbox:false
            });
            //treeManager = $("#tree1").ligerGetTreeManager();
            //treeManager.collapseAll();
            window['g'] =
            $("#maingrid").ligerGrid({
                height: '99%',
                columns: [
                    { display: '用户编码', name: 'account', align: 'left' },
                    { display: '用户名', name: 'nickname' },
                    { display: '电话', name: 'last_login_time', minWidth: 140 },
                    { display: '邮件', name: 'email' },
                     { display: '备注', name: 'remark' }
                ],
                url: "../NB_JsonHttp.aspx?oprtype=getusers",
                pageSize: 30,
                rownumbers: true,
                toolbar: {
                    items: [
                    { text: '增加', click: itemclick, icon: 'add' },
                    { line: true },
                    { text: '修改', click: itemclick, icon: 'modify' },
                    { line: true },
                    { text: '删除', click: itemclick, img: '../assets/lib/ligerUI/skins/icons/delete.gif' }
                    ]
                },
                //autoFilter: true
            });
            
        });
        function itemclick() { }
  </script> 
</head>
<body style="overflow-x:hidden; padding:5px; margin:0; padding-bottom:15px;">
    <div id="layout1" class="l-layout" style="height:100%;" ligeruiid="layout1">
        <div class="l-layout-left" style="left: 0px; width: 200px; top: 0px; height: 500px;">
            <div class="l-layout-header">
                <%--<input type="button" name="name" value="test" />--%>
                <div class="l-layout-header-inner">组织结构</div>
            </div>
            <div position="left" class="l-layout-content">
               <ul id="tree1"></ul>
                <div class="l-tree-loading"></div>
            </div></div>
        <div class="l-layout-center" style="width: 975px; top: 0px; left: 205px; height: 500px;">
            <div class="l-layout-header">用户列表</div>
            <div position="center" title="" class="l-layout-content" style="height: auto;">
            <div id="maingrid"></div>
        </div></div> 
      </div>
</body>
</html>
