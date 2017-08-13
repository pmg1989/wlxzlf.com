<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DtCms.Web.index"
    EnableViewState="false" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>首页 -
        <%=webset.WebName %></title>
    <%=AddMetaInfo(webset.WebKeywords,webset.WebDescription,"") %>
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/flash.js"></script>
    <link rel="stylesheet" href="./css/layout.css" />
    <link rel="stylesheet" href="./css/styles.css" />
</head>
<body>
    <div class="pg_margins">
      <DtCmsControl:top ID="Header" runat="server" />

      <div class="banner">
        <div class="picBox">
            <div class="hd">
              <ul></ul>
            </div>
            <div class="bd">
                <ul style="width: 1200px; height: 350px;">
                    <li style="background: url('http://www.ahlhzlf.com/u/e545af76-ed44-46b0-901d-ad44c96e2dce/image/0635968596824119476.jpg') 50% 0px no-repeat; height: 350px; width: 1200px;">
                        <a href="" style="display:block;width:100%;height:100%"></a>
                    </li>
                    <li style="background: url('http://www.ahlhzlf.com/u/e545af76-ed44-46b0-901d-ad44c96e2dce/image/1636101380085124562.jpg') 50% 0px no-repeat; height: 350px; width: 1200px;">
                        <a href="" style="display:block;width:100%;height:100%"></a>
                    </li>
                    <li style="background: url('http://www.ahlhzlf.com/u/e545af76-ed44-46b0-901d-ad44c96e2dce/image/0635968596824119476.jpg') 50% 0px no-repeat; height: 350px; width: 1200px;">
                        <a href="" style="display:block;width:100%;height:100%"></a>
                    </li>
                </ul>
                <span class="prev_box">
                    <a class="prev"></a>
                    <a class="next"></a>
                </span>
            </div>
        </div>
      </div>
      <div class="main home clearfix">
        <div style="width:1200px;margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;float:left; overflow:hidden;zoom:1">
            <div class="box">
                <div class="title">
                    <span class="more">
                        <a href="/productlist.aspx" target="_blank">更多</a>
                    </span>
                    <div class="title_more">产品展示</div>
                </div>
                <div class="content">
                  <div class="marquee" style="width:1200px;height:190px;overflow:hidden;">
                    <div class="bd">
                      <div class="tempWrap" style="overflow:hidden; position:relative; width:1200px">
                        <ul class="thumb_list" style="width: 3600px; position: relative; overflow: hidden; padding: 0px; margin: 0px;">
                          <asp:Repeater ID="productList" runat="server">
                            <ItemTemplate>
                                <li id="<%#Eval("Id").ToString()%>" class="pic_list_10 clone" style="float: left; width: 200px;">
                                    <div class="pic_list_li">
                                      <div class="pic">
                                        <a target="_blank" title='<%#Eval("Title").ToString()%>' href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'>
                                            <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>'  class="intro-info-img pic-left" width="200px;">
                                        </a>
                                      </div>
                                      <div class="txt">
                                        <a target="_blank" title='<%#Eval("Title").ToString()%>' href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'>
                                            <%#Eval("Title").ToString()%>
                                        </a>
                                      </div>
                                      <span class="date"><%#Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd")%></span>
                                    </div>
                                  </li>
                            </ItemTemplate>
                          </asp:Repeater>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                  <div class="clear"></div>
              </div>
              <div class="clear"></div>
            </div>

        <div id="div_28629" style="width:1200px; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;float:left; overflow:hidden;zoom:1">
            <div id="div_28631" style="width:450px;    margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;float:left; overflow:hidden;zoom:1">
              <div class="thumb_box">
                  <div class="title">
                          <span class="more">
                              <a href="/aboutUs.aspx" target="_blank">更多</a>
                          </span>
                      <div class="title_more">公司介绍</div>
                  </div>
                  <div class="content">
                    <div class="img_content">
                      <h3 class="img_content_pic">
                        <a href="/aboutUs.aspx" title="懒汉杂粮粉" target="_self">
                          <img src="../../m/images/mendian.jpg" alt="懒汉杂粮粉" class="intro-info-img pic-left" height="101" width="135">
                        </a>
                      </h3>
                      <dl class="img_content_intro">
                        <dd class="img_content_title">
                          <a href="/display/290473.html" title="懒汉杂粮粉" target="_self" style="">懒汉杂粮粉</a>
                        </dd>
                        <dd class="img_content_views">
                            合肥程飞餐饮管理有限公司成立于2008年，经过不断发展，形成了公司的核心品牌“懒汉杂粮粉”， 成为了安徽杂粮粉名小吃之一，“懒汉杂粮粉”遵循“以顾客为导向、以品质为基础”的发展理念，坚持以创新和创造更高顾客满意为目标，围绕“品质、服务、快捷、卫生”的经营管理方针，致力于弘扬安徽懒汉杂粮粉之精髓、打造最具安徽滋味的杂粮粉文化。
　　安徽懒汉杂粮粉坚持健康、卫生、美味的美食理念，凭着合理的经营和广大消费者的良好口碑，现已是安徽最有名的小吃之一。常年提供招商、加盟、培训，让更多的人加入“懒汉杂粮粉”的大家庭。</dd>
                      </dl>
                    </div>
                  </div>
                  <div class="clear"></div>
              </div>
              <div class="clear"></div>
          </div>
            <div id="div_28632" style="width:720px; margin:0px 15px 0px 15px;padding:0px 0px 0px 0px;float:left; overflow:hidden;zoom:1">
                <%--<div class="news_box">
                    <div class="content">
                      <div class="img_content">
                        <h3 class="img_content_pic"></h3>
                        <dl class="img_content_intro">
                          <dd class="img_content_title">
                            <a href="/display/296339.html" title="五谷杂粮 13种五谷杂粮的功效与作用" target="_self" style="">五谷杂粮 13种五谷杂粮的功效与作用</a>
                          </dd>
                          <dd class="img_content_views">现代人们生活条件日渐提高，大米和小麦是我们经常食用的主食，很多人都不知道五谷杂粮有哪些，更不知道吃五谷杂粮的好处了。那么你知道五谷杂粮对我们有什么好处吗？今天小编就向大家...</dd>
                        </dl>
                      </div>
                    </div>
                    <div class="clear"></div>
                </div>--%>
                <div class="news_box_list">
                    <div class="content">
                        <div class="news_list">
                          <ul class="list_news_01">
                              
                              <asp:Repeater ID="newsList" runat="server">
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

                                      <span class="date"><%#Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd")%></span>
                                  </li>
                                    
                                </ItemTemplate>
                            </asp:Repeater>
                          </ul>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
      </div>
      <div class="box">
        <div class="title">
            <span class="more">
                <a href="" target="_blank">更多</a>
            </span>
            <div class="title_more">我们的优势</div>
        </div>
        <div class="content">
          <div class="fixed_content">
            <div align="center">
              <img src="./images/wmdys.jpg" height="1480" align="" width="1200"><br>
            </div>
          </div>
        </div>
        <div class="clear"></div>
      </div>

      <div class="main home clearfix">
        <div style="width:1200px;margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;float:left; overflow:hidden;zoom:1">
            <div class="box">
                <div class="title">
                    <span class="more">
                        <a href="/joinlist.aspx" target="_blank">更多</a>
                    </span>
                    <div class="title_more">加盟案列展示</div>
                </div>
                <div class="content">
                  <div class="marquee" style="width:1200px;height:190px;overflow:hidden;">
                    <div class="bd">
                      <div class="tempWrap" style="overflow:hidden; position:relative; width:1200px">
                        <ul class="thumb_list" style="width: 3600px; position: relative; overflow: hidden; padding: 0px; margin: 0px;">
                          <asp:Repeater ID="jiamengList" runat="server">
                            <ItemTemplate>
                                <li id="<%#Eval("Id").ToString()%>" class="pic_list_10 clone" style="float: left; width: 200px;">
                                    <div class="pic_list_li">
                                      <div class="pic">
                                        <a target="_blank" title='<%#Eval("Title").ToString()%>' href='joindetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'>
                                            <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>'  class="intro-info-img pic-left" width="200px;">
                                        </a>
                                      </div>
                                      <div class="txt">
                                        <a target="_blank" title='<%#Eval("Title").ToString()%>' href='joindetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'>
                                            <%#Eval("Title").ToString()%>
                                        </a>
                                      </div>
                                      <span class="date"><%#Convert.ToDateTime(Eval("AddTime")).ToString("yyyy-MM-dd")%></span>
                                    </div>
                                  </li>
                            </ItemTemplate>
                          </asp:Repeater>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                  <div class="clear"></div>
              </div>
              <div class="clear"></div>
            </div>
      </div>

      <div class="box">
        <div class="title">
            <span class="more">
                <a href="/contactUs.aspx" target="_blank">更多</a>
            </span>
            <div class="title_more">联系我们</div>
        </div>
        <div class="content">
          <div class="description_text">
                <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label> 
            </div>
          <div style="width:1120px;height:600px;border:#ccc solid 1px;font-size:12px; margin:10px auto 30px;" id="map"></div>
        </div>
        <div class="clear"></div>
      </div>
    </div>
    <DtCmsControl:footer ID="Footer" runat="server" />
    <script src="./js/jquery.min.js"></script>
    <script src="./js/jquery.SuperSlide.2.1.1.js"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jmFS1zadb6eGBfoqGAm2VEpoCg9uGor0"></script>
    <script type="text/javascript">
        //创建和初始化地图函数：
        function initMap() {
            createMap();//创建地图
            setMapEvent();//设置地图事件
            addMapControl();//向地图添加控件
            addMapOverlay();//向地图添加覆盖物
        }
        function createMap() {
            map = new BMap.Map("map");
            map.centerAndZoom(new BMap.Point(117.272239, 31.929017), 18);
        }
        function setMapEvent() {
            map.enableScrollWheelZoom();
            map.enableKeyboard();
            map.enableDragging();
            map.enableDoubleClickZoom()
        }
        function addClickHandler(target, window) {
            target.addEventListener("click", function () {
                target.openInfoWindow(window);
            });
        }
        function addMapOverlay() {
            var markers = [
  				{
  				    content: "电话：15955133009&nbsp;<br />地址：合肥市庐阳区蒙城路1166号恒盛皇家花园16栋1306室",
  				    title: "合肥程飞餐饮管理有限公司",
  				    imageOffset: { width: -46, height: -21 },
  				    position: { lat: 31.929017, lng: 117.272239 }
  				}
            ];
            for (var index = 0; index < markers.length; index++) {
                var point = new BMap.Point(markers[index].position.lng, markers[index].position.lat);
                var marker = new BMap.Marker(point, { icon: new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png", new BMap.Size(20, 25), { imageOffset: new BMap.Size(markers[index].imageOffset.width, markers[index].imageOffset.height) }) });
                var label = new BMap.Label(markers[index].title, { offset: new BMap.Size(25, 5) });
                var opts = { width: 200, title: markers[index].title, enableMessage: false };
                var infoWindow = new BMap.InfoWindow(markers[index].content, opts);
                marker.setLabel(label); addClickHandler(marker, infoWindow);
                map.addOverlay(marker);
            };
        }

        function addMapControl() {
            var scaleControl = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
            scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
            map.addControl(scaleControl);
            var navControl = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
            map.addControl(navControl);
            var overviewControl = new BMap.OverviewMapControl({ anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: false });
            map.addControl(overviewControl);
        }
        var map;
        initMap();
     </script>
    <script type="text/javascript">
        var showBanner = function () {
            $('.picBox').slide({
                titCell: '.hd ul',
                mainCell: '.bd ul',
                autoPlay: true,
                autoPage: true,
                effect: 'fold',
                easing: 'easeOutCirc',
                trigger: 'mouseover',
                pnLoop: true,
                interTime: 3000,
                delayTime: 1000
            });
        }
        showBanner();
        $(window).resize(function () { showBanner(); });
    </script>
    <script type="text/javascript">
        $('.marquee').slide({
            mainCell: '.bd ul',
            autoPlay: true,
            effect: 'leftMarquee',
            vis: '6',
            interTime: '30',
            trigger: 'click'
        });
    </script>
</body>
</html>
