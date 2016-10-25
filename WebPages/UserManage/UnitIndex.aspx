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
            $.ligerDialog.tip({
                title: '提示信息', content: '      新增成功！', callback: function () {
                    //setTimeout(function ()
                    //{
                    //    $(t).remove(); //5秒延迟后关闭tip
                    //}, 3000);
                    //console.log(t);
                    alert();
                }
            });
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
                    { text: '增加', click: AddUser, icon: 'add' },
                    { line: true },
                    { text: '修改', click: itemclick, icon: 'modify' },
                    { line: true },
                    { text: '删除', click: deleteRow, img: '../assets/lib/ligerUI/skins/icons/delete.gif' }
                    ]
                },
                //autoFilter: true
            });
             
            window['f'] = $("#form2").ligerForm({
                inputWidth: 170, labelWidth: 80, space: 40,
                fields: [
                    { name: "id", type: "hidden" },
                    { display: "部门名称", name: "unit_name", type: "text", newline: true, group: "基础信息", groupicon: groupicon, isSort:true },
                    { display: "上级部门 ", name: "id", type: "text", newline: false, comboboxName: "unit_name", options: { valueFieldID: "id" } },
                    {
                        display: "部门类型 ", name: "unit_type", newline: true, type: "select", comboboxName: "text", options: { valueFieldID: "id" },
                        data: [
                            {
                                id: 0,
                                text:"分类一"
                            }, {
                                id: 1,
                                text: "分类er"
                            }
                        ]
                    },
                    //{ display: "折扣", name: "QuantityPerUnit", newline: false, type: "number" },
                    //{ display: "单价", name: "UnitPrice", newline: true, type: "number" },
                    //{ display: "库存量", name: "UnitsInStock", newline: true, type: "digits", group: "库存", groupicon: groupicon },
                    //{ display: "订购量", name: "UnitsOnOrder", newline: false, type: "digits" },
                    { display: "备注", name: "Remark", newline: true, type: "text" }
                ]
            });

            //$("#test1").ligerComboBox({
            //    width : 200,
            //    data: [
            //        { text: '北京', id: 'bj' },
            //        { text: '天津', id: 'tj' },
            //        { text: '厦门', id: '44' },
            //        { text: '广州', id: 'gz' },
            //        { text: '深圳', id: 'sz' },
            //        { text: '上海', id: 'ss' }
            //    ], valueFieldID: 'test3',
            //    autocomplete: true,
            //    rowClsRender : function(row){
            //        if (row.id == "bj")
            //        {
            //            return "beijing";
            //        }
            //    },

            $("#pageloading").hide();
        });

        function deleteRow()
        {
            g.deleteSelectedRow();

        }

        function AddUser()
        {
            //myfunc();
            $.ligerDialog.open({
                target: $("#target1"), width: 640, title: "新增部门",
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { f_save(); dialog.hidden(); } },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });

        }

        function f_save() {
            var returnStr = GetDataByAjax("../myHandler.ashx", "AddUnit", "", "", JSON.stringify(f.getData()));

            if (returnStr.result) {
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
            //console.log(returnStr);

        }
        function f_close() {
            //$.ligerDialog.close()
        };
        function getCountryData()
        {
            return [
          { unit_type: '宣传部', unit_typeid: '0' },
          { unit_type: '组织部', unit_typeid: '1' }
            ];
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
     <div id="target1" style="width:99%; margin:3px; display:none;">
         <div id="form2"></div>
         <%--<div id="form_unit" class="liger-form">
          <div class="fields">
              <input data-type="text" data-label="部门名称" data-name="unit_name" />
              <div data-type="select" data-label="上级部门" data-name="pid_name" data-newline="false" >
                    <input class="editor"  data-data="getCountryData()" data-onSelected="f_onCountryChanged" data-textField="unit_type" data-valueField="unit_typeid"/> 
              </div>
              <div data-type="select" data-label="部门类型" data-name="unit_type">
                  <input class="editor"  data-data="getCountryData()" data-onSelected="f_onCountryChanged" data-textField="unit_type" data-valueField="unit_typeid"/> 
              </div>
             <input data-type="text" data-label="备注" data-name="remark" data-newline="false"/>
         </div>  --%>
     </div>
     </div> 
</body>
</html>

<%--<div class="l-form-container"><ul><li class="l-fieldcontainer l-fieldcontainer-first" fieldindex="0"><ul><li style="width:90px;text-align:left;">标题：</li>
    <li id="form1|0" style="width:180px;text-align:left;">
        <div class="l-text" style="width: 178px;"><input type="text" id="1477202896346_1_Title" name="Title" class="l-text-field" ligeruiid="Title" style="width: 174px;"><div class="l-text-l"></div><div class="l-text-r"></div></div></li><li style="width:40px;"></li></ul></li></ul>
    <ul><li class="l-fieldcontainer l-fieldcontainer-first" fieldindex="1">
            <ul><li style="width:90px;text-align:left;">入职日期：</li><li id="form1|1" style="width:180px;text-align:left;">
                <div class="l-text-wrapper" style="width: 178px;"><div class="l-text l-text-date" style="width: 178px;">
                    <input type="text" id="1477202896350_1_addDate" name="addDate" class="l-text-field" ligeruiid="addDate" style="width: 158px;">
                    <div class="l-text-l"></div><div class="l-text-r"></div><div class="l-trigger"><div class="l-trigger-icon"></div></div>
                    <div class="l-trigger l-trigger-cancel" style="display: none;"><div class="l-trigger-icon"></div></div></div></div></li>
                <li style="width:40px;"></li></ul></li></ul><ul><li class="l-fieldcontainer l-fieldcontainer-first" fieldindex="2">
                    <ul><li style="width:90px;text-align:left;">国家：</li><li id="form1|2" style="width:180px;text-align:left;">
                        <div class="l-text-wrapper"><div class="l-text l-text-combobox l-text-focus" style="width: 178px;">
                            <input type="text" id="1477202896377_1_Country" name="CountryName" readonly="" data-comboboxid="Country" class="l-text-field" ligeruiid="Country" style="width: 158px;"><div class="l-text-l"></div><div class="l-text-r"></div><div class="l-trigger"><div class="l-trigger-icon"></div></div><div class="l-trigger l-trigger-cancel" style="display: none;"><div class="l-trigger-icon"></div></div></div><input type="hidden" name="Country" id="Country" data-ligerid="Country" value="ZG"></div></li><li style="width:40px;"></li></ul></li></ul><div class="l-clear"></div></div></div> 
 <div class="liger-button l-button" data-click="f_setData" data-width="150" ligeruiid="Button1000" style="width: 150px;">设置数据<div class="l-button-l"></div><div class="l-button-r"></div><span>设置数据</span></div>
   <div class="liger-button l-button" data-click="f_getData" data-width="150" ligeruiid="Button1001" style="width: 150px;">获取数据<div class="l-button-l"></div><div class="l-button-r"></div><span>获取数据</span></div>--%>
