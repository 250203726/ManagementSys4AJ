<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebPages.Home.index" %>

<!DOCTYPE html>

<html lang="zh-CN">
<head>
    <title>荆力总包安质部</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="shoucut icon" href="../assets/ico/favicon.ico" type="image/x-icon"/>
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../assets/js/jquery-1.11.1.min.js"></script>
    <script src="../assets/js/template.min.js"></script>

    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        .index_list {
            width: 100%;
        }

            .index_list li {
                width: 100%;
            }

                .index_list li a {
                    color: #777;
                    text-decoration: none;
                }

                    .index_list li a:hover {
                        color: #333;
                        text-decoration: none;
                    }

        .myspan {
            float: right;
        }

            .myspan a {
                color: #ffffff;
                text-decoration: none;
            }

                .myspan a:hover {
                    color: #333;
                    text-decoration: none;
                }

        .carousel-inner .item a img {
            width: 900px;
            height: 350px;
        }

        .thumbnail > img {
            height: 245px;
        }

        .footer {
            text-align: center;
            padding: 15px 0;
            line-height: 25px;
        }
        .public_tips {
        margin-top:-10px;
        }
        .tips_weather {
            width: 43%;
            text-align: right;
            float: left;
            margin-bottom: 5px;
            overflow-x:hidden;
            height:20px;
        }
        .div_banner {
            background: url('../assets/img/line.png') repeat-x top center;
            width: 100%;
        }
        .navbar-wonder4 {
            color: #fff !important;
            background-color: #337ab7 !important;
            border-color: #337ab7 !important;
        }
        .navbar-nav > .active > a {
            color: #fff !important;
            background-color: #337ab7!important;
        }
        .navbar-default .navbar-brand {
        color:#fff!important;
        }
        .navbar-default .navbar-nav > li > a {
        color:#fff!important;
        font-size:15px
        }
        .navbar-default .navbar-nav > li > a:hover {
        font-size:16px;
        background-color:#2a7fc7!important;
        }
        .navbar {
        border-radius:12px 0px 0px 0px !important;
        font-family:'Microsoft YaHei UI','Microsoft YaHei'
        }
        .div_entersys {
        height:65px;
        z-index:9999;
        position:absolute;
        text-align:right;
        width:90px;
        }
    </style>
   <script type="text/javascript">
       function findWeather() {
           var cityUrl = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js';
           $.getScript(cityUrl, function (script, textStatus, jqXHR) {
               var citytq = remote_ip_info.city;// 获取城市
               var url = "http://php.weather.sina.com.cn/iframe/index/w_cl.php?code=js&city=" + citytq + "&day=0&dfc=3";
               $.ajax({
                   url: url,
                   dataType: "script",
                   scriptCharset: "gbk",
                   success: function (data) {
                       var _w = window.SWther.w[citytq][0];
                       var _f = _w.f1 + "_0.png";
                       if (new Date().getHours() > 17) {
                           _f = _w.f2 + "_1.png";
                       }
                       var img = "<img width='16px' height='16px' src='http://i2.sinaimg.cn/dy/main/weather/weatherplugin/wthIco/20_20/" + _f
                       + "' />";
                       var tq ="天气： "+ citytq + " " + img + " " + _w.s1 + " " + _w.t1 + "℃～" + _w.t2 + "℃  " + _w.d1 + _w.p1 + "级";
                       //#weather自己修改,天气样式自己打断点调试
                       $('div.tips_weather').html(tq);
                   }
               });
           });
       }

       function format_date(str_date) {
           if (!str_date) {
               return '';
           }
           var milli = str_date.replace(/\/Date\((-?\d+)\)\//, '$1');
           var s = "01-01";
           var dt = new Date(parseInt(milli));
           if (dt && (dt instanceof Date)) {
               if (dt.getFullYear() != 1)
                   s =  (dt.getMonth() + 1) + "-" + dt.getDate();
           }
           return s;
       }
       var pageData;
       $(function () {
            pageData=<%=PageData%>;
           try {
               findWeather();
           } catch (e) {
               window.console.log("当前电脑不能访问外网。");
           }
           initArticleList(pageData.security_audit,"security_audit");
           initArticleList(pageData.safty_meeting,"safty_meeting");
           initArticleList(pageData.education_training,"education_training");
           initArticleList(pageData.threeTiXi,"threeTiXi");
           initNotice();
           setRight();
           renderTpl();
       });

       function initArticleList(data,model_name)
       {
           var url = '/home/news_view.aspx?oid=';
           var url2 = '../Components/NBersFileServices/DownloadHandler.ashx?fileids=';
           var tpl = "<li><a href='@url@id'  target='_blank'>@title</a><span class='myspan'>@time</span></li>";
           var ul= $("ul."+model_name);
           $.each(data,function(n,value){
               if (value.remark == "article") {
                   ul.append(tpl.replace("[@type]", "").replace("@url", url).replace("@id", value.id).replace("@title", value.title).replace("@time", format_date( value.create_date)));
               } else {
                   ul.append(tpl.replace("[@type]", "").replace("@url", url2).replace("@id", value.id).replace("@title", value.title).replace("@time", format_date(value.create_date)));
               }   
               //$("ul."+model_name).append($("<li><a  href='/home/news_view.aspx?oid="+value.id+"' target='_blank' data_type='"+value.remark+"'>"+value.title+"<span class='myspan'>"+format_date(value.create_date)+"</span></a> </li>"));
           });        
       }
       function initNotice() {
           var header='<font color="red">重要公告：</font>';
           var content=pageData.unit_notice[0] && pageData.unit_notice[0].content || '暂无公告...';
           $("marquee").html(header+content);
       }
       function setRight()
       {
           var margin_r=$("div.container:eq(0)").offset().left+15;
           $("div.div_entersys").attr("style","right:"+margin_r+"px")
       }

       window.onresize = function () {
           setRight();
       }
       function renderTpl() {
           var Banner_li = template('tpl-carousel-li', pageData);
           $('#carousel-li').html(Banner_li);

           var Banner_item= template('tpl-carousel-item', pageData);
           $('#carousel-item').html(Banner_item);
       }
   </script>
</head>
<body style="padding-top: 0;">
    <div class="div_banner">    
    <div class="container">        
         <a href="../index.aspx" target="_blank"><div class="div_entersys"></div></a>
        <img src="../assets/img/banner-index.png" width="100%" />
        <nav class="navbar navbar-default navbar-wonder4 " role="navigation" style="margin-bottom: 15px;">
            <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
            <div class="container-fluid" style="border-bottom:solid 3px #ff9900">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-7">
                        <span class="sr-only">菜单</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">荆力总包安质部
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-7">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="../Home/index.aspx">首页</a></li>
                        <li><a href="../Home/unit_decription.aspx?news_type=unit_decription">部门概况</a></li>
                        <li><a href="../Home/unit_decription.aspx?news_type=unit_manage">部门管理</a></li>
                        <li><a href="../Home/unit_decription.aspx?news_type=safety_manage">安全管理</a></li>
                        <li><a href="../Home/unit_decription.aspx?news_type=quality_manage">质量管理</a></li>
                        <li><a href="../Home/unit_decription.aspx?news_type=branch_manage">分公司管控</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
    </div>
    </div>            

    <div class="container">
        <div class="public_tips">
            <marquee style="width: 57%; float: left;" scrollamount="3"></marquee>
            <div class="tips_weather"></div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators" id="carousel-li">
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox"  id="carousel-item">
                </div>
                    </div>
            </div>
            <div class="col-md-5">
                <div class="panel panel-primary">
                    <!-- Default panel contents -->
                    <div class="panel-heading" style="font-weight: bold">安 · 全 · 网 · 络 · 图</div>
                    <div class="panel-body">
                        <div>
                            <a href="/UnitManage/NetworkMap_New.aspx" class="thumbnail" target="_blank">
                                <img data-src="holder.js/100%x250" alt="..." src="../assets/img/netmap.jpg">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-5">
                <div class="panel panel-primary" style="margin-bottom: 10px;min-height: 203px;">
                    <!-- Default panel contents -->
                    <div class="panel-heading">安 · 全 · 稽 · 查<span class="myspan"><a href="unit_decription.aspx?news_type=safety_manage&child_type=aqjc" target="_blank">更多>></a></span></div>
                    <div class="panel-body" style="padding-left: 0;">
                        <ul class="index_list security_audit">
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="panel panel-primary" style="margin-bottom: 10px;min-height: 203px;">
                    <!-- Default panel contents -->
                    <div class="panel-heading">安 · 全 · 例 · 会<span class="myspan"><a href="unit_decription.aspx?news_type=safety_manage&child_type=aqlh" target="_blank">更多>></a></span></div>
                    <div class="panel-body" style="padding-left: 0;">
                        <ul class="index_list safty_meeting">
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-5">
                <div class="panel panel-primary" style="margin-bottom: 10px;min-height: 203px;">
                    <!-- Default panel contents -->
                    <div class="panel-heading">教 · 育 · 培 · 训<span class="myspan"><a href="unit_decription.aspx?news_type=safety_manage&child_type=jypx" target="_blank">更多>></a></span></div>
                    <div class="panel-body" style="padding-left: 0;">
                        <ul class="index_list education_training">                         
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="panel panel-primary" style="margin-bottom: 10px;min-height: 203px;">
                    <!-- Default panel contents -->
                    <div class="panel-heading">质 · 量 · 管 · 理<span class="myspan"><a href="unit_decription.aspx?news_type=quality_manage&child_type=zlgl" target="_blank">更多>></a></span></div>
                    <div class="panel-body" style="padding-left: 0;">
                        <ul class="index_list threeTiXi">                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>     
    </div>
    <%--页脚--%>
    <div class="container footer">
       Copyright©2016 荆力总包安质部版权所有</br>
    </div>
        <script type="text/html" id="tpl-carousel-li">
                        {{each index_banner as value i}}
                            <li data-target="#carousel-example-generic" data-slide-to="{{i}}" {{if i ==0}}class="active"{{/if}}></li>
                        {{/each}}
        </script>
        <script type="text/html" id="tpl-carousel-item">
                        {{each index_banner as value i}}
                            <div class="item {{if i ==0}}active{{/if}}">
                                <a href="../Home/news_view.aspx?oid={{value.id}}" target="_blank">
                                    <img src="{{value.description}}" alt="{{value.title}}">
                                </a>
                            <div class="carousel-caption">
                                {{value.title}}
                            </div>
                        </div>
                        {{/each}}
                <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
          </script>     
</body>
</html>

