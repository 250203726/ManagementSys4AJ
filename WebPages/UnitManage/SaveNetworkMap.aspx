<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveNetworkMap.aspx.cs" Inherits="WebPages.UnitManage.SaveNetworkMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />

    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../assets/js/placeholder.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script type="text/javascript">
        $(function () {
            window["t"] = $("#tree1").ligerTree({
                url: "../NB_JsonHttp.aspx?oprtype=GetUnits4NetMap",
                idFieldName: 'node_guid',
                textFieldName: 'name',
                parentIDFieldName: 'parentguid',
                checkbox: false,
                nodeWidth:200,
                render:t_render
            });

            $("#toptoolbar").ligerToolBar({
                items: [
                        {
                            text: '增加', click: itemclick, icon: 'add'
                        },
                        { line: true },
                        { text: '修改', click: itemclick },
                        { line: true },
                        { text: '删除', click: itemclick }
                ]
            });

            window['f'] = $("#myform").ligerForm({
                inputWidth: 160, labelWidth: 80, space: 40,
                fields: [
                     { type: "hidden", name: "node_guid", value: "" },
                     {
                         display: "节点名称", name: "name", type: "text", labelAlign: "right",
                         validate: { required: true }
                     },
                     {
                         display: "责任人名称", name: "auditor", type: "text", labelAlign: "right", newline: false,
                         validate: { required: true }
                     },
                     { display: "父级节点", name: "parentname", type: "text", labelAlign: "right" },
                    { type: "hidden", name: "parentguid", value: "" },
                      { display: "排序", name: "sort_order", type: "digits", labelAlign: "right", value:"0",newline: false },
                ]
            });

        });
       
        function itemclick(btn) {
            var selected_node = t.getSelected();
            if (!selected_node) {
                myTips("请先选择一个节点");
                return;
            }
            if (btn.text=="增加") {                
                f.setData({
                    "node_guid": "00000000-0000-0000-0000-000000000000",
                    "auditor":"",
                    "name": "", "parentname": selected_node.data.name,
                    "parentguid": selected_node.data.node_guid,
                    "sort_order":"0"
                });
                f.setEnabled(["parentname"], false);
            } else if (btn.text == "修改") {
                var guid = selected_node.data.node_guid;
                var parent_name=t.getParent(selected_node).name;
                var Rtn = GetDataByAjax('../NB_JsonHttp.aspx', "GetNetMapNode", guid);
                Rtn.data.parentname = parent_name
                f.setData(Rtn.data);
                f.setEnabled(["parentname"], false);
            }
            //2.弹出对话框
            $.ligerDialog.open({
                target: $("#mytarget"), width: 600, title: "节点处理",
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { f_save(); dialog.hidden(); } },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });
        }
        function f_save() {
            //TODO:必填校验
            var user_post = f.getData();
            var ret = GetDataByAjax("../NB_JsonHttp.aspx", "SaveNode", "", "", JSON.stringify(user_post));
            if (ret.result) {
                myTips(ret.msg);
                t.reload();
            } else { }
        }
        function t_render(data,item) {
            var auditor = data.auditor || "";
            
            return auditor != "" ? item + "(负责人：" + auditor + ")" : item;
        }
    </script>
</head>
<body style=""overflow-x: hidden; padding: 5px; margin: 0;">
      <div id="toptoolbar"></div> 
   <ul id="tree1"></ul>
    <div id="mytarget" style="width: 100%; display: none">
            <div id="myform"></div>
        </div>
</body>
</html>
