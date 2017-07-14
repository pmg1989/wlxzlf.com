<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="DtCms.Web.News"
    EnableViewState="false" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻中心 -
        <%=webset.WebName %></title>
    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link type="text/css" rel="stylesheet" href="css/pagination.css" />
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
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
        link_to:"?<%=this.CombKeywords(this.classId, this.property) %>page=__id__"
        });
    });
    function pageselectCallback(page_id, jq) {
        //alert(page_id); 回调函数，进一步使用请参阅说明文档
    }
    </script>
</head>
<body id="news">
    <form id="form1" runat="server">
    <!--Head.Start-->
    <DtCmsControl:top ID="Header" runat="server" />
    <!--Head.End-->
    <div class="MainBar">
        <!--left.start-->
        <div class="LeftBar">
            <div class="LeftNav1">
                <DtCmsControl:leftmenu ID="leftmenu" runat="server" />
            </div>
            <DtCmsControl:lefttuijian ID="lefttuijian1" runat="server" />
        </div>
        <!--left.end-->
        <!--right.start-->
        <div class="RightBar">
            <div class="prplace" style="margin-top:15px; margin-left:15px;">
                <h2 style="color: #B50000;">
                新闻中心
            </h2>
            </div>
            <dl class="p2" style="float: left;">
                <dt><strong class="fc_f60">
                    <%--<%=DtCms.ActionLabel.Channel.ViewChannelTitle(this.classId) %>--%>
                    所有新闻</strong>
                </dt>
                <dd>
                    <ul class="b3">
                        <asp:Repeater ID="rptList" runat="server">
                            <ItemTemplate>
                                <li style="font-size:16px;"><a href="Newsdetail.aspx?id=<%#Eval("Id").ToString()%>">
                                    <%#Eval("Title").ToString()%></a><small>(<%#Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd")%>)</small></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                                <div style="clear: both;">
            </div>
            <div class="pagebox">
                <div id="Pagination" class="flickr right">
                </div>
            </div>
                </dd>
            </dl>
            <div class="IndexRight">
                <div class="imgs" style="margin:15px 0;">
                    <script type="text/javascript" src="/Tools/Advert_js.ashx?id=4"></script>
                </div>
            <div class="RightProList">
                <h2>
                    热点办公用品</h2>
                <div class="more1">
                </div>
                <asp:Repeater ID="RepeaterHotPro" runat="server">
                    <ItemTemplate>
                        <dl>
                            <dd>
                                <a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>' target="_blank" title="<%#Eval("Title").ToString()%>">
                                    <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' height="69"
                                        width="70"></a></dd>
                            <dt><b>品名：</b><a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>' target="_blank" title='<%#Eval("Title").ToString()%>'><%#Eval("Title").ToString()%></a><br>
                                <b>型号：</b><%#Eval("XingHao").ToString()%><br>
                                <b>价格：</b><span style="color: Red;">￥<%#Eval("Price").ToString()%></span><br>
                            </dt>
                        </dl>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            </div>
        </div>
        <!--right.end-->
    </div>
    <!--footer Start-->
    <DtCmsControl:footer ID="Footer" runat="server" />
    <!--footer End-->
    </form>
</body>
</html>
