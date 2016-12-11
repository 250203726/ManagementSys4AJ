<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveNetworkMap.aspx.cs" Inherits="WebPages.UnitManage.SaveNetworkMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <link href="../resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/jquery-1.11.1.min.js"></script>
    <%--<script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>--%>
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        var selected_node;
        $(function () {
            window["t"] = $("#tree1").ligerTree({
                url: "../NB_JsonHttp.aspx?oprtype=GetUnits4NetMap",
                idFieldName: 'node_guid',
                textFieldName: 'name',
                parentIDFieldName: 'parentguid',
                checkbox: false,
                nodeWidth: 200,
                render: t_render,
                isExpand:5,
                onContextmenu: function (node, e) {
                    //console.log(e.target);
                    if (e.target.nodeName.toLocaleUpperCase()!= "SPAN") {
                        myTips("请在节点上点击右键，进行操作！");
                        menu.hide();
                        return false;
                    }
                    selected_node = node;
                    menu.show({ top: e.pageY, left: e.pageX });
                    return false;
                }

            });

            $("#toptoolbar").ligerToolBar({
                items: [
                        {
                            text: '全部展开', click: tb_itemclick
                        },
                        { line: true },
                        { text: '全部折叠', click: tb_itemclick },
                        { line: true },
                        { text: '预览网络图', click: tb_itemclick },
                       
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
                     { display: "父级节点", name: "parentname", type: "text", labelAlign: "right", newline: false },
                     {
                         display: "责任人名称", name: "auditor", type: "text", labelAlign: "right",
                         validate: { required: true }
                     },
                     { display: "兼职岗位", name: "station_name", type: "text", newline: false, labelAlign: "right" },

                    { type: "hidden", name: "parentguid", value: "" },
                      { display: "排序", name: "sort_order", type: "digits", labelAlign: "right", value: "0", newline: false },
                       { display: "层级", name: "hierarchy", type: "digits", labelAlign: "right", newline: false },
                ]
            });
            window["menu"] = $.ligerMenu({
                top: 100, left: 100, width: 140, items:
                [
              { text: '新增下一级节点', click: itemclick, icon: 'add' },
              { line: true },
                { text: '修改', click: itemclick, icon: 'edit' },

                { text: '查看', click: itemclick, icon: "view" },
                { text: '删除', click: itemclick, icon: "delete" },
                ]
            });

            //
            //$("#toptoolbar").css("height", "31px");
          
        });

        function itemclick(btn) {
            if (!selected_node) {
                myTips("请先选择一个节点");
                return;
            }
            if (btn.text == "新增下一级节点") {
                f.setData({
                    "node_guid": "00000000-0000-0000-0000-000000000000",
                    "auditor": "",
                    "name": "",
                    "parentname": selected_node.data.name,
                    "station_name": "",
                    "parentguid": selected_node.data.node_guid,
                    "sort_order": "0"
                });
                console.log(selected_node.data.node_guid);
                f.setEnabled(["parentname"], false);
            } else if (btn.text == "修改") {
                var guid = selected_node.data.node_guid;
                var parent_node = t.getParent(selected_node);
                if (parent_node == null) {
                    return;
                }
                var parent_name = parent_node.name;
                var Rtn = GetDataByAjax('../NB_JsonHttp.aspx', "GetNetMapNode", guid);
                Rtn.data.parentname = parent_name;
                f.setData(Rtn.data);
                f.setEnabled(["parentname"], false);
            } else if (btn.text == "删除") {
                var guid = selected_node.data.node_guid;
                var Rtn = GetDataByAjax('../NB_JsonHttp.aspx', "DeleteMapNode", guid);
                myTips(Rtn.msg);
                t.reload();
                return;
            }
            //2.弹出对话框
            $.ligerDialog.open({
                target: $("#mytarget"), width: 600, title: btn.text + "节点",
                buttons: [
                    { text: '确定', onclick: function (item, dialog) { f_save(); dialog.hidden(); } },
                    { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                ]
            });
        }
        function f_save() {
            //TODO:必填校验
            var user_post = f.getData();
            //var newnodedata = selected_node.data;
            //newnodedata.treedataindex = 0;
            //newnodedata.auditor = user_post.auditor;
            //newnodedata.name = user_post.name;
            //newnodedata.node_guid = user_post.node_guid;
            //newnodedata.parentguid = user_post.parentguid;
            //newnodedata.sort_order = user_post.sort_order;
            //newnodedata.station_name = user_post.station_name;
            //newnodedata.remark = "";


            var ret = GetDataByAjax("../NB_JsonHttp.aspx", "SaveNode", "", "", JSON.stringify(user_post));
            if (ret.result) {
                myTips(ret.msg);
                //if (user_post.node_guid == "00000000-0000-0000-0000-000000000000") {
                //    t.append(t.getParent(selected_node), user_post);
                //} else {
                //    t.update(selected_node, newnodedata);
                //}
                t.reload();
            } else { }
        }
        function t_render(data, item) {
            var auditor = data.auditor || "";
            var station_name = data.station_name || "负责人";
            return auditor != "" ? item + "(" + station_name + "：" + auditor + ")" : item;
        }
        function tb_itemclick(btn) {
            if (btn.text == "全部展开") {
                t.expandAll();
            } else if (btn.text == "全部折叠") {
                t.collapseAll();
            } else if (btn.text == "预览网络图") {
                window.top.f_addTab("NetworkMap", "预览公司网络安全图", "../UnitManage/NetworkMap_New.aspx");
            }
        }
    </script>
    <style type="text/css">
         
    </style>
</head>
<body style=""overflow-x: hidden; padding: 5px; margin: 0;">
      <div id="toptoolbar"></div> 
       <ul id="tree1" ></ul>
    <div id="mytarget" style="width: 100%; display: none">
            <div id="myform"></div>
        </div>
</body>
</html>
