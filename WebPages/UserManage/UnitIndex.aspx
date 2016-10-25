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
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        var groupicon = "../assets/lib/ligerUI/skins/icons/communication.gif";
        function itemclick(item)
        {
            myTips("测试tips");
        } 

        $(function ()
        {            
            window['g'] =
            $("#maingrid").ligerGrid({
                height: '99%',
                checkbox:true,
                columns: [
                    { display: '部门名称', name: 'unit_name', align: 'left' },
                    { display: '部门全名', name: 'unit_fullname' },
                    { display: '类型', name: 'unit_type', minWidth: 140 },
                    { display: '创建时间', name: 'createon' },
                     { display: '备注', name: 'remark' }
                ],
                url: "../myHandler.ashx?oprtype=getunits",
                pageSize: 30,
                rownumbers: true,
                toolbar: {
                    items: [
                    { text: '增加', click: AddUnit, icon: 'add' },
                    { line: true },
                    { text: '修改', click: EditItem, icon: 'modify' },
                    { line: true },
                    { text: '删除', click: deleteRow, img: '../assets/lib/ligerUI/skins/icons/delete.gif' }
                    ]
                },
                //autoFilter: true
            });
             
            window['f'] = $("#myform").ligerForm({
                inputWidth: 170, labelWidth: 90, space: 60,
                fields: [
                    { name: "id", type: "hidden", options: {value:"0000"} },
                    { display: "部门名称", name: "unit_name", type: "text", newline: true, group: "基础信息", groupicon: groupicon, isSort:true },
                    {
                        display: "上级部门 ", name: "pid", type: "select", newline: false, comboboxName: "pid_name", options: {
                            valueFieldID: "id",
                            textField: "unit_name",
                            url: "../myHandler.ashx?oprtype=GetFirstLevelUnit"
                        }
                    },
                    {
                        display: "部门类型 ", name: "unit_type", newline: true, type: "select", comboboxName: "unit_type", options: {
                            valueFieldID: "id",
                            data: [
                                {
                                    id: 0,
                                    text: "分类一"
                                }, {
                                    id: 1,
                                    text: "分类er"
                                }
                            ]
                        },                        
                    },
                    { display: "备注", name: "remark", newline: true, type: "text" }
                ]
            });

            $("#pageloading").hide();
        });

        function deleteRow()
        {
            g.deleteSelectedRow();

        }
        //新增部门
        function AddUnit()
        {
            //初始化form
            InitForm();
            $.ligerDialog.open({
                target: $("#mytarget"), width: 680, title: "新增部门",
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { f_save(); dialog.hidden(); } },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });

        }

        //编辑部门
        function EditItem()
        {
            var rows = g.getSelectedRows();
            if (rows.length != 1) {
                myTips("请选择一条数据进行编辑！");
                return;
            }

            var returnStr = GetDataByAjax("../myHandler.ashx", "GetUnitModel", rows[0].id);
            //初始化form
            InitForm(returnStr);
            $.ligerDialog.open({
                target: $("#mytarget"), width: 680, title: "编辑部门",
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { f_save(); dialog.hidden(); } },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });
            
        }

        function f_save() {
            var returnStr = GetDataByAjax("../myHandler.ashx", "AddUnit", "", "", JSON.stringify(f.getData()));

            if (returnStr.result) {
                //TODO:tips延迟自动关闭
                $.ligerDialog.tip({ title: '提示信息', content: '      新增成功！' ,callback:function(t)
                {
                    //setTimeout(function ()
                    //{
                    //    $(t).remove(); //5秒延迟后关闭tip
                    //}, 3000);
                    //console.log(t);
                }});
                window['g'].reload();
            }
        }

        function InitForm(data)
        {
            if (typeof (data) == "undefined") {
                data = [{
                    remark: "",
                }];
            }           
            f.setData( data);
        }

  </script> 
</head>
<body style="overflow-x:hidden; padding:2px;">
<div class="l-loading" style="display:block" id="pageloading"></div>
 <a class="l-button" style="width:120px;float:left; margin-left:10px; display:none;" onclick="deleteRow()">删除选择的行</a>
 <div class="l-clear"></div>
    <div id="maingrid"></div>
  <div style="display:none;">
</div>
     <div id="mytarget" style="width:99%; margin:3px; display:none;">
         <div id="myform"></div>
     </div> 
</body>
</html>
