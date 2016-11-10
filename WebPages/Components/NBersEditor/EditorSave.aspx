<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditorSave.aspx.cs" Inherits="WebPages.Components.NBersEditor.EditorSave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>富文本编辑器</title>
	<meta charset="utf-8" />
    <link rel="stylesheet" href="themes/default/default.css" />
    <link rel="stylesheet" href="plugins/code/prettify.css" />
    <script src="../../assets/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 
    <script charset="utf-8" src="kindeditor.js"></script>
    <script charset="utf-8" src="lang/zh_CN.js"></script>
    <script charset="utf-8" src="plugins/code/prettify.js"></script>

    <link href="../../assets/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/lib/ligerUI/skins/Aqua/css/all.css" rel="stylesheet" type="text/css" />
    <script src="../../assets/lib/ligerUI/js/ligerui.all.js"></script>
    
    <script src="../../assets/js/Util.js"></script>
    <script type="text/javascript">
        var KE;
        $(function () {
            KindEditor.ready(function (K) {
                KE = K.create('#kinde_content', {
                    cssPath: 'plugins/code/prettify.css',
                    uploadJson: 'KindeHandler.ashx?oprtype=upload',
                    fileManagerJson: 'KindeHandler.ashx?oprtype=manger',
                    allowFileManager: true,
                    afterCreate: function () {
                        //var self = this;
                        //K.ctrl(document, 13, function () {
                        //    self.sync();
                        //    K('form[name=example]')[0].submit();
                        //});
                        //K.ctrl(self.edit.doc, 13, function () {
                        //    self.sync();
                        //    K('form[name=example]')[0].submit();
                        //});
                    }
                });
                prettyPrint();
            });
        })

    </script>
    <script type="text/javascript">
        $(function() {
            $(document).on("click", "input[name=btn_submit]", function () {
                var post_data = {};
                post_data.title = $("input[name=title]").val();
                post_data.art_type = $("select[name=art_type] option:selected").val();
                post_data.content = KE.html();
                var Rtn = GetDataByAjax("../../NB_JsonHttp.aspx", "SAVEARTICLE", "", "", JSON.stringify(post_data));
                if (Rtn.result) {
                    console.log("新增成功。");
                }
            });

            $("#art_form").ligerForm();
        });
    </script>
    <style>
        table {
        width:98%;
        border: 1px solid #eee;
        }
        table tr {
            clear: both;
            display: block;
            padding: 5px 0;
            line-height: 30px;
        }
            table tr td:first-child {
                display: block;
                float: left;
                width: 130px;
                text-align: right;
                color: #6d7e86;
            }
            table tr td:nth-child(2) {
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
    </style>
</head>
<body>
    <div id="art_form">
        <table >
            <tr>
                <td><label for="title">内容标题</label></td>
                <td><input type="text" name="title" value=""  class="myinput"/></td>
            </tr>
            <tr>
            <td><label for="ispublish">发布状态</label></td>
            <td>
                <select name="ispublish" validate="{required:true}" >
                    <option value="1" selected="selected">发布</option>
                    <option value="0">不发布</option>
                </select>
            </td>
            </tr>
            <tr>
                <td><label for="art_type">所属类别</label></td>
                <td>
                    <select name="art_type" validate="{required:true}" >
                        <option value="分类一" selected="selected">分类一</option>
                        <option value="分类一">分类二</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="description">内容摘要</label></td>
                <td><textarea name="description" value="" class="myinput"></textarea></td>
            </tr>
            <tr>
                <td><label for="kinde_content">内容描述</label></td>
                <td>
                    <textarea name="kinde_content" id="kinde_content" cols="100" rows="8" style="width:100%;height:300px;visibility:hidden;"></textarea>
                </td>
            </tr>
        </table>
        <div class="div_btn">
            <input class="btn" type="button" name="btn_submit" value="提交保存" />
        </div>
    </div>
</body>
</html>
