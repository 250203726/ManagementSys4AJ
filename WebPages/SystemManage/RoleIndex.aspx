<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleIndex.aspx.cs" Inherits="WebPages.SystemManage.RoleIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
    <meta name="robots" content="none" />
    <title>角色列表</title>
    <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <script type="text/javascript">
        var g;
        var grid_data = GetDataByAjax("../NB_JsonHttp.aspx", "GetUsers", null);
        //var grid_data = [Rows:{ name: "管理员", status: 1, id: 1 }, { name: "系统测试员", status: 1, id: 2 }];
        $(function(){
            window['g'] = $("#maingrid").ligerGrid({
                height: '99%',
                columns: [
                    { display: '角色编号', name: 'account', align: 'left' },
                    { display: '角色名', name: 'nickname' }
                ],
                data: grid_data.data,//添加传输的json
                pageSize: 30,
                rownumbers: true,
               // toolbar:     { items:  <%= buttonJson %>    },
                });
        });


    </script>
</head>
<body style="overflow-x: hidden; padding: 2px;">
    <div id="maingrid"></div>
</body>
</html>
