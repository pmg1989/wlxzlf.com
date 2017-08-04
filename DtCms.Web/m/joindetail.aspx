<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="joindetail.aspx.cs" Inherits="DtCms.Web.m.joindetail" %>

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
    <div class="box_info">
      <div class="box_display">
          <div class="head">
              <div class="eye"><i class="icons icon-eye"></i>
                  <span><asp:Label ID="lbclick" runat="server" Text=""></asp:Label></span>
              </div>
              <i class="icons icon-back"><a href="javascript:history.back(-1)"></a></i>
          </div>
          <div class="display_content">
              <h1 class="theme">
                  <asp:Label ID="lbtitle" runat="server" Text=""></asp:Label>
              </h1>
              <p class="ms_time">
                  <asp:Label ID="lbaddtime" runat="server" Text=""></asp:Label>
              </p>
              <div class="intro">
                  <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <img src='<%#Eval("ImgUrl").ToString()%>' class='intro-info-img' style="width:100%; max-width: none;" />
                    </ItemTemplate>
                  </asp:Repeater>
              </div>
              <p>
                  <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label>
              </p>
          </div>
      </div>
    </div>
    <DtCmsControl:Footer runat="server" id="Footer" />
  </body>
</html>
