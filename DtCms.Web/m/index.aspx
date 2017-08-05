<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DtCms.Web.m.index" %>

<%@ Register Src="~/m/Top.ascx" TagPrefix="DtCmsControl" TagName="Top" %>
<%@ Register Src="~/m/Footer.ascx" TagPrefix="DtCmsControl" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>懒汉杂粮粉 - 合肥程飞餐饮管理有限公司</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="keywords" content="懒汉杂粮粉" />
    <meta name="description" content="懒汉杂粮粉, 麻辣香锅, 合肥程飞餐饮管理有限公司" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="applicable-device" content="mobile" />
    <link rel="stylesheet" href="./css/layout.css" />
    <link rel="stylesheet" href="./css/site.css" />
    <link rel="stylesheet" href="./css/styles.css" />
    <style>
        .topic a {
            display:inline-block;
            vertical-align:middle;
            width: 65%;
            text-overflow:ellipsis; 
            white-space:nowrap; 
            overflow:hidden;
        }
    </style>
</head>
<body>
    <DtCmsControl:Top runat="server" id="Top" />

    <dl class="box">
        <dd>
            <div class="fixed_content">
                <ul class="telbox">
                    <li class="col1">
                        <div class="wrap">
                            <a id="tel_btn" href="tel:15955133009"><i class="icons icon-tel"></i>拨打电话</a>
                        </div>
                    </li>
                    <li class="col2">
                        <div class="wrap">
                            <a href="/m/joinlist.aspx"><i class="icons icon-hd"></i>成功案例</a>
                        </div>
                    </li>
                </ul>
            </div>
        </dd>
    </dl>
    <dl class="box">
        <dt class="title">
            <a class="more arr-round arr-round-blue" href="/m/productlist.aspx"></a>
            <div class="title_name">产品展示</div>
        </dt>
        <dd>
            <ul class="thumb_list">
                <asp:Repeater ID="productList" runat="server">
                    <ItemTemplate>
                            <li class="pic_list_1">
                            <div class="pic_list_li">
                                <div class="pic">
                                    <a href='./productdetail.aspx?id=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>' target="_self">
                                    <img src="<%#Eval("ImgUrl").ToString()%>" alt='懒汉杂粮粉' class="intro-info-img pic-left" style="height: 110px;">
                                    </a>
                                </div>
                                <div class="txt">
                                    <a href='./productdetail.aspx?id=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>' target="_self"><%#Eval("Title").ToString()%></a>
                                </div>
                                <span class="date"></span>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </dd>
    </dl>
    <dl class="box">
        <dt class="title">
            <a class="more arr-round arr-round-blue" href="/m/contactUs.aspx"></a>
            <div class="title_name">我们的优势</div>
        </dt>
        <dd>
            <div class="fixed_content bg_content">
              <img alt="" src="./images/des/des-1.jpg" class='intro-info-img' />
              <p>
                  合肥程飞餐饮管理有限公司, 经过不断发展，形成了公司的核心品牌“懒汉杂粮粉”，
                  成为了安徽杂粮粉名小吃之一，“懒汉杂粮粉”遵循“以顾客为导向、以品质为基础”的发展理念，坚持以创新和创造更高顾客满意为目标，围绕“品质、服务、快捷、卫生”的经营管理方针，致力于弘扬安徽懒汉杂粮粉之精髓、打造最具安徽滋味的杂粮粉文化。
              </p>
              <img alt="" src="./images/des/des-2.jpg" class='intro-info-img' />
              <img alt="" src="./images/des/des-3.jpg" class='intro-info-img' />
              <p style="margin-top: 20px;">
                安徽懒汉杂粮粉坚持健康、卫生、美味的美食理念，凭着合理的经营和广大消费者的良好口碑，现已是安徽最有名的小吃之一。常年提供招商、加盟、培训，让更多的人加入“懒汉杂粮粉”的大家庭。
              </p>
              <img alt="" src="./images/des/des-4.jpg" class='intro-info-img' />
              <img alt="" src="./images/des/des-5.jpg" class='intro-info-img' />
            </div>
        </dd>
    </dl>
    <dl class="box">
        <dt class="title">
            <div class="title_name">公司介绍</div>
        </dt>
        <dd class="container">
            <div class="img_content">
                <h3 class="img_content_pic">
                  <a href='/m/aboutUs.aspx' title='懒汉杂粮粉' target="_self">
                    <img src="./images/mendian.jpg" alt='懒汉杂粮粉' class="intro-info-img pic-left" height='145' width='110'>
                  </a>
                </h3>
                <dl class="img_content_intro">
                    <dt class="img_content_title">
                        <a href='/3g/display/290473.html' title='懒汉杂粮粉' target='_self' style=''>懒汉杂粮粉</a>
                    </dt>
                    <dd class="img_content_views">
                      合肥杜江餐饮企业管理有限公司成立于2008年，经过不断发展，形成了公司的核心品牌“懒汉杂粮粉”， 成为了安徽杂粮粉名小吃之一，“懒汉杂粮粉”遵循“以顾客为导向、以品质为基础”的发展理念，坚持以创新和创造更高顾客满意为目标，围绕“品质、服务、...
                    </dd>
                </dl>
            </div>
        </dd>
    </dl>
    <dl class="box">
        <dt class="title">
            <div class="title_name">学员案例</div>
        </dt>
        <dd>
            <ul class="thumb_list">
                <asp:Repeater ID="joinList" runat="server">
                    <ItemTemplate>
                            <li class="pic_list_1">
                            <div class="pic_list_li">
                                <div class="pic">
                                    <a href='./joindetail.aspx?id=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>' target="_self">
                                    <img src="<%#Eval("ImgUrl").ToString()%>" alt='懒汉杂粮粉' class="intro-info-img pic-left" style="height: 110px;">
                                    </a>
                                </div>
                                <div class="txt">
                                    <a href='./joindetail.aspx?id=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>' target="_self"><%#Eval("Title").ToString()%></a>
                                </div>
                                <span class="date"></span>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </dd>
    </dl>
    <dl class="box">
        <dt class="title">
            <a class="more arr-round arr-round-blue" href="/3g/info/66579.html"></a>
            <div class="title_name">资讯列表</div>
        </dt>
        <dd>
            <div class="news_list">
                <ul class="list_news_01">
                     <asp:Repeater ID="newsList" runat="server">
                        <ItemTemplate>
                            <li class="even2">
                                <span class='date'></span>
                                <span class="topic">
                                    <a href="./newsDetail.aspx?id=<%#Eval("Id").ToString()%>"><%#Eval("Title").ToString()%></a>
                                </span>
                                <img title='New' src='./images/Icons/new.gif' />
                                <%#Eval("isRed").ToString() == "1" ? "<img title='推荐' src='./images/Icons/agree.gif' />": "" %>
                                <%#Eval("isHot").ToString() == "1" ? "<img title='热门' src='./images/Icons/hot_1.gif' />": "" %>
                                <%#Eval("isTop").ToString() == "1" ? "<img title='置顶' src='./images/Icons/ding_1.gif' />": "" %>
                                
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </dd>
    </dl>
    <dl class="box">
        <dt class="title">
            <a class="more arr-round arr-round-blue" href="/m/contactUs.aspx"></a>
            <div class="title_name">联系我们</div>
        </dt>
        <dd class="container">
            <div class="fixed_content">
                <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label> 
            </div>
        </dd>
    </dl>

    <DtCmsControl:Footer runat="server" id="Footer" />
</body>
</html>
