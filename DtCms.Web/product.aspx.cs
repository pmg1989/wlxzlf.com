using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DtCms.Web
{
    public partial class product : DtCms.Web.UI.BasePage
    {
        public int parentID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repeater1Bound();
                repeater4Bound();
            }
        }

        private void repeater1Bound()
        {
            DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
            DataSet ds = bll.GetList(10, "ParentId = 0 and KindId = 2", "ClassOrder asc,Id desc");
            if (ds.Tables[0].Rows.Count > 0)
            {
                this.Repeater1.DataSource = ds.Tables[0].DefaultView;
                this.Repeater1.DataBind();
            }
        }

        private void repeater4Bound()
        {
            DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
            DataSet ds = bll.GetList(-1, "ParentId = 0 and KindId = 2", "ClassOrder asc,Id desc");
            if (ds.Tables[0].Rows.Count > 0)
            {
                this.Repeater4.DataSource = ds.Tables[0].DefaultView;
                this.Repeater4.DataBind();
            }
        }

        protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater Repeater5 = (Repeater)e.Item.FindControl("Repeater5");
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int mainID = Convert.ToInt32(drv["Id"]);
                if (mainID > 0)
                {
                    //绑定二级子菜单
                    DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
                    DataTable dt = bll.GetList2(mainID, 2);
                    if (dt.Rows.Count > 0)
                    {
                        try
                        {
                            Repeater5.DataSource = dt;
                            Repeater5.DataBind();
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.Message);
                        }
                    }
                }
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int classID = Convert.ToInt32(drv["ClassId"]);
                Label lbMenu = (Label)e.Item.FindControl("lbMenu");
                lbMenu.Text = new DtCms.BLL.Channel().GetChannelTitle(classID);
                DtCms.Model.Channel modchannel = new DtCms.BLL.Channel().GetModel(classID);
                parentID = modchannel.ParentId;
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int mainID = Convert.ToInt32(drv["Id"]);
                string idList = string.Empty;
                if (mainID > 0)
                {
                    //绑定二级子菜单
                    DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
                    DataTable dt = bll.GetList2(mainID, 2);
                    if (dt.Rows.Count > 0)
                    {
                        //获得二级子菜单的所有id号，用以绑定产品列表的in查询条件
                        int dtcount = dt.Rows.Count;
                        for (int i = 0; i < dtcount; i++)
                        {
                            if (i != dtcount - 1)
                            {
                                idList += dt.Rows[i][0].ToString() + ",";
                            }
                            else
                            {
                                idList += dt.Rows[i][0].ToString();
                            }
                        }

                        //显示产品列表
                        Repeater Repeater2 = (Repeater)e.Item.FindControl("Repeater2");
                        Repeater Repeater3 = (Repeater)e.Item.FindControl("Repeater3");
                        DtCms.BLL.Products bllproduct = new DtCms.BLL.Products();
                        DataSet ds = bllproduct.GetList(4, "ClassId in(" + idList + ") and IsLock = 0 and IsSlide = 1", "isTop desc,ClassId asc,Id desc");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            try
                            {
                                Repeater2.DataSource = ds.Tables[0].DefaultView;
                                Repeater2.DataBind();

                                Repeater3.DataSource = ds.Tables[0].DefaultView;
                                Repeater3.DataBind();
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
}