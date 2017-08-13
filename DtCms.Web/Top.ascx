<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Top.ascx.cs" Inherits="DtCms.Web.Top" %>

    <script src="js/jquery-1.3.2.min.js"></script>
    <script>
        var pathname = window.location.pathname;
        var isMobilePage = pathname.indexOf('/m/') > -1
        var redirectName = pathname.substr(pathname.lastIndexOf('/') + 1) + location.search
        if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
            if (!isMobilePage) {
                window.location.href = "/m/" + redirectName
            }
        } else {
            if (isMobilePage) {
                window.location.href = "/" + redirectName
            }
        }
    </script>
    <script>
        $(function () {
            var dic = {
                '/index.aspx': 0,
                '/aboutUs.aspx': 1,
                '/productlist.aspx': 2,
                '/joinlist.aspx': 4,
                '/news.aspx': 5,   
                '/contactUs.aspx': 6,
                '/addLinks.aspx': 7,
            }
            var cur = dic[location.pathname]
            $('.nav ul li.nav' + cur).find('a').addClass('current');
        })
    </script>

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
                <a href="productlist.aspx">懒汉杂粮粉</a>
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
                <a href="news.aspx">资讯动态</a>
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

