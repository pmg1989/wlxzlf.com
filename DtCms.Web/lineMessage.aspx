<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lineMessage.aspx.cs" Inherits="DtCms.Web.lineMessage" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线留言 -
        <%=webset.WebName %></title>
    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/flash.js"></script>
    <link type="text/css" rel="stylesheet" href="Css/style.css" />
    <link href="Images/library/msg.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="Css/pagination.css" />
    <link href="css/custom-theme/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="Js/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.pagination.js"></script>
    <script type="text/javascript" src="Js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="Js/messages_cn.js"></script>
    <script type="text/javascript" src="Images/library/msg.js"></script>
    <script type="text/javascript" src="Images/library/focus.js"></script>
    <script type="text/javascript">
    $(function() {
        //分页参数设置
        $("#Pagination").pagination(<%=pcount %>, {
        callback: pageselectCallback,
        prev_text: "« 上一页",
        next_text: "下一页 »",
        items_per_page:<%=pagesize %>,
        num_display_entries:3,
        current_page:<%=page %>,
        num_edge_entries:2,
        link_to:"?page=__id__"
        });
    });
    function pageselectCallback(page_id, jq) {
        //alert(page_id); 回调函数，进一步使用请参阅说明文档
    }
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
<body id="feedback">
    <form id="form1" runat="server">
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
            <%--<script type="text/javascript" src="Js/jquery-1.3.2.min.js"> </script>--%>
            <script type="text/javascript" src="Js/lrtk.js"> </script>
            <p class="Text1">
            </p>
            <h2 style="color: #B50000;">
                在线留言
            </h2>
            <div class="pageInfo">
                <div class="listMsg">
                    <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                            <dl>
                                <dt><span>发表时间：<%#Eval("AddTime").ToString()%></span><b><%#Eval("UserName").ToString()%>：</b><%#Eval("Title").ToString()%></dt>
                                <dd style="text-indent:25px;">
                                    <%#Eval("Content").ToString()%>
                                    <%#Eval("ReContent").ToString() != "" ? "<div class=\"reply\">\n<h3 style='text-indent:0px;'><span>" + Eval("ReTime").ToString() + "</span>管理员答复：</h3><span style='text-indent:25px;'>" + Eval("ReContent").ToString() + "<span></div>\n" : ""%>
                                </dd>
                            </dl>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="pagebox">
                        <div id="Pagination" class="flickr right">
                        </div>
                    </div>
                </div>
                <div class="line10">
                </div>
                <div class="addMsg">
                    <h2 style="color: #B50000;">
                        发表留言</h2>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="questionTable">
                        <tr>
                            <td width="15%" align="right">
                                你的姓名 *
                            </td>
                            <td width="85%">
                                <asp:TextBox ID="txtUserName" runat="server" Style="width: 200px;" CssClass="input required"
                                    MaxLength="50" minlength="2" HintTitle="联系人姓名" HintInfo="请务必填写你的姓名或称呼，少于50个字符。"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                联系电话 *
                            </td>
                            <td>
                                <asp:TextBox ID="txtUserTel" runat="server" Style="width: 200px;" CssClass="input"
                                    MaxLength="50" minlength="2" HintTitle="联系人电话号码" HintInfo="请填写联系人电话号码，少于50个字符。"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                在线QQ：*
                            </td>
                            <td>
                                <asp:TextBox ID="txtUserQQ" runat="server" Style="width: 200px;" CssClass="input"
                                    MaxLength="50" minlength="2" HintTitle="在线QQ号码或E-Mail地址" HintInfo="请填写联系人QQ号码或电子邮件地址，少于50个字符。"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                留言标题 *
                            </td>
                            <td>
                                <asp:TextBox ID="txtTitle" runat="server" Style="width: 400px;" CssClass="input required"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                留言内容 *
                            </td>
                            <td>
                                <asp:TextBox ID="txtContent" runat="server" Style="width: 400px; height: 100px;"
                                    TextMode="MultiLine" CssClass="textarea required"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                验证码 *
                            </td>
                            <td>
                                <asp:TextBox ID="txtCode" runat="server" Style="width: 50px;" CssClass="required input"></asp:TextBox>
                                <span class="VerifyCode" style="cursor:pointer;color: #14A7DE;font-size: 12px;">
                                    <img src="/Tools/VerifyCodeImage.ashx" width="80" height="22" alt="点击切换验证码" style="vertical-align: middle;" />
                                    切换验证码</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnSend" runat="server" Text="提交留言" OnClick="btnSend_Click" CssClass="submit" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="clear: both;">
            </div>
        </div>
    </div>
    </form>
    <DtCmsControl:footer ID="Footer" runat="server" />
</body>
</html>
