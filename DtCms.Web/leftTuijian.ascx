<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="leftTuijian.ascx.cs"
    Inherits="DtCms.Web.leftTuijian" %>
<div class="LeftProList">
    <h2>
        推荐办公用品</h2>
    <div class="more1">
    </div>
    <asp:Repeater ID="RepeaterTuijianPro" runat="server">
        <ItemTemplate>
            <dl>
                <dd>
                    <a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                        target="_blank">
                        <img src='<%#Eval("ImgUrl").ToString()%>' alt='<%#Eval("Title").ToString()%>' width="70"
                            height="69" alt="特价办公用品"></a></dd>
                <dt><a href='productdetail.aspx?id=<%#Eval("Id").ToString()%>&classid=<%#Eval("ClassId").ToString()%>'
                    title='<%#Eval("Title").ToString()%>' target="_blank"><%#Eval("Title").ToString()%></a><br>
                    <b>型号：</b><%#Eval("XingHao").ToString()%><br>
                    <b>价格：</b><span style="color:Red;">￥<%#Eval("Price").ToString()%></span>
                </dt>
            </dl>
        </ItemTemplate>
    </asp:Repeater>
</div>
