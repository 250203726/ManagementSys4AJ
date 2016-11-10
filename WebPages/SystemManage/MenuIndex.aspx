<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuIndex.aspx.cs" Inherits="WebPages.SystemManage.MenuIndex" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>菜单列表</title>
    <link href="../resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>

    <style type="text/css">
        /*.height200 {
            height:200px;
        }*/
        input[name=enable], input[name=group_id], input[name=levels] {
        display:none;
        }
    </style>
    <script type="text/javascript">
        var menuTree = null;
        var menuBar=null;
        $(function () {
            //初始化tree
            var groupicon = "../assets/lib/ligerUI/skins/icons/communication.gif";
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
            window['f'] = $("#myform").ligerForm({
                inputWidth: 170, labelWidth: 90, space: 60,
                fields: [
                    { name: "id", type: "hidden", options: {value:"0"} },
                    { display: "菜单名称", name: "name", type: "text", newline: false },
                     { display: "父级菜单", name: "parentId", type: "text", newline: false },
                       { display: "菜单简码", name: "code", type: "text", newline: false },
                       { display: "模块简码", name: "moduleId", type: "text", newline: false },
                       { display: "请求路径", name: "url", type: "text", newline: false },
                       { display: "图标路径", name: "icon", type: "text", newline: false },
                       { display: "层&nbsp;&nbsp;&nbsp;&nbsp;级", name: "levels", type: "select", newline: false, comboboxName: "levels",
                           options: {
                               data: [
                                        {
                                            id:"1",
                                            text: "1层"
                                        }, {
                                            id: "2",
                                            text: "2层"
                                        }, {
                                            id: "3",
                                            text: "3层"
                                        }
                               ]},
                       },
                       { display: "显示顺序", name: "sortCode", type: "text", newline: false },
                       { display: "是否启用", name: "enable", type: "select", newline: false, comboboxName: "enable",
                           options: {
                               data: [
                                        {
                                            id:"1",
                                            text: "启用"
                                        }, {
                                            id: "0",
                                            text: "停用"
                                        }
                               ]},
                       },
                    {
                        display: "菜单类型 ", name: "group_id", type: "select", newline: false, comboboxName: "group_id",
                        options: {
                            data: [
                                 {
                                    id:"0",
                                    text: "菜单"
                                 },{
                                     id:"1",
                                     text: "按钮"
                                 }
                            ]
                        },
                    }],           
            });
        });
    
    //初始化表格
    function InitForm(data)
    {
        f.setData(data);
    }

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
                dataNull={
                    version:1,
                    parentId:node.data.id,
                    name:"",
                    url:"",
                    paramss:"",
                    icon:"",
                    levels:"1",
                    sortCode:"0",
                    moduleId:"",
                    enable:"1",
                    group_id:"1",
                    id:"0"
                };
                InitForm(dataNull);
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
                InitForm(data.data);
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
        var postData=f.getData();
        if (!postData.id) {
            postData.id=0;
        }
        var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "addMenu", "", "", JSON.stringify(postData));
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

    
    </script>
</head>
<body>
    <div id="menuBar"></div>
    <div id="menuTree"></div>
    <div id="mytarget" style="width: 99%; margin: 3px; display: none">
        <div id="myform">
        </div>
    </div>
</body>
</html>
