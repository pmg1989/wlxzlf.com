<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="DtCms.Web.product" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>办公用品 -
        <%=webset.WebName %></title>
    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/flash.js"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="Js/jquery.pack.js"></script>
    <script type="text/javascript" src="Js/jQuery.blockUI.js"></script>
    <script type="text/javascript" src="Js/jquery.SuperSlide.js"></script>
    <link href="Css/demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .MainNav li.product a
        {
            background-image: url("Css/images/IconNav_09.jpg");
        }
    </style>
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
            <p class="Text1">
            </p>
            <div class="ProDetail">
                <h2>
                    办公用品展示台</h2>
                <div class="effect">
                    <div class="Mtime">
                        <a class="prev"></a>
                        <!-- MtimeCon S -->
                        <div class="MtimeCon">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                <ItemTemplate>
                                    <div class="tabBox">
                                        <div class="bd">
                                            <ul>
                                                <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                                                    <ItemTemplate>
                                                        <li>
                                                            <div class="text">
                                                                <h3 style="border-bottom: 0px;">
                                                                    <a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                                                        target="_blank" title='<%#Eval("Title").ToString()%>'>
                                                                        <%# DataBinder.Eval(Container.DataItem, "Title").ToString().Length <= 10 ? DataBinder.Eval(Container.DataItem, "Title").ToString() : (DataBinder.Eval(Container.DataItem, "Title").ToString().Substring(0, 10))%>
                                                                    </a>
                                                                </h3>
                                                                <h2>
                                                                    型号：<%#Eval("XingHao").ToString()%>￥<%#Eval("Price").ToString()%></h2>
                                                                <h3>
                                                                    <a href='productlist.aspx' target="_blank">
                                                                        <asp:Label ID="lbMenu" runat="server" Text="Label"></asp:Label></a></h3>
                                                                <p>
                                                                    <%#DtCms.Common.StringPlus.DropHTML(Eval("Content").ToString())%>
                                                                </p>
                                                            </div>
                                                            <div class="imgs">
                                                                <a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                                                    target="_blank">
                                                                    <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' width="420"
                                                                        height="280"></a>
                                                            </div>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                        <div class="hd">
                                            <ul>
                                                <asp:Repeater ID="Repeater3" runat="server">
                                                    <ItemTemplate>
                                                        <li class="on"><a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                                            target="_blank">
                                                            <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' width="420"
                                                                height="280"></a> </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <!-- MtimeCon E -->
                        <a class="next"></a>
                    </div>
                    <script type="text/javascript">
                        jQuery(".Mtime").slide({ titCell: ".MtimeNull", mainCell: ".MtimeCon", effect: "leftLoop", interTime: 5000, autoPlay: true });
                        jQuery(".tabBox").slide({ mainCell: ".bd ul", effect: "fade", interTime: 1000, autoPlay: false });
                    </script>
                </div>
                <div class="NeiCon" style="margin-top: 10px;">
                    <asp:Repeater ID="Repeater4" runat="server" OnItemDataBound="Repeater4_ItemDataBound">
                        <ItemTemplate>
                            <h3>
                                <a href='productlist.aspx?channelid=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>'
                                    target="_blank" style='color: #B50000; font: 18px/40px "Microsoft YaHei";'>
                                    <%#Eval("Title").ToString()%></a></h3>
                            <p style='font: 14px/30px "Microsoft YaHei"; margin-bottom: 0px;'>
                                <asp:Repeater ID="Repeater5" runat="server">
                                    <ItemTemplate>
                                        <a href='productlist.aspx?channelid=<%#Eval("ParentId").ToString()%>&classid=<%#Eval("Id").ToString()%>'
                                            title="<%#Eval("Title").ToString()%>" target="_blank" style="margin: 5px 10px;">
                                            <%#Eval("Title").ToString()%></a>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div style="clear: both;">
                </div>
            </div>
        </div>
    </div>
    <DtCmsControl:footer ID="Footer" runat="server" />
</body>
</html>
