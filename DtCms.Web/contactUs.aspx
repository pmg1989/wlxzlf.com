<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactUs.aspx.cs" Inherits="DtCms.Web.contactUs" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>联系我们 -
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

            <div class="RightAd">
              <script type="text/javascript" src="/Tools/Advert_js.ashx?id=6"></script>
            </div>
            <p class="Text1">
            </p>
            <div class="ProDetail">
                <h2>
                    联系我们
                </h2>

                <div class="NeiCon">
                    <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label>
                </div>

                <div style="clear: both;">
                </div>
            </div>
        </div>
    </div>
    <DtCmsControl:footer ID="Footer" runat="server" />
</body>
</html>
