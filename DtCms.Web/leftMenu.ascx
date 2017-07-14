<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="leftMenu.ascx.cs" Inherits="DtCms.Web.leftMenu" %>
    <div class="LeftNav">
        <div id="menus">
            <ul class="main-menu">
                <!--主菜单开始-->
                <asp:Repeater ID="dlProductMenu2" runat="server" OnItemDataBound="dlProductMenu_ItemDataBound">
                    <ItemTemplate>
                        <li class="main-tab"><a href='productlist.aspx?channelid=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>'>
                            <%#Eval("Title").ToString()%></a>
                            <ul style="display: none;" class="sub-menu">
                                <!--子菜单开始-->
                                <asp:Repeater ID="dlProductInfo" runat="server">
                                    <ItemTemplate>
                                        <li><a href='productlist.aspx?channelid=<%#Eval("ParentId").ToString()%>&classid=<%#Eval("Id").ToString()%>' title='<%#Eval("Title").ToString()%>'>
                                            <%#Eval("Title").ToString() + "&nbsp;&nbsp;|"%></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <!--子菜单结束-->
                            </ul>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <!--主菜单结束-->
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="Css/ytabs.js"></script>
    <script type="text/javascript"> 
            <!--
        YTabs.tabs({ tabs: YTabs.getByClassName('main-tab', 'li', 'menus'), contents: YTabs.getByClassName('sub-menu', 'ul', 'menus'), hideAll: true });
             //-->
                
    </script>


