<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="joinlist.aspx.cs" Inherits="DtCms.Web.m.joinlist" %>

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
</head>
<body>
    <DtCmsControl:Top runat="server" id="Top" />
    <dl class="box">
        <dt class="title">
            <!-- <a class="more arr-round arr-round-blue" href="/3g/info/66579.html"></a> -->
            <div class="title_name">加盟案例</div>
        </dt>
        <dd>
           <ul class="thumb_list">
                    <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                             <li class="pic_list_1">
                                <div class="pic_list_li">
                                    <div class="pic">
                                      <a href='./joindetail.aspx?id=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>' target="_self">
                                        <img src="<%#Eval("ImgUrl").ToString()%>" alt='懒汉杂粮粉' class="intro-info-img pic-left" style="height: 110px;">
                                      </a>
                                    </div>
                                    <div class="txt">
                                        <a href='./productdetail.aspx?id=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>' target="_self"><%#Eval("Title").ToString()%></a>
                                    </div>
                                    <span class="date"></span>
                                </div>
                            </li>
                       </ItemTemplate>
                    </asp:Repeater>
                </ul>
        </dd>
    </dl>
    <DtCmsControl:Footer runat="server" id="Footer" />
</body>
</html>
