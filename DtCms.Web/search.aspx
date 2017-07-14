<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="DtCms.Web.search" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>产品搜索页 -
        <%=webset.WebName %></title>
    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
    <meta http-equiv="content-type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/flash.js"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link type="text/css" rel="stylesheet" href="css/pagination.css" />
    <script type="text/javascript" src="js/jquery.pagination.js"></script>
    <script type="text/javascript">
    $(function() {
    //分页参数设置
        $("#Pagination").pagination(<%=pcount %>, {
        callback: pageselectCallback,
        prev_text: "« 上一页",
        next_text: "下一页 »",
        items_per_page:<%=pagesize %>,
        num_display_entries:3,
        current_page:<%=page %>,
        num_edge_entries:2,
        link_to:"?<%=this.CombKeywords(this.keywords, this.property) %>page=__id__"
        });
    });
    function pageselectCallback(page_id, jq) {
        //alert(page_id); 回调函数，进一步使用请参阅说明文档
    }

        window.onload = function () {
        var serP = '<%=keywords %>';
        if (trim(serP) != "") {
            document.getElementById("inputkeywords").value = serP;
        }
    }

    </script>
</head>
<body id="home">
    <DtCmsControl:top ID="Header" runat="server" />
    <div class="MainBar">
        <div class="LeftBar">
            <div class="LeftNav1">
                <DtCmsControl:leftmenu ID="leftmenu" runat="server" />
            </div>
            <DtCmsControl:lefttuijian ID="lefttuijian1" runat="server" />
        </div>
        <div class="RightBar">
            <div class="ProShow">
                <h2>
                    产品搜索</h2>
                <div class="NeiCon">
                    <h3 class="text9">
                        您搜索的产品为：<%=keywords%></h3>
                    <p class="text11">
                        以下是为您挑选的相关商品：</p>
                </div>
                <asp:Repeater ID="RepeaterProductInfo" runat="server">
                    <ItemTemplate>
                        <dl>
                            <dd>
                                <a target="_blank" title='<%#Eval("Title").ToString()%>' href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'>
                                    <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' width="170" height="170"/></a></dd>
                            <dt><b>品名：</b><a title='<%#Eval("Title").ToString()%>' href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'><%#Eval("Title").ToString()%></a><br>
                               <b>型号：</b><%#Eval("XingHao").ToString()%><br>
                                <b>规格：</b><%#Eval("Guige").ToString()%><br>
                                <b>商品价：</b><span style="color: Red;">￥<%#Eval("Price").ToString()%></span><br>
                            </dt>
                        </dl>
                    </ItemTemplate>
                </asp:Repeater>
                <div style="clear: both;">
                </div>
            </div>
            <div class="pagebox">
                <div id="Pagination" class="flickr right">
                    </div>
            </div>
        </div>
    </div>
    <DtCmsControl:footer ID="Footer" runat="server" />
</body>
</html>
