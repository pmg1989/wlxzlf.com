<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="DtCms.Web.m.news" %>

<%@ Register Src="~/m/Top.ascx" TagPrefix="DtCmsControl" TagName="Top" %>
<%@ Register Src="~/m/Footer.ascx" TagPrefix="DtCmsControl" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>懒汉杂粮粉 - 合肥程飞餐饮管理有限公司</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="keywords" content="懒汉杂粮粉" />
    <meta name="description" content="懒汉杂粮粉, 麻辣香锅, 合肥程飞餐饮管理有限公司" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="applicable-device" content="mobile" />
    <link rel="stylesheet" href="./css/layout.css" />
    <link rel="stylesheet" href="./css/site.css" />
    <link rel="stylesheet" href="./css/styles.css" />
    <style>
        .topic a {
            display:inline-block;
            vertical-align:middle;
            width: 65%;
            text-overflow:ellipsis; 
            white-space:nowrap; 
            overflow:hidden;
        }
    </style>
</head>
<body>
    <DtCmsControl:Top runat="server" id="Top" />
    <dl class="box">
        <dt class="title">
            <!-- <a class="more arr-round arr-round-blue" href="/3g/info/66579.html"></a> -->
            <div class="title_name">资讯列表</div>
        </dt>
        <dd>
            <div class="news_list">
                <ul class="list_news_01">
                    <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                            <li class="even2">
                                <span class='date'></span>
                                <span class="topic">
                                    <a href="./newsDetail.aspx?id=<%#Eval("Id").ToString()%>"><%#Eval("Title").ToString()%></a>
                                </span>
                                <img title='New' src='./images/Icons/new.gif' />
                                <%#Eval("isRed").ToString() == "1" ? "<img title='推荐' src='./images/Icons/agree.gif' />": "" %>
                                <%#Eval("isHot").ToString() == "1" ? "<img title='热点' src='./images/Icons/hot_1.gif' />": "" %>
                                <%#Eval("isTop").ToString() == "1" ? "<img title='置顶' src='./images/Icons/ding_1.gif' />": "" %>
                                
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </dd>
    </dl>
    <DtCmsControl:Footer runat="server" id="Footer" />
</body>
</html>
