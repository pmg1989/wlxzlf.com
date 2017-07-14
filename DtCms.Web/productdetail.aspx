<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productdetail.aspx.cs"
    Inherits="DtCms.Web.productdetail" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>产品专区 -
        <%=webset.WebName %></title>
    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script src="Js/jquery-1.5.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link href="Css/left-img.css" rel="stylesheet" type="text/css" />
    <link href="Css/jquery.jqzoom.css" rel="stylesheet" type="text/css" />
    <script src="Js/jquery.jqzoom-core-2.js" type="text/javascript"></script>
    <style type="text/css">
        .MainNav li.productlist a
        {
            background-image: url("Css/images/IconNav_09.jpg");
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var firstImg = $(".left-box .small ul li").eq(0).find("a").addClass("zoomThumbActive").find("img").attr("src");
            $(".left-box .big a").attr("href", firstImg);
            $(".left-box .big a img").attr("src",firstImg);
            $('.jqzoom').jqzoom({
                zoomType: 'standard',
                lens: true,
                preloadImages: false,
                alwaysOn: false,
                zoomWidth: 500,
                zoomHeight: 500,
                xOffset: 90
            });
        });
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
            <p class="Text1">
            </p>
            <div class="ProDetail">
                <h2>
                    产品专区 &gt;&gt;
                    <asp:Label ID="lbdaohang1" runat="server" Text=""></asp:Label>
                    &nbsp;>>
                    <asp:Label ID="lbdaohang2" runat="server" Text=""></asp:Label>
                    &nbsp;>>
                    <asp:Label ID="lbdaohangtitle" runat="server" Text=""></asp:Label>
                </h2>
                <%--<div class="detailImg">
                    <div class="outDiv" id="content" style="height: 300px; width: 300px;">
                        <div class="inner1">
                            <a href="" class="jqzoom" rel='gal1' title="">
                                <img src="" style="height: 230px; width: 333px;">
                            </a>
                        </div>
                        <div class="inner2">
                            <ul>
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <li><a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '<%#Eval("ImgUrl").ToString()%>',largeimage: '<%#Eval("ImgUrl").ToString()%>'}">
                                            <img src='<%#Eval("ImgUrl").ToString()%>' alt="" /></a> </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>--%>
                <div class="left-box">
                    <div class="big">
                        <a href="" class="jqzoom" rel='gal1' title="">
                            <%--<img class="b-img" src="" title="triumph" />--%>
                            <asp:Image ID="bigImg" runat="server" class="b-img"/>
                        </a>
                    </div>
                    <div class="small">
                        <ul>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '<%#Eval("ImgUrl").ToString()%>',largeimage: '<%#Eval("ImgUrl").ToString()%>'}">
                                        <img src='<%#Eval("ImgUrl").ToString()%>' alt=""></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
                <div class="ProDetailCon">
                    <h3>
                        产品信息</h3>
                    <table class="TB1">
                        <tbody>
                            <tr>
                                <th>
                                    产品名称：
                                </th>
                                <td>
                                    <asp:Label ID="lbtitle" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    型号：
                                </th>
                                <td>
                                    <asp:Label ID="lbxinghao" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    规格：
                                </th>
                                <td>
                                    <asp:Label ID="lbguige" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    产品价格：
                                </th>
                                <td>
                                    <span style="color: Red;">￥<asp:Label ID="lbprice" runat="server" Text=""></asp:Label></span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    与我联系：
                                </th>
                                <td>
                                    <a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin=<%=webset.QQ1 %>&site=qq&menu=yes'>
                                        <img border='0' src='http://wpa.qq.com/pa?p=2:<%=webset.QQ1 %>:41' alt='点击这里给我发消息'
                                            title='点击这里给我发消息' style='width: 75px; height: 25px;'></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <h3>
                        产品介绍</h3>
                    <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label>
                    <div class="But1">
                        <img alt="更多优惠" src="images/icon5.jpg" />
                    </div>
                </div>
                <div style="clear: both;">
                </div>
            </div>
            <div class="ProShow">
                <h2>
                    相关办公用品推荐</h2>
                <p class="More2">
                </p>
                <asp:Repeater ID="RepeaterXiangguanTuijian" runat="server">
                    <ItemTemplate>
                        <dl>
                            <dd>
                                <a target="_blank" title='<%#Eval("Title").ToString()%>' href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'>
                                    <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' width="170"
                                        height="170"></a>
                            </dd>
                            <dt><b>品名：</b><a title='<%#Eval("Title").ToString()%>' href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                                target="_blank">
                                <%#Eval("Title").ToString()%></a><br>
                                <b>型号：</b><%#Eval("XingHao").ToString()%><br>
                                <b>规格：</b><%#Eval("GuiGe").ToString()%><br>
                                <b>价格：</b><span style="color: Red;">￥<%#Eval("Price").ToString()%></span><br>
                            </dt>
                        </dl>
                    </ItemTemplate>
                </asp:Repeater>
                <div style="clear: both;">
                </div>
            </div>
        </div>
    </div>
    <DtCmsControl:footer ID="Footer" runat="server" />
</body>
</html>
