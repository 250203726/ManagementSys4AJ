﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnitIndex.aspx.cs" Inherits="WebPages.UserManage.UnitIndex" %>

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
    <style type="text/css">
        /*.height200 {
            height:200px;
        }*/
        #unit_duty,#unit_figure {
        height:220px;
        /*border:none;*/
        }
        #unit_duty:hover,#unit_figure:hover {
      border: 1px solid #D0D0D0;
        /*border:none;*/
        }
        input[name=pid_name],input[name=unit_type] {        
        display:none;
        }
    </style>
    <script type="text/javascript">
        var groupicon = "../assets/lib/ligerUI/skins/icons/communication.gif";

        $(function ()
        {   
            var unit_data=GetDataByAjax("../NB_JsonHttp.aspx","GetFirstLevelUnit","","",null);
            window["g"] =
            $("#maingrid").ligerGrid({
                height: '99%',
                checkbox:true,
                columns: [
                    { display: '部门名称', name: 'unit_name', align: 'left' },
                    { display: '部门全名', name: 'unit_fullname' },
                    { display: '类型', name: 'child_type', minWidth: 140 },
                    { display: '创建时间', name: 'createon' ,render:g_render4time},
                     { display: '备注', name: 'remark' }
                ],
                //data:grid_data.data,
                url:"../NB_JsonHttp.aspx?oprtype=getunits",
                pageSize: 30,
                rownumbers: true,
                toolbar:     {
                    items: 
                    <%= buttonJson %>   
                },
                //autoFilter: true
            });
             
            window['f'] = $("#myform").ligerForm({
                inputWidth: 170, labelWidth: 90, space: 60,
                fields: [
                    { name: "id", type: "hidden", options: {value:"0"} },
                    { name: "unit_type", type: "hidden", options: {value:"1"} },
                    { display: "部门名称", name: "unit_name", type: "text", newline: true, group: "基础信息", 
                    groupicon: groupicon, isSort: true,
                        validate:{required:true}},
                     { display: "部门全称", name: "unit_fullname", type: "text", newline: false,validate:{required:true} },
                    {
                        display: "所属上级 ", name: "pid", type: "select", newline: true, comboboxName: "pid_name", options: {
                            valueFieldID: "id",
                            textField: "unit_name",
                            data:unit_data.data
                        },validate:{required:true}
                    },
                    {
                        display: "部门性质 ", name: "child_type", newline: false, type: "select", comboboxName: "unit_type", options: {
                            valueFieldID: "id",
                            data: [
                                {
                                    id:"农电",
                                    text: "农电"
                                }, {
                                    id: "长工",
                                    text: "长工"
                                }
                            ]
                        },   validate:{required:true}                     
                    },
                ],
                tab: {
                    items: [
                        {
                            title: '形象及宗旨', fields: [
                                   {
                                       display: "形象及宗旨", name: "unit_figure", newline: true, type: "textarea", width: 625, 
                                       validate: {}, hideLabel: true
                                   }
                            ]
                        },
                        {
                            title: '部门职责', fields: [
                                   {
                                       display: "部门职责", name: "unit_duty", newline: true, type: "textarea", width: 625,
                                       validate: {}, hideLabel: true
                                   }
                            ]
                        }
                    ]
                }
            });

            $("#pageloading").hide();
        });

        //功能：删除部门
        function deleteRow()
        {
            var rows = g.getSelectedRows();
            if (rows.length ==0) {
                myTips("请选择数据进行删除！");
                return;
            }
            //服务端删除，合并id为ids
            var ids = rows.map(function (data, index) { return data.id }).join(",");
            var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "DeleteUnits", ids);

            if (returnStr.result) {
                g.deleteSelectedRow();
                myTips(returnStr.msg);
            } else {
                myTips("删除失败，请联系管理员！");
            }          
        }
       
        //新增部门
        function AddItem()
        {
            //初始化form
            InitForm(null);
            $.ligerDialog.open({
                target: $("#mytarget"), width: 680, title: "新增部门",
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { f_save(dialog);} },
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
            
            var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "GetUnitModel", rows[0].id);
            //初始化form
            InitForm(returnStr);
            $.ligerDialog.open({
                target: $("#mytarget"), width: 680, title: "编辑部门",
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { f_save(dialog); } },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });
            
        }

        function setbiz_duty()
        { }
        function f_save(dialog) {
            //必填校验
            var post_data=f.getData();
            if (post_data.unit_name.length==0) {
                myTips("部门名称不能为空");
                return ;
            }
            if (post_data.unit_fullname.length==0) {
                myTips("部门全称不能为空");
                return;
            }
            if (post_data.child_type.length==0) {
                myTips("部门性质不能为空");
                return;
            }
            if (post_data.unit_type.length==0) {
                myTips("所属上级不能为空");
                return;
            }
            var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "AddUnit", "", "", JSON.stringify(post_data));

            if (returnStr.result) {
                myTips("操作成功！");
                g_reflesh();
            }
            else{
            }
             dialog.hidden(); 
        }

        function g_reflesh(){
            g.reload();
        }

        function InitForm(data)
        {
            if (data == null) {
                data = {
                    id: "0000",
                    unit_name: "",
                    unit_fullname: "",
                    pid: "",
                    unit_type: "1",
                    unit_duty: "",
                    unit_figure: "",
                    remark: "",
                };
            } else {
                //f.set("readonly", true);
            }
            f.setData(data);
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
