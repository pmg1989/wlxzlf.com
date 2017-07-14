<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newsDetail.aspx.cs" Inherits="DtCms.Web.m.newsDetail" %>

<%@ Register Src="~/m/Footer.ascx" TagPrefix="DtCmsControl" TagName="Footer" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>懒汉杂粮粉 - 合肥程飞餐饮管理有限公司</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="keywords" content="懒汉杂粮粉" />
    <meta name="description" content="懒汉杂粮粉, 麻辣香锅, 合肥程飞餐饮管理有限公司" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="applicable-device" content="mobile">
    <link rel="stylesheet" href="./css/layout.css">
    <link rel="stylesheet" href="./css/site.css">
    <link rel="stylesheet" href="./css/styles.css">
  </head>
  <body>
    <div class="box_info">
      <div class="box_display">
          <div class="head">
              <div class="eye"><i class="icons icon-eye"></i><span><%=model.Click + 1 %></span></div>
              <i class="icons icon-back"><a href="javascript:history.back(-1)"></a></i>
          </div>
          <div class="display_content">
              <h1 class="theme"><%=model.Title %></h1>
              <p class="ms_time"><%=model.AddTime.ToString() %></p>
              <div class="intro">
                 <%=model.Content %>
              </div>
          </div>
      </div>
    </div>
    <DtCmsControl:Footer runat="server" id="Footer" />
  </body>
</html>
