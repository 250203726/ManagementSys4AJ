<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnitFigure.aspx.cs" Inherits="WebPages.UnitDecription.UnitFigure" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>形象及宗旨</title>
    <link href="../../Components/NBersEditor/themes/default/default.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../Components/NBersEditor/plugins/code/prettify.css" />
    <script src="../../../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 
    <script charset="utf-8" src="../../Components/NBersEditor/kindeditor.js"></script>
    <script charset="utf-8" src="../../Components/NBersEditor/lang/zh_CN.js"></script>
    <script charset="utf-8" src="../../Components/NBersEditor/plugins/code/prettify.js"></script>

    <link href="../../../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../../../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="../../../assets/lib/ligerUI/js/ligerui.all.js"></script>
    
    <script src="../../../assets/js/Util.js"></script>
    <script type="text/javascript">
        var KE;
        var page_data=<%= PageData%>;
        var page_init;
        $(function () {
            KindEditor.ready(function (K) {
                KE = K.create('#kinde_content', {
                    cssPath: '../../Components/NBersEditor/plugins/code/prettify.css',
                    uploadJson: '../../Components/NBersEditor/KindeHandler.ashx?oprtype=upload',
                    fileManagerJson: '../../Components/NBersEditor/KindeHandler.ashx?oprtype=manger',
                    allowFileManager: true,                    
                    afterCreate: function () {
                    }
                });
                prettyPrint();
                //保证编辑器渲染完成
                initPage();
            });

            $(document).on("click", "input[name=btn_submit]", function () {
                var post_data = {};
                post_data.id=page_init.id.val();
                post_data.title = page_init.title.val();
                post_data.art_type = $("select[name=art_type] option:selected").val();
                post_data.content = KE.html();

                if (post_data.title=="") {
                    myTips("标题不允许为空！");
                    return;
                }
                if (post_data.art_type=="-1" && page_data.station) {
                    myTips("请选择所属岗位！");
                    return;
                }
                if (post_data.content=="") {
                    myTips("内容不能为空！");
                    return;
                }
                if (page_data.station) {
                    post_data.art_type=post_data.art_type+"_岗位职责"
                }else {
                    post_data.art_type=post_data.title;
                }
               

                var Rtn = GetDataByAjax("../../../NB_JsonHttp.aspx", "SAVEARTICLE", "", "", JSON.stringify(post_data));
                if (Rtn.result) {
                    myTips("保存成功");
                    //setTimeout(window.top.tab.removeTabItem("Save_WorkSummary"),3000);
                }
            });

            page_init={
                id:$("input[name=id]"),
                title:$("input[name=title]"),
                art_type:$("input[name=art_type]"),
                sel_station:$("select[name=art_type]"),
                content:KE,
            };

            //初始化岗位下拉列表
            if (page_init.sel_station && page_data.station) {
                $.each(page_data.station,function(n,item){
                    page_init.sel_station.append($('<option value="'+item.unit_name+'">'+item.unit_name+'</option>'));
                });
            }else {
                $("tr[name=tr_station]").hide();
            }

            window["f"]=$("#art_form").ligerForm();
        })
        //初始化页面
        function initPage() {
            if (typeof(page_data)=="object" && page_data.article) {
                page_init.title.val(page_data.article.title);
                var station_name=page_data.article.art_type && (page_data.article.art_type.indexOf("_")>0)? page_data.article.art_type.substr(0,page_data.article.art_type.indexOf("_")):page_data.article.art_type;

                f.setData({
                    "id":''+page_data.article.id,
                    "art_type":station_name,
                });
                page_init.title.attr("readonly","readonly");
                KE.html(page_data.article.content);
            }
        }
    </script>
    <style>
        .mytab {
        width:98%;
        border: 1px solid #eee;
        }
        .mytab  tr {
            clear: both;
            display: block;
            padding: 5px 0;
            line-height: 30px;
        }
            .mytab  tr td:first-child {
                display: block;
                float: left;
                width: 130px;
                text-align: right;
                color: #6d7e86;
            }
            .mytab  tr td:nth-child(2) {
                position: relative;
                margin-left: 150px;
                margin: 0;
                padding: 0;
                border: 0;
                font-size: 100%;
                text-decoration: none;
                padding-left:15px;
            }
         .myinput {
            padding: 5px 4px;
            min-height: 32px;
            line-height: 20px;
            border: 1px solid #eee;
            background: #fff;
            vertical-align: middle;
            color: #333;
            font-size: 100%;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            width: 300px;
        }
        .btn {
            background: #16a0d3;
            border: none;
            color: #fff;
            cursor: pointer;
            display: inline-block;
            font-family: "Microsoft Yahei";
            font-size: 12px;
            height: 32px;
            line-height: 32px;
            margin: 0 1px 0 0;
            padding: 0 20px;
        }
        .div_btn input {
        margin-left:80px;
        margin-top:15px;
        }
        .l-text-wrapper input {
        padding-left:15px;
        }

    </style>
</head>

<body>
    <div id="art_form">
        <input type="hidden" name="id" value="0"/>
        <input type="hidden" name="art_type_1" value="0"/>
        <table class="mytab">
            <tr>
                <td><label for="title">内容标题</label></td>
                <td><input type="text" name="title" value=""  class="myinput"/></td>
            </tr>
            <tr name="tr_station">
                <td><label for="title">所属岗位</label></td>
                <td>
                    <select name="art_type">
                        <option value="-1" selected="selected">请选择</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="kinde_content">内容描述</label></td>
                <td>
                    <textarea name="kinde_content" id="kinde_content" cols="100" rows="8" style="width:930px;height:450px;visibility:hidden;"></textarea>
                </td>
            </tr>
        </table>
        <div class="div_btn">
            <input class="btn" type="button" name="btn_submit" value="提交保存" />
        </div>
    </div>
</body>
</html>
