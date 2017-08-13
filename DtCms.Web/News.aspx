<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="DtCms.Web.News"
    EnableViewState="false" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻中心 -
        <%=webset.WebName %></title>
    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
    <link rel="stylesheet" href="./css/layout.css" />
    <link rel="stylesheet" href="./css/styles.css" />
    <link type="text/css" rel="stylesheet" href="css/pagination.css" />
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.pagination.js"></script>
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
        link_to:"?<%=this.CombKeywords(this.classId, this.property) %>page=__id__"
        });
    });
    function pageselectCallback(page_id, jq) {
        //alert(page_id); 回调函数，进一步使用请参阅说明文档
    }
    </script>
</head>
<body id="news">
    <div class="pg_margins">
      <DtCmsControl:top ID="Top1" runat="server" />
      <div class="main-home inner">
        <div class="ad_top">
          <script type="text/javascript" src="/Tools/Advert_js.ashx?id=5"></script>
        </div>
        <div class="main mainbg ">
            <div class="location">
                <span class="ico">
                    <a href="/" title="首页">首页</a>
                    <span>&gt;</span>
                    <a href="/news.aspx">新闻中心</a>
                </span>
            </div>
            <DtCmsControl:lefttuijian ID="lefttuijian2" runat="server" />
             <div id="rightObj" class="right">
              <h2 class="title"><b><span id="lblCurrentName">资讯动态</span></b></h2>
              <div class="news_list">
                <ul class="list_news_01">
                    <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                            <li class="even2">
	                           <span class="date"></span>
	                            <span class="topic">
                                <a href="./newsDetail.aspx?id=<%#Eval("Id").ToString()%>"><%#Eval("Title").ToString()%></a>
                              </span>
	                          <img title='New' src='/m/images/Icons/new.gif' />
                              <%#Eval("isRed").ToString() == "1" ? "<img title='推荐' src='/m/images/Icons/agree.gif' />": "" %>
                              <%#Eval("isHot").ToString() == "1" ? "<img title='热门' src='/m/images/Icons/hot_1.gif' />": "" %>
                              <%#Eval("isTop").ToString() == "1" ? "<img title='置顶' src='/m/images/Icons/ding_1.gif' />": "" %>
                          </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
              </div>
            <div class="pagebox">
                <div id="Pagination" class="flickr right"><span class="disabled">« 上一页</span><span class="current">1</span><span class="disabled">下一页 »</span></div>
            </div>
            </div>
            <div class="main_bottom"></div>
        </div>
      </div>
    </div>
    <DtCmsControl:footer ID="Footer1" runat="server" />
</body>
</html>
