<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuIndex.aspx.cs" Inherits="WebPages.SystemManage.MenuIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>菜单列表</title>
    <link href="../resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/myform.css" rel="stylesheet" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <style type="text/css">
        /*.height200 {
            height:200px;
        }*/
        #unit_duty, #unit_figure {
            height: 200px;
            /*border:none;*/
        }

            #unit_duty:hover, #unit_figure:hover {
                border: 1px solid #D0D0D0;
                /*border:none;*/
            }

        input[name=pid_name], input[name=unit_type] {
            display: none;
        }
    </style>
    <script type="text/javascript">
        var menuTree = null;
        var menuBar=null;
        $(function () {
            //初始化tree
            var data = [];
            var JSONdata = GetDataByAjax('../NB_JsonHttp.aspx', "getAllMenus");
            //菜单树加载
            menuTree = $("#menuTree").ligerTree({
                data: JSONdata.data,
                isExpand: 2,
                nodeWidth: 300,
                checkbox: false,
                single: true,
                slide: true,
                idFieldName: 'id',
                parentIDFieldName: 'parentId',
                textFieldName: 'name',
            });
            //工具栏加载
            menuBar = $("#menuBar").ligerToolBar({
                items: <%= buttonJson %>
            });
            f=$('#myform').ligerForm();
        });
    
    //新增
    function AddItem(){
        openDialog(1);
    }
    
    //编辑
    function EditItem(){
        openDialog(2);
    }

    //state判断是新增还是编辑，1为新增，2为编辑
    function openDialog(state)
    {
        var node = menuTree.getSelected();
        if(node){
            if(state==1)//新增
            {
                //myTips("点击添加"+node.data.id);
                //初始化表格
                data={ id: "",
                    parentId: node.data.id,
                    code: "",
                    moduleId: "",
                    url: "",
                    icon: "",
                    levels: "0",
                    sortCode: "0",
                    enable:"1",
                    group_id:'0',
                };
                InitForm(data);
                //打开对话框
                $.ligerDialog.open({
                    target: $("#mytarget"), width: 680, title: "新增",
                    buttons: [
                        { text: '确定', onclick: function (item, dialog) { f_save(dialog);  } },
                        { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                    ]
                });
            }
            else if(state==2)//编辑
            {
                //myTips("点击修改"+node.data.id);
                //初始化表格
                var data = GetDataByAjax("../NB_JsonHttp.aspx", "getMenuById", node.data.id);
                InitForm(data);
                //打开对话框
                $.ligerDialog.open({
                    target: $("#mytarget"), width: 680, title: "编辑",
                    buttons: [
                        { text: '确定', onclick: function (item, dialog) { f_save(dialog); } },
                        { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                    ]
                });
            }
        }else{
            myTips("请选择节点！");
        }
    }
    
    //保存按钮操作
    function f_save(dialog) {
        var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "addMenu", "", "", JSON.stringify(f.getData()));
        if (returnStr.result) {
            myTips("操作成功！");
            window.location.reload();
            dialog.hidden();
        }
        else{
            myTips("操作失败！");
        }
    }

    //删除按钮
    function deleteRow()
    {
        var node = menuTree.getSelected();
        if (node){
            //myTips("点击删除"+node.data.id);
            var returnStr= GetDataByAjax("../NB_JsonHttp.aspx","deleteMenu",node.data.id,"","");
            if(returnStr)
            {
                menuTree.remove(node.target);
                myTips("删除成功！");
            }else{
                myTips("删除失败，请联系管理员！");
            }
        }
        else
            myTips("请选择节点！");
    }

    //初始化表格
    function InitForm(data)
    {
        if (data == null) {
            data = {
                id: "0",
                parentId: "",
                code: "",
                moduleId: "",
                url: "",
                icon: "",
                levels: "0",
                sortCode: "0",
                enable:"1",
                group_id:'0',
            };
        } else {
            //f.set("readonly", true);
        }
        f.setData(data);
    }
    </script>
</head>
<body>
    <div id="menuBar"></div>
    <div id="menuTree"></div>
    <div id="mytarget" style="width: 99%; margin: 3px; display: none">
        <div id="myform">
            <table class="op_tb">
                <caption style="text-align: center;">
                    <input type="hidden" name="id" value="" />
                </caption>
                <tbody>
                    <tr>
                        <td class="label">菜单名称：</td>
                        <td>
                            <input type="text" id="name" name="name" value="" /></td>
                        <td class="label">父级菜单：</td>
                        <td><input type="text" name="parentId" value="" /></td>
                    </tr>
                    <tr>
                        <td class="label">菜单简码：</td>
                        <td>
                            <input type="text" name="code" value="" /></td>
                        <td class="label">模块简码：</td>
                        <td>
                            <input type="text" name="moduleId" value="" /></td>
                    </tr>
                    <tr>
                        <td class="label">请求路径：</td>
                        <td colspan="3">
                            <input type="text" name="url" value="" /></td>
                    </tr>
                    <tr>
                        <td class="label">图标路径：</td>
                        <td colspan="3">
                            <input type="text" name="icon" value="" /></td>
                    </tr>
                    <tr>
                        <td class="label">层&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
                        <td>
                            <input type="text" name="levels" value="" /></td>
                        <td class="label">显示顺序：</td>
                        <td>
                            <input type="text" name="sortCode" value="" /></td>
                    </tr>
                    <tr>
                        <td class="label">是否启用</td>
                        <td >
                            <select name="enable">
                                <option value="1">启用</option>
                                <option value="0">停用</option>
                            </select>
                        </td>
                        <td class="label">菜单类型</td>
                        <td>
                            <select name="group_id">
                                <option value="0">菜单</option>
                                <option value="1">按钮</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
