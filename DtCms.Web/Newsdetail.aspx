<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Newsdetail.aspx.cs" Inherits="DtCms.Web.Newsdetail" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>新闻详细页 -
        <%=webset.WebName %></title>
    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/flash.js"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
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
            <div style="width: 977px; display: block; margin-top: 10px;" id="js_ads_banner_top">
                <a href="http://www.zhimengba.com/" target="_blank">
                    <script type="text/javascript" src="/Tools/Advert_js.ashx?id=7"></script>
                </a>
            </div>
            <div style="width: 977px; display: block; margin-top: 10px; display: none;" id="js_ads_banner_top_slide">
                <a href="http://www.zhimengba.com/" target="_blank">
                    <script type="text/javascript" src="/Tools/Advert_js.ashx?id=8"></script>
                </a>
            </div>
            <script type="text/javascript" src="Js/jquery-1.3.2.min.js"> </script>
            <script type="text/javascript" src="Js/lrtk.js"> </script>
            <div class="ProDetail">
                <h2>
                    新闻详细内容
                </h2>
                <div class="pageInfo">
                    <h1>
                        <%=model.Title %></h1>
                    <div class="note">
                        作者：<%=model.Author %>
                        来源：<%=model.Form %>
                        浏览数：<%=model.Click %>
                        发布时间：<%=model.AddTime.ToString() %></div>
                    <%=model.Content %>
                </div>
                <div style="clear: both;">
                </div>
            </div>
        </div>
    </div>
    <DtCmsControl:footer ID="Footer" runat="server" />
</body>
</html>
