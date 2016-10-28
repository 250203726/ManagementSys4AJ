<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuIndex.aspx.cs" Inherits="WebPages.SystemManage.MenuIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        #unit_duty, #unit_figure {
            height: 200px;
            /*border:none;*/
        }

            #unit_duty:hover, #unit_figure:hover {
                border: 1px solid #D0D0D0;
                /*border:none;*/
            }

        input[name=pid_name], input[name=unit_type] {
            display: none;
        }
    </style>


    <script type="text/javascript">
        var menuTree = null;
        var menuBar=null;
        $(document).ready(function () {
            //初始化tree
            var data = [];
            var JSONdata = GetDataByAjax('../myHandler.ashx', "getAllMenus");
            menuTree = $("#menuTree").ligerTree({
                data: JSONdata,
                isExpand: 2,
                nodeWidth: 300,
                checkbox: false,
                single: true,
                slide: true,
                idFieldName: 'id',
                parentIDFieldName: 'parentId',
                textFieldName: 'name',
            });
            menuBar = $("#menuBar").ligerToolBar({
                items: <%= buttonJson %>
            });
        });
    var state;//记录是增加还是修改


    //重新按钮
    function refresh() {
        window.location.reload();
    }

    //添加
    function AddItem()
    {
        state=1;
        var node = menuTree.getSelected();
        if(node){
            openDialog("菜单","MenuEdit.aspx?parentId="+node.data.id);
        }else{
            parent.Public.tips({type: 2, content : "请选择节点！"});
        }
    }
    //修改
    function EditItem()
    {
        state=2;
        var node = menuTree.getSelected();
        if(node){
            openDialog("菜单","MenuEdit.aspx?id="+node.data.id);
        }else{
            parent.Public.tips({type: 2, content : "请选择节点！"});
        }
    }
    //删除
    function deleteRow()
    {
        var node = menuTree.getSelected();
        if (node){
            GetDataByAjaxSync('../myHandler.ashx', "DeleteMenu",node.data.id,'','',function(data){
                data=eval(data);
                if(data.state){
                    menuTree.remove(node.target);
                    parent.Public.tips({type: 0, content : data.message});
                }else{
                    parent.Public.tips({type: 1, content : data.message});
                }
            });
        }
        else
            parent.Public.tips({type: 2, content : "请选择节点！"});
    }

    function InitForm(data)
    {
        if (data == null) {
            data = {
                id: "0000",
                unit_name: "",
                unit_fullname: "",
                pid: "",
                unit_type: "",
                unit_duty: "",
                unit_figure: "",
                remark: "",
            };
        } else {
            //f.set("readonly", true);
        }
        f.setData(data);
    }

    /**
     * 菜单编辑框
     */
    function openDialog(title,url){
        $.ligerDialog.open({ title: title, name:'menuSelector',width: 800,height:400,isResize:true,timeParmName:'tmp', url: url, buttons: [
             { text: '确定', onclick: OK },
             { text: '取消', onclick: Cancel }
        ]});
        return false;
    }

    function OK(item, dialog)
    {
        var fn = dialog.frame.f_save || dialog.frame.window.f_save; 
        var data = fn(); 
        if (null!=data)
        {
            data=eval(data);
            if(data.state){
                parent.Public.tips({type: 0, content : data.message});
                if(state==1){//增加
                    parent.Public.ajaxPost("${path}/menu/detail?id="+data.param,"",function(obj){
                        var node = menuTree.getSelected();
                        var nodes = [];
                        nodes.push(obj);
                        if (node)
                            menuTree.append(node.target, nodes); 
                    });
                }else if(state==2){//更新
                    parent.Public.ajaxPost("${path}/menu/detail?id="+data.param,"",function(obj){
                        var node = menuTree.getSelected();
                        if (node)
                            menuTree.update(node.target, obj);
                    });
                }else{}
            }else{
                parent.Public.tips({type: 1, content : data.message});
            }
            dialog.close();
            return;
        }
    }
        
    function Cancel(item, dialog)
    {
        dialog.close();
    }

    </script>
</head>
<body>


    <div id="menuBar"></div>
    <div id="menuTree"></div>

    <div id="mytarget" style="width: 99%; margin: 3px; display: none;">
        <div id="myform"></div>
    </div>

</body>
</html>
