<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userindex.aspx.cs" Inherits="WebPages.UserManage.Userindex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        function itemclick(item)
        {
            alert(item.text);
        }
        var CustomersData;
        $(function ()
        {            
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
                url: "../myHandler.ashx?oprtype=getusers",
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
             

            $("#pageloading").hide();
        });

        function deleteRow()
        {
            g.deleteSelectedRow();
        }

        function AddUser()
        {
            myfunc();
            $.ligerDialog.open({ target: $("#target1"),width:900,title:"新增用户", });
        }

    </script>

    <script type="text/javascript"> 
        var groupicon = "../assets/lib/ligerUI/skins/icons/communication.gif";
        var myfunc = function () {
            //创建表单结构 
            $("#form2").ligerForm({
                inputWidth: 170, labelWidth: 90, space: 40,
                fields: [
                { name: "ProductID", type: "hidden" },
                { display: "产品名称", name: "ProductName", newline: true, type: "text", group: "基础信息", groupicon: groupicon },
                {
                    display: "顾客", name: "CustomerID", textField: "CustomerName",
                    newline: false, type: "combobox", editor: {
                        selectBoxWidth: 600,
                        selectBoxHeight: 300,
                        textField: 'CustomerID',
                        valeuField: 'CustomerID',
                        condition: {
                            prefixID: 'condition_',
                            fields: [
                            {
                                label: '顾客', name: 'CustomerID', type: 'combobox', editor: {
                                    selectBoxWidth: 600,
                                    selectBoxHeight: 300,
                                    textField: 'CustomerID',
                                    valeuField: 'CustomerID',
                                    data: CustomersData
                                }
                            }
                            ]
                        },
                        grid: {
                            columns: [
                            { display: '主键', name: 'CustomerID', align: 'left', width: 140, minWidth: 33 },
                            { display: '公司名', name: 'CompanyName', minWidth: 120 },
                            { display: '联系名', name: 'ContactName', minWidth: 140 },
                            { display: '城市', name: 'City' }
                            ], data: CustomersData, isScroll: false, sortName: 'CustomerID',
                            width: 680
                        }
                    }
                },
                { display: "类别 ", name: "CategoryID", newline: true, type: "select", comboboxName: "CategoryName", options: { valueFieldID: "CategoryID" }, width: 240 },
                { display: "日期 ", name: "AddTime", newline: true, type: "date" },
                { display: "折扣", name: "QuantityPerUnit", newline: false, type: "number" },
                { display: "单价", name: "UnitPrice", newline: true, type: "number" },
                { display: "库存量", name: "UnitsInStock", newline: true, type: "digits", group: "库存", groupicon: groupicon },
                { display: "订购量", name: "UnitsOnOrder", newline: false, type: "digits" },
                { display: "备注", name: "Remark", newline: true, type: "text", width: 470 }
                ]
            });
        };
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
     </div> 

    
</body>
</html>
