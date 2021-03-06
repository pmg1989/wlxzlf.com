﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Top.ascx.cs" Inherits="DtCms.Web.m.Top" %>

<script src="./js/zepto.min.js"></script>
<script>
    var pathname = window.location.pathname;
    var isMobilePage = pathname.indexOf('/m/') > -1
    var redirectName = pathname.substr(pathname.lastIndexOf('/') + 1) + location.search
    if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
        if(!isMobilePage) {
            window.location.href = "/m/" + redirectName
        }
    } else {
        if(isMobilePage) {
            window.location.href = "/" + redirectName
        }
    }
</script>
<script>
    $(function () {
        var dic = {
            '/m/index.aspx': 0,
            '/m/aboutUs.aspx': 1,
            '/m/productlist.aspx': 2,
            '/m/joinlist.aspx': 3,
            '/m/news.aspx': 4,
            '/m/contactUs.aspx': 1
        }
        var cur = dic[location.pathname]
        $('.navArea ul li').eq(cur).find('a').addClass('current');
    })
</script>

<div id="header">
    <div class="logo">
        <div class="logoimg" style="background:url(./images/logo.jpg) no-repeat 50% 50%;background-size:contain">
            <a id="logoTel" href="tel:<%=webset.WebTel %>"></a>
        </div>
    </div>
    <div class="navBtn">
    <div class="navArea">
        <ul>
        <li><div class="wrap"><a href="/m/index.aspx">首页</a></div></li>
        <li><div class="wrap"><a href="/m/aboutUs.aspx">介绍</a></div></li>
        <li><div class="wrap"><a href="/m/productlist.aspx">产品</a></div></li>
        <li><div class="wrap"><a href="/m/joinlist.aspx">案例</a></div></li>
        <li><div class="wrap"><a href="/m/news.aspx">资讯</a></div></li>
        </ul>
    </div>
    </div>
</div>