<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleIndex.aspx.cs" Inherits="WebPages.SystemManage.RoleIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
    <meta name="robots" content="none" />
    <title>角色列表</title>
    <link href="../resources/ligerUI/skins/Gray/css/ligerui-all.css" rel="stylesheet" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../assets/lib/ligerUI/js/ligerui.all.js"></script>
    <script src="../assets/js/Util.js" type="text/javascript"></script>
    <link href="../resources/css/myform.css" rel="stylesheet" />
    <script type="text/javascript">
        var g;
        var grid_data=GetDataByAjax("../NB_JsonHttp.aspx","GETROLES",null);
        var f;
        var t;
        //var grid_data = [Rows:{ name: "管理员", status: 1, id: 1 }, { name: "系统测试员", status: 1, id: 2 }];
        $(function(){
            window['g'] = $("#maingrid").ligerGrid({
                height: '99%',
                columns: [
                    { display: '角色编号', name: 'id', align: 'left',width :80, },
                    { display: '角色名', name: 'name' ,width :150,},
                    //{ display: '状态', name: 'status' }
                ],
                data: grid_data.data,
                pageSize: 30,
                rownumbers: true,
                toolbar:     { items:  <%= buttonJson %>    }
            });
            
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
            //对表单初始化
            window['f']=$('#myform').ligerForm();
            if(state==1)//新增
            {
                //初始化表格
                var dataNull={name:' ',status: 1, id: 0};
                f.setData(dataNull);
                var JSONdata = GetDataByAjax('../NB_JsonHttp.aspx', "getAllMenus");
                //菜单树加载
                window['t'] = $("#authTree").ligerTree({
                    data: JSONdata.data,
                    checkbox: true,
                    idFieldName: 'id',
                    isExpand:2,
                    parentIDFieldName: 'parentId',
                    textFieldName: 'name',
                    onCheck:onCheck,
                });
                //打开对话框
                $.ligerDialog.open({
                    target: $("#mytarget"), width: 450, title: "新增",
                    buttons: [
                        { text: '确定', onclick: function (item, dialog) { f_save(dialog);  } },
                        { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                    ]
                });
            }
            else if(state==2)//编辑
            {
                var node = g.getSelectedRow();//menuTree.getSelected();
                if(node){
                    //初始化表格
                    var data= GetDataByAjax("../NB_JsonHttp.aspx", "getRoleMenuByRoleId", node.id).data;
                    //角色实体
                    var Roledata =data.Role;
                    f.setData(Roledata);
                    //设置角色权限数据
                    var Authdata=data.Auth;
                    var menudata = GetDataByAjax('../NB_JsonHttp.aspx', "getAllMenus").data;
                    var treejson="[";
                    $.each(menudata,function(n,value){
                        //var menu=this;
                        //treejson+='{"id":'+menu.id+',"pid":'+menu.parentId+',"text":"'+menu.name+'",';
                        $.each(Authdata,function(x,xvalue){
                            if(value.id==xvalue.id)
                                //treejson+='"ischecked":true,';
                                value.ischecked=true;
                        });

                        //treejson+='},';
                    });
                   // treejson+="]";
                    //var treedata= JSON.parse(treejson);
                    //菜单树加载
                    window['t'] = $("#authTree").ligerTree({
                        data:menudata, 
                        checkbox: true,
                        dFieldName: 'id',
                        textFieldName: 'name',
                        isExpand: 2,
                        parentIDFieldName :'parentId',
                        onCheck:onCheck
                    });

                    //打开对话框
                    $.ligerDialog.open({
                        target: $("#mytarget"), width: 450, title: "编辑",
                        buttons: [
                            { text: '确定', onclick: function (item, dialog) { f_save(dialog); } },
                            { text: '取消', onclick: function (item, dialog) { dialog.hidden(); } }
                        ]
                    });
                }else{
                    myTips("请选择节点！");
                }
            }
        }
        //保存按钮操作
        function f_save(dialog) {
            var postData=f.getData();
            if (!postData.id) {
                postData.id=0;
            }
            var returnStr = GetDataByAjax("../NB_JsonHttp.aspx", "addRole",$("#auth").val(), "", JSON.stringify(postData));
            if (returnStr.result) {
                myTips("操作成功！");
                window.location.reload();
                dialog.hidden();
            }
            else{
                myTips("操作失败！");
            }
        }
        //删除
        function deleteRow(){
            var node = g.getSelectedRow();
            if (node){
                //myTips("点击删除"+node.data.id);
                var returnStr= GetDataByAjax("../NB_JsonHttp.aspx","DELETEROLE",node.id,"","");
                if(returnStr.result)
                {
                    g.deleteSelectedRow();
                    myTips("删除成功！");
                }else{
                    myTips("删除失败，请联系管理员！");
                }
            }
            else
                myTips("请选择节点！");
        }
        //点击菜单树对应的操作
        function onCheck(note, checked){
            var nodes=t.getChecked();
            var v="";
            for(var i=0;i<nodes.length;i++){
                v+=nodes[i].data.id + ",";
            }
            $("#auth").val(v);
        }
    </script>
</head>
<body style="overflow-x: hidden; padding: 2px;">
    <div id="maingrid"></div>

    <div id="mytarget" style="width: 99%; margin: 3px; display: none;">
        <div id="myform">
            <table class="op_tb">
                <caption style="text-align: center;">
                    <input type="hidden" name="id" />
                </caption>
                <tbody>
                    <tr>
                        <td class="label">角色名：</td>
                        <td>
                            <input type="text" id="name" name="name" />
                        </td>
                        <%--<td class="label">状态：</td>
                        <td>
                            <input type="text" id="status" name="status" />
                        </td>--%>
                    </tr>
                    <tr>
	                    <td class="label" colspan="1">
	                     	用户权限
	                    </td>
	                    <td colspan="3">
	                    	<div style="height:300px;overflow: scroll;">
								<div id="authTree" ></div>
							</div>
							<input type="hidden" name="auth" id="auth" value="<%= aList%>">
	                    </td>
	                </tr>
                </tbody>
            </table>
        </div>
        

        </div>
    </div>
</body>
</html>
