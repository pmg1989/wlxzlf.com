<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="DtCms.Web.Footer" %>
    <div class="ftLinkWrap">
          <div class="ftLink clearfix">
              <div class="ftLink-l">
                  <strong>友情链接：</strong>
                      <a href="http://www.baidu.com" target="_blank">百度</a>|
                      <a href="http://www.ibw.cn" target="_blank">安徽网新</a>|
                     <a href="http://www.zhaoyee.cn" target="_blank">诏业科技</a>|
                     <a href="http://idc.ibw.cn" target="_blank">域名空间</a>|
                     <a href="http://seo.ibw.cn" target="_blank">网站优化</a>|
                     <a href="" target="_blank">百度糯米</a>|
                     <a href="http://www.ah.cn" target="_blank">徽商网</a>
              </div>
          </div>
    </div>
    <div class="footer">
        <div class="ft-wrap">
            <div class="copyright">
            <div class="cr">
                <p>
            	    <%=webset.WebName %>&nbsp;&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;
                    <a href="http://www.ibw.cn/mianze.htm" target="_blank" rel="nofollow">免责声明</a>&nbsp;&nbsp;&nbsp;
                    <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow"><%=webset.WebCrod %></a>&nbsp;&nbsp;
                </p>
                <p>
            	    地址：安徽省合肥市庐阳区蒙城路1166号恒盛皇家花园16栋1306室<span style="line-height:1.5;">&nbsp;</span>
                </p>
                <p>
            	    <br>
                </p>
                <p>
            	    <span>电话：<span><%=webset.WebTel %></span>&nbsp;</span>
                </p>
                <p>
            	    设计制作：<a href="http://www.ibw.cn" target="_blank">牛班科技</a>
                </p>
            </div>
            </div>
        </div>
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
