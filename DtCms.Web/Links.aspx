<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Links.aspx.cs" Inherits="DtCms.Web.Links" %>
<%@ Register src="Top.ascx" tagname="top" tagprefix="DtCmsControl" %>
<%@ Register src="Footer.ascx" tagname="footer" tagprefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>友情链接 - <%=webset.WebName %></title>
<%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
<link type="text/css" rel="stylesheet" href="Css/style.css" />

</head>
<body>
<form id="form1" runat="server">
<!--Head.Start-->
<DtCmsControl:top ID="Header" runat="server" />
<!--Head.End-->

<div class="main">
  <!--left.start-->
  <div class="pleft">
    <dl class="p1">
      <dt><strong>栏目导航</strong></dt>
      <dd>
        <ul class="b1">
          <%=DtCms.ActionLabel.Contents.ViewTxtList(0, 20, "ClassId=7", "SortId asc", "Company.aspx")%>
        </ul>
      </dd>
    </dl>
    <dl class="p1 mtop">
      <dt><strong>热点新闻</strong></dt>
      <dd>
        <ul class="b2">
          <%=DtCms.ActionLabel.Article.ViewTxtList(8, 30, 0, "", "IsHot=1 and IsLock=0", "AddTime desc")%>
        </ul>
      </dd>
    </dl>
  </div>
  <!--left.end-->
  
  <!--right.start-->
  <div class="pright">
    <div class="prplace">
      <a class="addLink" href="addLinks.aspx">申请链接</a><a href="index.aspx">主页</a> &gt; 友情链接 &gt;
    </div>
    <div class="pageInfo">
      <div class="linktxt">
         <h2>文字链接</h2>
         <%=DtCms.ActionLabel.Links.ViewImgList(10, "IsImage=0 and IsLock=0", "SortId asc,AddTime desc") %>
      </div>
      
      <div class="line10"></div>
      <div class="linkimg">
        <h2>图片链接</h2>
        <ul>
          <%=DtCms.ActionLabel.Links.ViewImgList(0, "IsImage=1 and IsLock=0", "SortId asc,AddTime desc") %>
        </ul>
      </div>
      
    </div>
  </div>
  <!--right.end-->

</div>

<!--footer Start-->
<DtCmsControl:footer ID="Footer" runat="server" />
<!--footer End-->
</form>
</body>
</html>
