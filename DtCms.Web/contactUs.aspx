<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactUs.aspx.cs" Inherits="DtCms.Web.contactUs" %>

<%@ Register Src="Top.ascx" TagName="top" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftMenu.ascx" TagName="leftmenu" TagPrefix="DtCmsControl" %>
<%@ Register Src="leftTuijian.ascx" TagName="lefttuijian" TagPrefix="DtCmsControl" %>
<%@ Register Src="Footer.ascx" TagName="footer" TagPrefix="DtCmsControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>联系我们 -
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
      <div class="main-home inner">
        <div class="ad_top">
          <script type="text/javascript" src="/Tools/Advert_js.ashx?id=6"></script>
        </div>
        <div class="main mainbg ">
            <div class="location">
                <span class="ico">
                    <a href="/" title="首页">首页</a>
                    <span>&gt;</span>
                    <a href="/contactUs.aspx">联系我们</a>
                </span>
            </div>
            <DtCmsControl:lefttuijian ID="lefttuijian1" runat="server" />
            <div id="rightObj" class="right">
              <div class="description_text" style="text-indent:0;">
                 <asp:Label ID="lbcontent" runat="server" Text=""></asp:Label>
                <!--百度地图容器-->
                <div style="width:940px;height:550px;border:#ccc solid 1px;font-size:12px;" id="map"></div>
              </div>
            </div>
            <div class="main_bottom"></div>
        </div>
      </div>
    </div>
    <DtCmsControl:footer ID="Footer" runat="server" />
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=jmFS1zadb6eGBfoqGAm2VEpoCg9uGor0"></script>
    <script type="text/javascript">
  		//创建和初始化地图函数：
  		function initMap(){
  			createMap();//创建地图
  			setMapEvent();//设置地图事件
  			addMapControl();//向地图添加控件
  			addMapOverlay();//向地图添加覆盖物
  		}
  		function createMap(){
  			map = new BMap.Map("map");
  			map.centerAndZoom(new BMap.Point(117.272239,31.929017),18);
  		}
  		function setMapEvent(){
  			map.enableScrollWheelZoom();
  			map.enableKeyboard();
  			map.enableDragging();
  			map.enableDoubleClickZoom()
  		}
  		function addClickHandler(target,window){
  			target.addEventListener("click",function(){
  				target.openInfoWindow(window);
  			});
  		}
  		function addMapOverlay() {
  			var markers = [
  				{ content:"电话：15955133009&nbsp;<br />地址：合肥市庐阳区蒙城路1166号恒盛皇家花园16栋1306室",
            title:"合肥程飞餐饮管理有限公司",
            imageOffset: {width:-46,height:-21},
            position:{lat:31.929017,lng:117.272239}
          }
  			];
  			for(var index = 0; index < markers.length; index++ ){
          var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
          var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{ imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height) })});
          var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
          var opts = { width: 200, title: markers[index].title, enableMessage: false };
          var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
          marker.setLabel(label); addClickHandler(marker,infoWindow);
          map.addOverlay(marker);
        };
      }

      function addMapControl(){
        var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
        map.addControl(scaleControl);
        var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(navControl);
        var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:false});
        map.addControl(overviewControl);
      }
      var map;
      initMap();
     </script>
</body>
</html>
