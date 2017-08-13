<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="joinUs.aspx.cs" Inherits="DtCms.Web.joinUs" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>关于我们 -
        <%=webset.WebName %></title>
<%--    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>--%>
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <link rel="stylesheet" href="./css/layout.css" />
    <link rel="stylesheet" href="./css/styles.css" />
</head>
<body>
    <div class="pg_margins">
      <DtCmsControl:top ID="Header" runat="server" />
      <div class="main-home inner">
        <div class="ad_top">
          <script type="text/javascript" src="/Tools/Advert_js.ashx?id=6"></script>
        </div>
        <div class="main mainbg ">
            <div class="location">
                <span class="ico">
                    <a href="/" title="首页">首页</a>
                    <span>&gt;</span>
                    <a href="/contactUs.aspx">关于我们</a>
                </span>
            </div>
            <DtCmsControl:lefttuijian ID="lefttuijian1" runat="server" />
            <div id="rightObj" class="right">
              <div class="description_text">
                  <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label> 
              </div>
              
            </div>
            <div class="main_bottom"></div>
        </div>
      </div>
    </div>
    <DtCmsControl:footer ID="Footer" runat="server" />
</body>
</html>
