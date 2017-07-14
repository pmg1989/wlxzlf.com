<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DtCms.Web.index"
    EnableViewState="false" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>首页 -
        <%=webset.WebName %></title>
    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
    <link href="Css/jquery.slider.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/flash.js"></script>
    <script src="Js/jquery.slider.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#banner").slider({ effect: (Math.random() > 0.5 ? "fadein" : "slider") });
        });
    </script>
    <style type="text/css">
        .MainNav li.index a
        {
            background-image: url("Css/images/IconNav_09.jpg");
        }
    </style>
</head>
<body id="home">
    <DtCmsControl:top ID="Header" runat="server" />
    <div class="BannerBar">
        <div class="LeftNav">
            <DtCmsControl:leftmenu ID="leftmenu" runat="server" />
        </div>
        <div class="Banner">
            <div class="BannerImg">
                <script type="text/javascript" src="/Tools/Advert_js.ashx?id=1"></script>
            </div>
        </div>
        <div class="News">
            <asp:Repeater ID="RepeaterNews1" runat="server" OnItemDataBound="RepeaterNews1_ItemDataBound">
                <ItemTemplate>
                    <div class="News-1">
                        <h2>
                            <a href="News.aspx" title='<%#Eval("Title").ToString()%>' target="_blank">
                                <%#Eval("Title").ToString()%></a></h2>
                        <ul>
                            <asp:Repeater ID="RepeaterNews2" runat="server">
                                <ItemTemplate>
                                    <li><a href='Newsdetail.aspx?id=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>'
                                        target="_blank">
                                        <%#Eval("Title").ToString()%></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="IndexPro">
        <div class="IndexLeft">
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <div class="IndexLeft1">
                        <div class='IndexLeft1-1-<%# Container.ItemIndex / 2 %>'>
                            <h3>
                                <a href='productlist.aspx?channelid=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>'
                                    target="_blank">
                                    <%#Eval("Title").ToString()%></a></h3>
                            <ul>
                                <asp:Repeater ID="Repeater2" runat="server">
                                    <ItemTemplate>
                                        <li><a href='productlist.aspx?channelid=<%#Eval("ParentId").ToString()%>&classid=<%#Eval("Id").ToString()%>'
                                            title="<%#Eval("Title").ToString()%>" target="_blank">
                                            <%#Eval("Title").ToString()%></a> </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                        <div class='IndexLeft1-<%# (Container.ItemIndex / 2) + 2 %>'>
                            <ul class="IndexProShow">
                                <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound">
                                    <ItemTemplate>
                                        <li><a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                            target="_blank">
                                            <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' height="100"
                                                width="115" /></a> <a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                                    target="_blank" title='<%#Eval("Title").ToString()%>'>
                                                    <%# DataBinder.Eval(Container.DataItem, "Title").ToString().Length <= 10 ? DataBinder.Eval(Container.DataItem, "Title").ToString() : (DataBinder.Eval(Container.DataItem, "Title").ToString().Substring(0, 10))%>
                                                </a>
                                            <br>
                                            <b>价格：</b><span style="color: Red;">￥<%#Eval("Price").ToString()%></span><br>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="IndexRight">
            <div class="imgs">
                <script type="text/javascript" src="/Tools/Advert_js.ashx?id=4"></script>
            </div>
            <div class="RightProList">
                <h2>
                    推荐办公用品</h2>
                <div class="more1">
                </div>
                <asp:Repeater ID="RepeaterTuijianPro" runat="server">
                    <ItemTemplate>
                        <dl>
                            <dd>
                                <a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                    title="<%#Eval("Title").ToString()%>" target="_blank">
                                    <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' height="69"
                                        width="70"></a></dd>
                            <dt><b>品名：</b><a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                target="_blank" title="<%#Eval("Title").ToString()%>"><%#Eval("Title").ToString()%></a><br>
                                <b>型号：</b><%#Eval("XingHao").ToString()%><br>
                                <b>价格：</b><span style="color: Red;">￥<%#Eval("Price").ToString()%></span><br>
                            </dt>
                        </dl>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="imgs">
                <script type="text/javascript" src="/Tools/Advert_js.ashx?id=3"></script>
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
                                <a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                    target="_blank" title="<%#Eval("Title").ToString()%>">
                                    <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' height="69"
                                        width="70"></a></dd>
                            <dt><b>品名：</b><a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                target="_blank" title='<%#Eval("Title").ToString()%>'><%#Eval("Title").ToString()%></a><br>
                                <b>型号：</b><%#Eval("XingHao").ToString()%><br>
                                <b>价格：</b><span style="color: Red;">￥<%#Eval("Price").ToString()%></span><br>
                            </dt>
                        </dl>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="RightProList">
                <h2>
                    点击率排行榜</h2>
                <div class="more1">
                </div>
                <asp:Repeater ID="RepeaterClick" runat="server">
                    <ItemTemplate>
                        <dl>
                            <dd>
                                <a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                    target="_blank" title="<%#Eval("Title").ToString()%>">
                                    <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' height="69"
                                        width="70"></a></dd>
                            <dt><b>品名：</b><a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                target="_blank" title='<%#Eval("Title").ToString()%>'><%#Eval("Title").ToString()%></a><br>
                                <b>型号：</b><%#Eval("XingHao").ToString()%><br>
                                <b>价格：</b><span style="color: Red;">￥<%#Eval("Price").ToString()%></span><br>
                            </dt>
                        </dl>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <DtCmsControl:footer ID="Footer" runat="server" />
</body>
</html>
