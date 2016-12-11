<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NetworkMap_New.aspx.cs" Inherits="WebPages.UnitManage.NetworkMap_New" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>荆力总包安质部-网络安全图</title>
    <link rel="shoucut icon" href="../assets/ico/favicon.ico" type="image/x-icon"/>
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/jorgchart/css/jquery.jOrgChart.css" rel="stylesheet" />
    <link href="../assets/jorgchart/css/prettify.css" rel="stylesheet" />
    <link href="../assets/jorgchart/css/custom.css?v=20161210" rel="stylesheet" />


    <script src="../assets/js/jquery-1.11.1.min.js"></script>
    <script src="../assets/jorgchart/jquery.jOrgChart.js"></script>
    
    <script type="text/javascript">
        $(function () {
            $("#org").jOrgChart({
                chartElement : '#chart',
                dragAndDrop  : false
            });
        });
    </script>
</head>
  <body>
      <div class="header">
          <h1>湖北荆力工程总承包有限责任公司安全网络图</h1>
      </div>
    <div id="myDiv" runat="server"></div>
    <div id="chart" class="orgChart"></div>  
</body>
</html>
