﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="DtCms.Web.Footer" %>
      <link href="Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="Css/bdsstyle.css" />
    <link type="text/css" rel="stylesheet" href="css/style.css" />
<div class="RemarkBar">
</div>
<div class="links">
    <div class="nTxt">
        友情链接：<%=DtCms.ActionLabel.Links.ViewImgList(10, "IsRed=1 and IsImage=0 and IsLock=0", "SortId asc,AddTime desc") %>
    </div>
    <div class="nImg">
        <ul>
            <%=DtCms.ActionLabel.Links.ViewImgList(10, "IsRed=1 and IsImage=1 and IsLock=0", "SortId asc,AddTime desc") %>
        </ul>
    </div>
    <div class="clear">
    </div>
</div>
<div class="Footer">
    <p>
        客服电话：<%=webset.WebTel %>
        传真：<%=webset.WebFax %>
        管理员信箱：<%=webset.WebEmail %>
        版权所有：
        <%=webset.WebName %>
        <a href="http://www.miitbeian.gov.cn/">
            <%=webset.WebCrod %></a><br>
        对本站有任何建议、意见或投诉，请联系我们
        <%=webset.WebUrl %>
        网站技术支持：潘明高</p>
    <p>
        <%=webset.WebCopyright %></p>
</div>
<div class="footer clear">
</div>
<style>
    .QQbox
    {
        z-index: 99;
        right: 0px;
        width: 178px;
        position: absolute;
        top: 150px;
    }
    .QQbox .press
    {
        right: 0px;
        width: 33px;
        cursor: pointer;
        border-top-style: none;
        border-right-style: none;
        border-left-style: none;
        position: absolute;
        height: 158px;
        border-bottom-style: none;
    }
    .QQbox .Qlist
    {
        background: url(../img/kf.jpg);
        left: 0px;
        width: 150px;
        height: 158px;
        position: absolute;
    }
    .QQbox .Qkf
    {
        padding-top: 42px;
        padding-left: 13px;
        height: 105px;
        width: 125px;
        font-size: 12px;
        overflow: hidden;
        line-height: 27px;
    }
</style>
<script language="javascript" type="text/javascript">
    document.write("<div class='QQbox' id='divQQbox' >");
    document.write("<div class='Qlist' id='divOnline' onmouseout='hideMsgBox(event);' style='display : none;'>");
    document.write("<div class='Qkf'>");
    document.write("在线咨询 <a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin=<%=webset.QQ1 %>&site=qq&menu=yes'><img border='0' src='http://wpa.qq.com/pa?p=2:<%=webset.QQ1 %>:41' alt='点击这里给我发消息' title='点击这里给我发消息'style='width:65px;'></a>");
    document.write("在线咨询 <a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin=<%=webset.QQ2 %>&site=qq&menu=yes'><img border='0' src='http://wpa.qq.com/pa?p=2:<%=webset.QQ2 %>:41' alt='点击这里给我发消息' title='点击这里给我发消息'style='width:65px;'></a>");
    document.write("技术支持 <a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin=<%=webset.QQ3 %>&site=qq&menu=yes'><img border='0' src='http://wpa.qq.com/pa?p=2:<%=webset.QQ3 %>:41' alt='点击这里给我发消息' title='点击这里给我发消息'style='width:65px;'></a>");
    document.write("");
    document.write("</div>");
    document.write("</div>");
    document.write("<div id='divMenu' onmouseover='OnlineOver();'><img src='img/qq_1.jpg' class='press' alt='QQ客服热线'></div>");
    document.write("</div>");
    var tips; var theTop = 150; var old = theTop;
    function initFloatTips() {
        tips = document.getElementById('divQQbox');
        moveTips();
    };
    function moveTips() {
        var tt = 300;
        if (window.innerHeight) {
            pos = window.pageYOffset
        } else if (document.documentElement && document.documentElement.scrollTop) {
            pos = document.documentElement.scrollTop
        } else if (document.body) {
            pos = document.body.scrollTop;
        }
        pos = pos - tips.offsetTop + theTop;
        pos = tips.offsetTop + pos / 10;
        if (pos < theTop) pos = theTop;
        if (pos != old) {
            tips.style.top = pos + "px";
            tt = 10;
        }
        old = pos;
        setTimeout(moveTips, tt);
    }
    initFloatTips();
    function OnlineOver() {
        document.getElementById("divMenu").style.display = "none";
        document.getElementById("divOnline").style.display = "block";
        document.getElementById("divQQbox").style.width = "150px";
    }
    function OnlineOut() {
        document.getElementById("divMenu").style.display = "block";
        document.getElementById("divOnline").style.display = "none";
    }
    if (typeof (HTMLElement) != "undefined") {
        HTMLElement.prototype.contains = function (obj) {
            while (obj != null && typeof (obj.tagName) != "undefind") {
                if (obj == this) return true;
                obj = obj.parentNode;
            }
            return false;
        };
    }
    function hideMsgBox(theEvent) {
        if (theEvent) {
            var browser = navigator.userAgent;
            if (browser.indexOf("Firefox") > 0) {
                if (document.getElementById('divOnline').contains(theEvent.relatedTarget)) {
                    return;
                }
            }
            if (browser.indexOf("MSIE") > 0) {
                if (document.getElementById('divOnline').contains(event.toElement)) {
                    return;
                }
            }
        }
        document.getElementById("divMenu").style.display = "block";
        document.getElementById("divOnline").style.display = "none";
    }
</script>