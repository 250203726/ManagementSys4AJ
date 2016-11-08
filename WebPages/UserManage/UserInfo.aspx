<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="WebPages.UserManage.changePwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人资料</title>
      <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var groupicon = "../assets/lib/ligerUI/skins/icons/communication.gif";
            var user_info = GetDataByAjax("../NB_JsonHttp.aspx", "GETUSERINFO","","",null);
            window['f'] = $("#myform").ligerForm({
                inputWidth: 190, labelWidth: 100, space: 90,
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
                     { display: "邮箱", name: "email", type: "text", labelAlign: "right" },
                      { display: "电话", name: "phone", type: "digits", labelAlign: "right", newline: false },
                     {
                         display: "用户类型", name: "type_id", type: "select", labelAlign: "right", comboboxName: "type_id",newline: true, options: {
                             valueFieldID: "text",
                             data: [
                                 {
                                     id: "0",
                                     text: "普通用户"
                                 }, {
                                     id: "1",
                                     text: "超级管理员"
                                 }
                             ]
                         }
                     },
                    { display: "备注", name: "info", type: "textarea", labelAlign: "right",width:570 },
                ],
                buttons: [
                    { text: '保存', click: submitform, width: 60, align: "center"},
                    { text: '重置', click: resetfrom, width: 60, align: "center" }
                ],
            });

            f.setEnabled(["account", "type_id"], false);
            f.setData(user_info.data);

            $("#pageloading").hide();
        });

        //点击保存按钮方法 add by wonder4 2016年10月31日22:57:22
        function submitform() {
            var user = f.getData();
            var ret = GetDataByAjax("../NB_JsonHttp.aspx", "UpdateUser", "", "", JSON.stringify(user));
            if (ret.result) {
                myTips(ret.msg);
            } else { }
        }
        function resetfrom()
        {
            f.setData({ nickname: "", email: "", phone: "", type_id: '0', info: "", });
            //f.setData({ account: "", nickname: "", email: "", phone: "", type_id: '0', info: "", });

        }
    </script>
    <style type="text/css">
        body {
        font-size:14px;
        }
    </style>
</head>
<body style="overflow-x:hidden; padding:2px;">
<div class="l-loading" style="display:block" id="pageloading"></div>
 <a class="l-button" style="width:120px;float:left; margin-left:10px; display:none;" onclick="deleteRow()">删除选择的行</a>
 <div class="l-clear"></div>
    <div id="maingrid"></div>
  <div style="display:none;">
</div>
     <div id="mytarget" style="width:99%; margin:15px;padding:30px;padding-top:15px;">
         <div id="myform"></div>
     </div> 
</body>
</html>
