<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="joindetail.aspx.cs" Inherits="DtCms.Web.joindetail" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head2" runat="server">
    <title>关于我们 -
        <%=webset.WebName %></title>
<%--    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>--%>
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <link rel="stylesheet" href="./css/layout.css" />
    <link rel="stylesheet" href="./css/styles.css" />
</head>
<body>
    <div class="pg_margins">
      <DtCmsControl:top ID="Top1" runat="server" />
      <div class="main-home inner">
        <div class="ad_top">
          <script type="text/javascript" src="/Tools/Advert_js.ashx?id=6"></script>
        </div>
        <div class="main mainbg ">
            <div class="location">
                <span class="ico">
                    <a href="/" title="首页">首页</a>
                    <span>&gt;</span>
                    <a href="/joinlist.aspx">加盟案例</a>
                    <span>&gt;</span>
                    <span>加盟详情</span>
                </span>
            </div>
            <DtCmsControl:lefttuijian ID="lefttuijian2" runat="server" />
            <div id="rightObj" class="right">
              <h2 class="title">
                  <b>加盟详情</b>
              </h2>
              <div class="display_title">
                  <h1 style=""><asp:Label ID="lbtitle" runat="server" Text=""></asp:Label></h1>
                  <div class="info">
                       <span class="PublishedDate">2016-4-21&nbsp;&nbsp;&nbsp;&nbsp;</span>
                       <span class="Hits">浏览次数：
                         <b class="red" id="hits"><asp:Label ID="lbClick" runat="server" Text=""></asp:Label></b>
                       </span>
                   </div>
                  <p class="ms_time">
                      <asp:Label ID="lbaddtime" runat="server" Text=""></asp:Label>
                  </p>
                  <p style="margin-top: 30px;"> 菜品价格：￥<asp:Label ID="lbprice" runat="server" Text=""></asp:Label></p>
                  <div class="others enquiry"></div>
               </div>
              <div id="info_content" class="display_content display_article" style="text-align: center;">
                  <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                             <img src="<%#Eval("ImgUrl").ToString()%>" class="intro-info-img" style="width: 100%;" />
                        </ItemTemplate>
                    </asp:Repeater>
              </div>
              <p>
                  <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label>
              </p>
              <div class="mobile_qr" style="text-align: center;">
                <img style="width: 300px;height: 300px;" src='http://ibwewm.z243.ibw.cc/api/QR?t=http://www.wlxzlf.com/m/productdetail.aspx?id=<%=proId %>'>
                <p>手机页面二维码</p>
              </div>
              <div class="clear"></div>
              
            </div>
            <div class="main_bottom"></div>
        </div>
      </div>
    </div>
    <DtCmsControl:footer ID="Footer1" runat="server" />
</body>
</html>
