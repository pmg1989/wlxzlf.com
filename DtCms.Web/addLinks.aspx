<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addLinks.aspx.cs" Inherits="DtCms.Web.addLinks" %>
<%@ Register src="Top.ascx" tagname="top" tagprefix="DtCmsControl" %>
<%@ Register src="Footer.ascx" tagname="footer" tagprefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>申请链接 - <%=webset.WebName %></title>
<%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
<link type="text/css" rel="stylesheet" href="Css/style.css" />
<link href="Images/library/msg.css" rel="stylesheet" type="text/css" />
<link href="css/custom-theme/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="Js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="Js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="Js/jquery.validate.min.js"></script>
<script type="text/javascript" src="Js/messages_cn.js"></script>
<script type="text/javascript" src="Images/library/msg.js"></script>
<script type="text/javascript" src="Images/library/focus.js"></script>
<script type="text/javascript">
    $(function() {
        //表单验证JS
        $("#form1").validate({
            //出错时添加的标签
            errorElement: "span",
            success: function(label) {
                //正确时的样式
                label.text(" ").addClass("success");
            }
        });

        //切换验证码
        $(".VerifyCode").bind("click", function() {
            $(".VerifyCode img").attr("src", "/Tools/VerifyCodeImage.ashx?time=" + Math.random());
        });
    });
</script>
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
      <a href="index.aspx">主页</a> &gt; <a href="Links.aspx">友情链接</a> &gt; 申请链接 &gt;
    </div>
    <div class="pageInfo">
      <div class="addLinkForm">
        <h2>交换链接</h2>
        <table width="100%" border="0" cellpadding="5" cellspacing="1" class="msgtable">
          <tr>
            <td width="25%" align="right">网站名称：</td>
            <td width="75%">
              <asp:TextBox ID="txtTitle" runat="server" maxlength="100" CssClass="input required" HintTitle="网站的标题" HintInfo="请填写您网站标题，至少1个字符，小于50个字符。" style="width:250px;"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td align="right">联系人：</td>
            <td>
              <asp:TextBox ID="txtUserName" runat="server" maxlength="50" CssClass="input required" HintTitle="网站的负责人" HintInfo="请填写网站负责人姓名，至少1个字符，小于50个字符。" style="width:250px;"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td align="right">联系电话：</td>
            <td>
              <asp:TextBox ID="txtUserTel" runat="server" maxlength="50" CssClass="input" HintTitle="站长的联系电话" HintInfo="请填写站长的联系电话，至少1个字符，小于50个字符。" style="width:250px;"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td align="right">电子邮箱：</td>
            <td>
              <asp:TextBox ID="txtUserMail" runat="server" maxlength="50" CssClass="input email" HintTitle="站长的电子邮箱" HintInfo="请填写站长的电子邮箱，至少1个字符，小于50个字符。" style="width:250px;"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td align="right">链接网址：</td>
            <td>
              <asp:TextBox ID="txtWebUrl" runat="server" maxlength="250" CssClass="input required url" HintTitle="您网站的网址" HintInfo="请填写您网站网址，以“http://”开头，小于250个字符。" style="width:350px;"></asp:TextBox>
            </td>
          </tr>
          <tr>
            <td align="right">链接类型：</td>
            <td>
                <asp:RadioButtonList ID="rblIsImage" runat="server" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Selected="True" Value="0">文字链接</asp:ListItem>
                    <asp:ListItem Value="1">图片链接</asp:ListItem>
                </asp:RadioButtonList>
            </td>
          </tr>
          <tr>
          <td align="right">Logo图片地址：</td>
          <td>
            <asp:TextBox ID="txtImgUrl" runat="server" maxlength="250" CssClass="input required url" HintTitle="链接LOGO的地址" HintInfo="请填写链接LOGO的地址，以“http://”开头，小于250个字符。" style="width:350px;"></asp:TextBox>
          </td>
          </tr>
          <tr>
          <td align="right">验证码：</td>
          <td><asp:TextBox ID="txtCode" runat="server" style="width:50px;" maxlength="4" CssClass="input required"></asp:TextBox> <a class="VerifyCode" href="javascript:void(0);"><img src="/Tools/VerifyCodeImage.ashx"  width="80" height="22" alt="点击切换验证码" style="vertical-align:middle;" /> 切换验证码</a></td>
        </tr>
          <tr>
            <td align="right">备注说明：</td>
            <td>提交申请前请确保你的网站已经加入了动力启航的链接。</td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td>
                <asp:Button ID="btnSend" runat="server" Text="提交申请" class="submit" onclick="btnSend_Click" />
            </td>
          </tr>
        </table>

      </div>
      
      <div class="ViewWebLink">
        <h2>本站链接</h2>
        <table width="100%" border="0" cellpadding="5" cellspacing="1" class="msgtable">
          <tr>
            <td width="25%" align="center"><a href="http://www.it134.cn" target="_blank">动力启航</a></td>
            <td width="75%"><textarea style="width:350px;height:50px;" class="textarea"><a href="http://www.it134.cn" target=_blank >动力启航</a></textarea></td>
          </tr>
          <tr>
            <td align="center"><a href="http://www.it134.cn" target="_blank"><img src="http://www.it134.cn/images/links.gif" /></a></td>
            <td><textarea style="width:350px;height:50px;" class="textarea"><a href="http://www.it134.cn" target=_blank ><img src="http://www.it134.cn/images/links.gif" border=0 alt="动力启航"></a></textarea></td>
          </tr>
        </table>
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
