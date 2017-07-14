<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactUs.aspx.cs" Inherits="DtCms.Web.m.contactUs" %>

<%@ Register Src="~/m/Top.ascx" TagPrefix="DtCmsControl" TagName="Top" %>

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
            <a class="more arr-round arr-round-blue" href="/3g/info/66577.html"></a>
            <div class="title_name">联系我们</div>
        </dt>
        <dd class="container">
            <div class="fixed_content">
               <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label> 
            </div>
        </dd>
    </dl>
    <div class="youlink">
        友情链接：
        <a href="http://www.baidu.com" target="_blank">百度</a>
        |<a href="http://www.ibw.cn" target="_blank">安徽网新</a>
        |<a href="http://www.zhaoyee.cn" target="_blank">诏业科技</a>
        |<a href="http://idc.ibw.cn" target="_blank">域名空间</a>
        |<a href="http://seo.ibw.cn" target="_blank">网站优化</a>
        |<a href="http://www.nuomi.com/?utm_source=baidu&amp;utm_medium=brand_wangye&amp;utm_term=&amp;utm_content=&amp;utm_campaign=title&amp;cid=002301" target="_blank">百度糯米</a>
        |<a href="http://www.ah.cn" target="_blank">徽商网</a>
    </div>
    <div class="youlink">
        <p class="copyright">
            <div class="cr" align="justify"></div>
        <p>
            合肥杜江餐饮企业管理有限公司 &nbsp;  版权所有&nbsp;&nbsp;
            <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">皖ICP备14015488号</a>
            <a class="ke-tmlp">
                <span class="s-red">&nbsp;&nbsp;</span>
            </a>
            <a class="ke-tmlp">
                <span class="s-red">
                <a href="http://www.ibw.cn/mianze.htm" target="_blank" rel="nofollow">免责声明</a>
                </span>
            </a>
        </p>
    </div>
</body>
</html>
