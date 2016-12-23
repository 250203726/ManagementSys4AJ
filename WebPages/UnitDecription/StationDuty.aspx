<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StationDuty.aspx.cs" Inherits="WebPages.UnitDecription.StationDuty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
        <link href="../resources/css/myform.css" rel="stylesheet" />
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
        $(function ()
        {   
            window["g"] =
            $("#maingrid").ligerGrid({
                height: '99%',
                checkbox:false,
                columns: [
                    { display: '名称', name: 'title', align: 'left' ,render:g_render4title},
                    { display: '对应岗位', name: 'art_type' ,render:g_render4type},
                    { display: '最后编辑时间', name: 'create_date',render:g_render4time },
                     { display: '操作', width: 120,render:g_render4handlebar }
                ],
                url:"../NB_JsonHttp.aspx?oprtype=GetStationDuty4Grid",
                pageSize: 30,
                rownumbers: true,
                toolbar:     {
                    items: 
                    <%= buttonJson %>   
                },
            });           

            $("#pageloading").hide();
        });

        //新增岗位
        function AddItem()
        {
            window.top.f_addTab("Add_StationDudy", "新增岗位职责", "../UnitDecription/UnitFigure.aspx?type=station_duty");
        }

        //编辑岗位
        function EditItem()
        {
            var rows = g.getSelectedRows();
            if (rows.length != 1) {
                myTips("请选择一条数据进行编辑！");
                return;
            }
            window.top.f_addTab("Eidt_StationDudy", "编辑岗位职责", "../UnitDecription/UnitFigure.aspx?type=station_duty&oid="+rows[0].id);
        }
         //
        function g_render4title(rowdata, index, colvalue) {
            return '<a name="title" href="javascript:void(0)" rel='+rowdata.id+'>'+colvalue+'</a>';
        }

        function g_render4type(rowdata, index, colvalue) {
            if (colvalue.indexOf("_")>0) {
                return colvalue.substr(0,colvalue.indexOf("_"))
            }else {
                return colvalue;
            }           
        }

        $(document).on("click","table.l-grid-body-table a[name=title]",function(e){
            var article_id=$(this).attr("rel");
            window.top.f_addTab("View_StationDudy_"+article_id, "编辑岗位职责", "../UnitDecription/UnitFigure.aspx?type=station_duty&oid="+article_id);
        });
  </script>
</head>
<body>
    <div class="l-loading" style="display:block" id="pageloading"></div>
 <div class="l-clear"></div>
    <div id="maingrid"></div>
  <div style="display:none;">
</div>
</body>
</html>
