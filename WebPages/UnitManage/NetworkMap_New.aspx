<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NetworkMap_New.aspx.cs" Inherits="WebPages.UnitManage.NetworkMap_New" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络安全图</title>
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/jorgchart/css/jquery.jOrgChart.css" rel="stylesheet" />
    <link href="../assets/jorgchart/css/prettify.css" rel="stylesheet" />
    <link href="../assets/jorgchart/css/custom.css" rel="stylesheet" />


    <script src="../assets/js/jquery-1.11.1.min.js"></script>
    <script src="../assets/jorgchart/jquery.jOrgChart.js"></script>
    <script src="../assets/jorgchart/prettify.js"></script>
    
    <script type="text/javascript">
        var options=<%=strJSON%>;

        $(function(){
            var _body=$("#mybody");
            var content=$('<ul  id="org" style="display:none"></ul>')
            var tpl=' <li id="beer">@value</li>';



        });

        function BuildChilds(tree,node) {
            $.each(node,function(n,value){
                
            });
        }


        $(document).ready(function() {




            
            $("#org").jOrgChart({
                chartElement : '#chart',
                dragAndDrop  : false
            });
            prettyPrint();
        });
    </script>
</head>
  <body id="mybody" runat="server">
    
    <ul id="org" style="display:none">
    <li>
       Food
       <ul>
         <li id="beer">Beer</li>
         <li>Vegetables
           <a href="http://wesnolte.com" target="_blank">Click me</a>
           <ul>
             <li>Pumpkin</li>
             <li>
                <a href="http://tquila.com" target="_blank">Aubergine</a>
                <p>A link and paragraph is all we need.</p>
             </li>
           </ul>
         </li>
         <li class="fruit">Fruit
           <ul>
             <li>Apple
               <ul>
                 <li>Granny Smith</li>
               </ul>
             </li>
             <li>Berries
               <ul>
                 <li>Blueberry</li>
                 <li>
                     <img src="../assets/jorgchart/images/raspberry.jpg" alt="Raspberry"/>
                 </li>
                 <li>Cucumber</li>
               </ul>
             </li>
           </ul>
         </li>
         <li>Bread</li>
         <li class="collapsed">Chocolate
           <ul>
             <li>Topdeck</li>
             <li>Reese's Cups</li>
           </ul>
         </li>
       </ul>
     </li>
   </ul>            
    
    <div id="chart" class="orgChart"></div>
    

</body>
</html>
