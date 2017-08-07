<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Top.ascx.cs" Inherits="DtCms.Web.Top" %>

    <div class="topArea">
        <div class="bg-topArea">
            <p class="wel">欢迎来到<%=webset.WebName %>产品展示网</p>
        </div>
    </div>
    <div class="header">
        <div class="header-inner clearfix">
            <div class="logo">
                <a href="/" title="">
                    <img src="./images/logo-big.jpg">
                </a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="navbox" id="topNav">
    <div class="nav" style="margin:0 auto;">
        <ul>
            <li class="nav0">
                <a href="/">网站首页</a>
            </li>
            <li class="line"></li>
            <li class="nav1">
                <a href="/aboutUs.aspx" class="">关于我们</a>
            </li>
            <li class="line"></li>
            <li class="nav2">
                <a href="productlist">懒汉杂粮粉</a>
            </li>
            <li class="line"></li>
            <li class="nav3">
                <a href="joinlist.aspx">招商加盟</a>
            </li>
            <li class="line"></li>
            <li class="nav4">
                <a href="joinlist.aspx" class="">加盟案例</a>
            </li>
            <li class="line"></li>
            <li class="nav5">
                <a href="news" class="current">资讯动态</a>
            </li>
            <li class="line"></li>
            <li class="nav6">
                <a href="contactUs.aspx">联系我们</a>
            </li>
            <li class="line"></li>
            <li class="nav7" style="width: 150px;">
                <a href="addLinks.aspx">在线咨询</a>
            </li>
        </ul>
    </div>
    </div>
<script type="text/javascript" language="javascript">
    function checkKeywords() {
        var obj = document.getElementById("inputkeywords");
        if (obj.value == "") {
            alert("请输入产品关键字进行搜索");
        }
        else {
            window.location = "search.aspx?keywords=" + encodeURI(obj.value);
        }
    }

    function ActiveMenu(menuId, className, NoActiveClass) {
        isBreak = 0;
        var pageNames = ["index","news","joinus","lineMessage","contactUs"]
        var pageExt = ["aspx"];
        var loc = window.location + "";
        var idx = -1;
        var obj = document.getElementById(menuId).getElementsByTagName("A");
        //转为小写
        loc = loc.toLowerCase();
        for (j = 0; j < pageNames.length; j++) {
            pageNames[j] = pageNames[j].toLowerCase();
        }
        for (j = 0; j < pageExt.length; j++) {
            pageExt[j] = pageExt[j].toLowerCase();
        }
        // alert(loc);
        for (j = 0; j < pageNames.length; j++) {
            idx = loc.indexOf(pageExt[j]);
            if (idx != -1) {
                break;
            }
        }
        if (idx != -1) {
            loc = loc.substring(0, idx);
            for (j = 0; j < pageNames.length; j++) {
                // alert(pageNames[j]);
                idx = loc.indexOf(pageNames[j]);
                if (idx != -1) {
                    for (var i = 0; i < obj.length; i++) {
                        var href = obj[i].href + "";
                        href = href.toLowerCase();
                        // alert("网址="+href);
                        // alert("文件头=" + pageNames[j]);
                        idx = href.indexOf(pageNames[j]);
                        if (idx != -1) {
                            obj[i].className = className;
                            break;
                        }
                        else {
                            obj[i].className = NoActiveClass;
                        }
                    }
                    break;
                }
            }
        }
    }
    //ActiveMenu("Menu", "ActiveMainNav", "");

    function AddFavorite(sURL, sTitle) {
        try {
            window.external.addFavorite(sURL, sTitle);
        }
        catch (e) {
            try {
                window.sidebar.addPanel(sTitle, sURL, "");
            }
            catch (e) {
                alert("加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    }
    //设为首页 <a onclick="SetHome(this,window.location)">设为首页</a>
    function SetHome(obj, vrl) {
        try {
            obj.style.behavior = 'url(#default#homepage)'; obj.setHomePage(vrl);
        }
        catch (e) {
            if (window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                }
                catch (e) {
                    alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                }
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage', vrl);
            }
        }
    }

</script>

