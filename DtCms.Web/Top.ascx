<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Top.ascx.cs" Inherits="DtCms.Web.Top" %>
<link href="Css/StyleSheet.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="Css/bdsstyle.css" />
<div>
</div>
<script src="Css/common.js" type="text/javascript"></script>
<script src="Css/ZhengZ.js" type="text/javascript"></script>
<div id="TopMember_pnlCheck">
    <div class="HeadBar">
        <p class="HeadBarT1">
            欢迎来到<%=webset.WebName %>产品展示网</p>
        <div class="HeadBarT2">
            <div class="logo-r">
                <a href="index.html">返回首页</a>｜<a href="#" onclick="SetHome(this,window.location)">设为首页</a>｜<a
                    href="#" onclick="AddFavorite(window.location,document.title)">加入收藏</a>
            </div>
        </div>
    </div>
</div>
<%----%>
<div class="LogoBar">
    <img src="Css/index_04.jpg"/>   
    <div class="Search">
        <input name="keywords" id="inputkeywords" class="Order" type="text"/>
        <input name="ImageButton1" id="ImgBtnSearch" class="ButImg" src="Css/IconSearch.jpg"
            style="border-width: 0px;" type="image" onclick="checkKeywords();"/>
        <%--<asp:TextBox id="HeadBar_keywords" class="Order" runat="server"></asp:TextBox>
        <asp:ImageButton id="HeadBar_ImageButton1" runat="server" class="ButImg" 
            src="Css/IconSearch.jpg" style="border-width: 0px;" 
            onclick="HeadBar_ImageButton1_Click" OnClientClick="return CheckInfo();"/>--%>
    </div>
</div>

<div class="NavBar" id="Menu">
    <div class="NavIcon">
        <a href="product.aspx" target="_blank">
            <img src="Css/icon2.jpg" alt="全部商品分类"/></a></div>
    <ul class="MainNav">
        <li class="index"><a href="/index.html">首页</a></li>
        <li class="product"><a href="/product.aspx">产品展示</a></li>
        <li class="productlist"><a href="/productlist.aspx">产品专区</a></li>
        <li><a href="/news.aspx">新闻中心</a></li>
        <li><a href="/joinus.aspx">诚邀加盟</a></li>
        <li><a href="/lineMessage.aspx">在线留言</a></li>
        <li><a href="/contactUs.aspx">联系我们</a></li>
        <li><a href="#" onclick="AddFavorite(window.location,document.title)">加入收藏</a> </li>
    </ul>
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
    ActiveMenu("Menu", "ActiveMainNav", "");

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

