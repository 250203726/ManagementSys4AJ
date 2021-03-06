﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserIndex.aspx.cs" Inherits="WebPages.UserManage.UserIndex" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>部门管理</title>
    <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />

    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../assets/js/placeholder.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <style type="text/css">
        #layout1 {
            width: 100%;
            margin: 0;
            padding: 0;
        }

        input[name=unit_id], input[name=type_id] {
            display: none;
        }

        .filter {
        }

            .filter input[type=text] {
                margin-left: 8px;
                width: 180px;
                color: #000000;
                font-weight: normal;
            }

            .filter input[type=button] {
                width: 52px;
                margin-left: 9px;
                font-weight: normal;
                cursor: pointer;
            }
        /*.checkbox {
            width: 280px;
	        height: 10px;
	        
	        margin: 20px 80px;
	        position: relative;
	        border-radius: 3px;
        }*/
        .checkbox td{width:100px;font-size:20px} 
        .checkbox label{display:inline-block;width:80px;color:blue}
        /****复选框按钮样式****/
        .chk_1 label {
	        background-color: #FFF;
	        border: 1px solid #C1CACA;
	        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05);
	        padding: 9px;
	        border-radius: 5px;
	        display: inline-block;
	        position: relative;
	        margin-right: 30px;
        }
        .chk_1 label:active {
	        box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
        }

        .chk_1:checked label {
	        background-color: #ECF2F7;
	        border: 1px solid #92A1AC;
	        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05), inset 15px 10px -12px rgba(255, 255, 255, 0.1);
	        color: #243441;
        }

        .chk_1:checked label:after {
	        content: '\2714';
	        position: absolute;
	        top: 0px;
	        left: 0px;
	        color: #758794;
	        width: 100%;
	        text-align: center;
	        font-size: 1.4em;
	        padding: 1px 0 0 0;
	        vertical-align: text-top;
        }
    </style>
    <script type="text/javascript">
        var g;
        var tree_manger;
        var user_type;
        var station_list;
        $(function () {
            var groupicon = "../assets/lib/ligerUI/skins/icons/communication.gif";
            $("#layout1").ligerLayout({ leftWidth: 210, height: '100%', rightWidth: 0 });

            var tree_data = GetDataByAjax('../NB_JsonHttp.aspx', "GetUnits4Tree", "");
            var myaccount = '../assets/lib/ligerUI/skins/icons/department.png';
            var memeber = '../assets/lib/ligerUI/skins/icons/role.gif';
            var archives = '../assets/lib/ligerUI/skins/icons/archives.gif';

            var tree_data_format = tree_data.data.map(function (value, n) {
                switch (value.unit_type) {
                    case 0:
                        value.icon = myaccount;
                        return value;
                        break;
                    case 1:
                        value.icon = archives;
                        return value;
                        break;
                    case 2:
                        value.icon = memeber;
                        return value;
                        break;
                    default:
                        return value;
                        break;
                }
            });

            var tree = $("#tree1").ligerTree({
                data: tree_data.data,
                idFieldName: 'id',
                textFieldName: 'unit_name',
                parentIDFieldName: 'pid',
                checkbox: false,
                onClick: onClick,
            });


            window['g'] =
            $("#maingrid").ligerGrid({
                height: '99.8%',
                width: "100%",
                columns: [
                    { display: '用户编码', name: 'account', align: 'left' },
                    { display: '用户名称', name: 'nickname' },
                    { display: '电话', name: 'last_login_time', minWidth: 140 },
                    { display: '类型', name: 'type_id', render: f_render_type },
                    { display: '岗位', name: 'unit_id', render: f_render_unit },
                    { display: '邮件', name: 'email' },
                    { display: '备注', name: 'remark' }
                ],
                checkbox: true,
                url: "../NB_JsonHttp.aspx?oprtype=getusers",
                pageSize: 30,
                rownumbers: true,
                toolbar: {
                    items: <%= buttonJson %>   
                },
            });

            //获取角色类型
            var myuser_type = GetDataByAjax('../NB_JsonHttp.aspx', "getroles", "", "", "");

            user_type = $.map(myuser_type.data.Rows, function (item,n) {
                return {id:item.id,text:item.name};
            });
            //获取组织架构树
            tree_manger = $("#tree1").ligerGetTreeManager();

            station_list = GetDataByAjax('../NB_JsonHttp.aspx', "GetStationList", "", "", "");

            //创建用户管理form
            window['f'] = $("#myform").ligerForm({
                inputWidth: 160, labelWidth: 80, space: 40,
                fields: [
                     { type: "hidden", name: "id", value: "0" },
                     {
                         display: "用户编码", name: "account", type: "text", labelAlign: "right", group: "基础信息", groupicon: groupicon, isSort: true,
                         validate: { required: true }
                     },
                     {
                         display: "用户名称", name: "nickname", type: "text", labelAlign: "right", newline: false,
                         validate: { required: true }
                     },                     
                     {
                         display: "用户类型", name: "type_id", type: "select", labelAlign: "right", comboboxName: "type_id", newline: true, options: {
                             data: user_type
                         }, validate: { required: true }
                     },
                     {
                         display: "所属岗位", name: "unit_id", type: "select", labelAlign: "right", comboboxName: "unit_id", newline: false, options: {
                             textField: "unit_name",
                             data: station_list.data
                         }, validate: { required: true }
                     },
                     { display: "邮箱", name: "email", type: "text", labelAlign: "right" },
                      { display: "电话", name: "phone", type: "digits", labelAlign: "right", newline: false },
                    { display: "备注", name: "info", type: "textarea", labelAlign: "right", width: 450 },
                ]
            });
        });

        //grid查询
        function f_getWhere() {
            if (!g) return null;
            var clause = function (rowdata, rowindex) {
                var key = $("#txtKey").val();
                return rowdata.CustomerID.indexOf(key) > -1;
            };
            return clause;
        }

        //按钮点击事件
        function AddItem(btn) {
            var formNULL = {
                id: "0",
                account: "",
                nickname: "",
                email: "",
                phone: "",
                type_id: "",
                unit_id: "",
                password: "",
                info: "",
            };
            f.setData(formNULL);
            $.ligerDialog.open({
                target: $("#mytarget"), width: 600, title: btn.text + "用户",
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { f_save(dialog); } },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });
        }
        function EditItem(btn) {
            var rows = g.getSelectedRows();
            if (rows.length != 1) {
                myTips("请选择一条数据进行编辑！");
                return;
            }

            var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "GetUserInfo", rows[0].id);

            f.setData(returnStr.data);
            $.ligerDialog.open({
                target: $("#mytarget"), width: 600, title: btn.text + "用户",
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { f_save(dialog); } },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });
        }
        function deleteRow(btn) {
            var rows = g.getSelectedRows();
            if (rows.length == 0) {
                myTips("请选择数据进行删除！");
                return;
            }
            //服务端删除，合并id为ids
            var ids = rows.map(function (data, index) { return data.id }).join(",");
            var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "DeleteUsers", ids);

            if (returnStr.result) {
                g.deleteSelectedRow();
                myTips(returnStr.msg);
            } else {
                myTips("删除失败，请联系管理员！");
            }
        }
        function AssigningRoles(btn) {
            var rows = g.getSelectedRows();
            if (rows.length != 1) {
                myTips("请选择一条数据分配角色！"); return;
            }
            //查询数据库，在复选框中绑定用户角色信息。并弹出对话框
            //1.绑定数据 一个是用户名称 一个是角色列表
            $("#username").html('用户“' + rows[0].nickname + '”的角色有：');
            $("#userid").val(rows[0].id);
            //选中已有角色列表
            var userrole = GetDataByAjax("../NB_JsonHttp.aspx", "getUserRoles", rows[0].id);
            if (userrole.result) {
                liger.get("checkboxlist1").setValue(userrole.data);
            } else {
                myTips("选中已有角色列表时失败！");
            }

            //2.弹出对话框
            $.ligerDialog.open({
                target: $("#roledialog"), width: 600, height: 300, title: btn.text,
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { saveRole(); dialog.hidden(); } },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });
        }
        //function itemclick(btn) {
        //    if (btn.text == "增加") {
        //        var formNULL = {
        //            id: "0",
        //            account: "",
        //            nickname: "",
        //            email: "",
        //            phone: "",
        //            type_id: "",
        //            unit_id: "",
        //            password: "",
        //            info: "",
        //        };
        //        f.setData(formNULL);
        //        $.ligerDialog.open({
        //            target: $("#mytarget"), width: 600, title: btn.text + "用户",
        //            buttons: [
        //                { text: '确定', onclick: function (item, dialog) { f_save(dialog); } },
        //                { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
        //            ]
        //        });
        //    } else if (btn.text == "修改") {
        //        var rows = g.getSelectedRows();
        //        if (rows.length != 1) {
        //            myTips("请选择一条数据进行编辑！");
        //            return;
        //        }

        //        var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "GetUserInfo", rows[0].id);

        //        f.setData(returnStr.data);
        //        $.ligerDialog.open({
        //            target: $("#mytarget"), width: 600, title: btn.text + "用户",
        //            buttons: [
        //                { text: '确定', onclick: function (item, dialog) { f_save(dialog);} },
        //                { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
        //            ]
        //        });
        //    } else if (btn.text == "删除") {
        //        var rows = g.getSelectedRows();
        //        if (rows.length == 0) {
        //            myTips("请选择数据进行删除！");
        //            return;
        //        }
        //        //服务端删除，合并id为ids
        //        var ids = rows.map(function (data, index) { return data.id }).join(",");
        //        var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "DeleteUsers", ids);

        //        if (returnStr.result) {
        //            g.deleteSelectedRow();
        //            myTips(returnStr.msg);
        //        } else {
        //            myTips("删除失败，请联系管理员！");
        //        }
        //    }
        //    else if (btn.text == "分配角色") {
        //        var rows = g.getSelectedRows();
        //        if (rows.length != 1) {
        //            myTips("请选择一条数据分配角色！"); return;
        //        }
        //        //查询数据库，在复选框中绑定用户角色信息。并弹出对话框
        //        //1.绑定数据 一个是用户名称 一个是角色列表
        //        $("#username").html('用户“' + rows[0].nickname + '”的角色有：');
        //        $("#userid").val(rows[0].id);
        //        //选中已有角色列表
        //        var userrole = GetDataByAjax("../NB_JsonHttp.aspx", "getUserRoles", rows[0].id);
        //        if (userrole.result) {
        //            liger.get("checkboxlist1").setValue(userrole.data);
        //        } else {
        //            myTips("选中已有角色列表时失败！");
        //        }

        //        //2.弹出对话框
        //        $.ligerDialog.open({
        //            target: $("#roledialog"), width: 600,height:300, title: btn.text,
        //            buttons: [
        //                { text: '确定', onclick: function (item, dialog) { saveRole(); dialog.hidden(); } },
        //                { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
        //            ]
        //        });

        //    }
        //}

        //树 节点点击事件
        function onClick(node) {
            g.loadServerData({ unit_id: node.data.id }, function () { });
        }
        //grid 数据过滤
        function grid_search(filter) {
            //g.options.data = $.extend(true, {}, user_grid.data);
            //g.loadData(f_getWhere());
        }

        //用户form保存事件
        function f_save(dialog) {
            //TODO:必填校验
            var user_post = f.getData();
            if (user_post.account.length == 0) {
                myTips("用户编码不能为空");
                return false;
            }
            if (user_post.nickname.length == 0) {
                myTips("用户名称不能为空");
                return;
            }
            if (user_post.type_id.length == 0) {
                myTips("用户类型不能为空");
                return;
            }
            if (user_post.unit_id.length == 0) {
                myTips("所属岗位不能为空");
                return;
            }

            var ret = GetDataByAjax("../NB_JsonHttp.aspx", "UpdateUser", "", "", JSON.stringify(user_post));
            if (ret.result) {
                myTips(ret.msg);
                g.reload();
            } else { }
            dialog.hidden();
        }

        function f_render_type(rowdata, index, colvalue) {
            var a = user_type.map(function (value) {
                if (colvalue == value.id) {
                    return value.text;
                }
            });
            return a.join("");
        }
        function f_render_unit(rowdata, index, colvalue) {
            var a = station_list.data.map(function (value) {
                if (colvalue == value.id) {
                    return value.unit_name;
                }
            });
            return a.join("");
        }

        //绑定查询按钮点击事件 add by wonder4 2016年11月12日18:54:42
        $(document).on("click", ".filter input[name=btn_submit]", function () {
            var filter = $("#txt_filter").val();
            if (filter.length == 0) {//没有输入过滤条件，则直接刷新列表
                g.reload();
                return;
            }
            //post请求服务器
            g.loadServerData({ txt_filter: filter }, function () { });
        });

        $(function () {
            var dataGrid = GetDataByAjax("../NB_JsonHttp.aspx", "GETROLES").data.Rows;
            //[
            //    { id: 1, name: '管理员'},
            //    { id: 2, name: '工作人员'},
            //    { id: 3, name: '领导'},
            //    { id: 4, name: '基层员工'},
            //];
            $("#checkboxlist1").ligerCheckBoxList({
                data: dataGrid,
                textField: 'name',
                css: 'chk_1',
            });
        });
       
        //分配角色按钮
        function saveRole() {
            var roleids = liger.get("checkboxlist1").getValue();
            var userid = $("#userid").val();
            //把角色编号列表和用户编号传给后台去处理，返回成功或失败
            if (true) {
                //为真表示已经保存了角色编号和用户编号，则弹出提示信息，并关闭对话框
                GetDataByAjax("../NB_JsonHttp.aspx", "ADDUSERROLE", userid, roleids);
                myTips("保存成功！");
            }
            else {
                //为假，表示保存失败。弹出提示信息，不关闭对话框。
                myTips("保存失败！");
            }
        }
    </script>
</head>
<body style="overflow-x: hidden; padding: 5px; margin: 0;">
    <div id="layout1">
        <div position="left" title="组织结构">
            <ul id="tree1"></ul>
        </div>
        <div position="center" title="<div class='filter'><span>用户列表</span><input id='txt_filter'  name='txt_filter' type='text' class='ui-textbox'  placeholder='输入用户名、用户编码'/><input type='button' name='btn_submit' value='查询'/></div>">
            <div id="maingrid"></div>
        </div>

        <!-- 新增编辑对话框 -->
        <div id="mytarget" style="width: 100%; display: none">
            <div id="myform"></div>
        </div>

        <!-- 分配角色对话框 -->
        <div id="roledialog" style="display: none">
            <label id="username"></label>
            <%--<span>的角色有：</span>--%>
            <input type="hidden" id="userid" />
            <!-- 里面放用户角色列表 -->
            <div id="roletree"></div>
            <input type="hidden" name="role" id="role" value="<%= rlist %>" />

            <!-- 测试复选框 -->
            <div id="checkboxlist1" ></div>
           
        </div>
</body>
</html>
