using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DtCms.Web
{
    public partial class leftMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dlProductMenuBound();//左侧栏主菜单数据绑定
        }

        private void dlProductMenuBound()
        {
            DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
            DataTable dt = bll.GetList2(0, 2);
            if (dt.Rows.Count > 0)
            {
                this.dlProductMenu2.DataSource = dt.DefaultView;
                this.dlProductMenu2.DataBind();
            }
        }

        protected void dlProductMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater Repeater = (Repeater)e.Item.FindControl("dlProductInfo");
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int mainID = Convert.ToInt32(drv["Id"]);
                if (mainID > 0)
                {
                    DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
                    DataTable dt = bll.GetList2(mainID, 2);
                    if (dt.Rows.Count > 0)
                    {
                        try
                        {
                            Repeater.DataSource = dt;
                            Repeater.DataBind();
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.Message);
                        }
                    }
                }
            }
        }
    }
}