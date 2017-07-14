<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactUs.aspx.cs" Inherits="DtCms.Web.m.contactUs" %>

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
            <div class="title_name">联系我们</div>
        </dt>
        <dd class="container">
            <div class="fixed_content">
               <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label> 
            </div>
        </dd>
    </dl>
    <DtCmsControl:Footer runat="server" id="Footer" />
</body>
</html>
