using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DtCms.BLL;

namespace DtCms.Web
{
    public partial class index : DtCms.Web.UI.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repeater1Bound();//绑定正中间最外层一级分类的repeater
                Newsdatabound();//右上侧新闻栏绑定
                TuijianProBound();//右侧栏推荐产品绑定
                HotProBound();//右侧栏热点产品绑定
                ClickProDound();//右侧栏点击排行榜
            }
        }

        private void Newsdatabound()
        {
            DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
            DataSet ds = bll.GetList(2, "ParentId = 0 and KindId = 1", "ClassOrder asc,Id desc");
            if (ds.Tables[0].Rows.Count > 0)
            {
                this.RepeaterNews1.DataSource = ds.Tables[0].DefaultView;
                this.RepeaterNews1.DataBind();
            }
        }

        private void ClickProDound()
        {
            Products bllproduct = new Products();
            DataSet ds = bllproduct.GetList(5, "IsLock = 0", "Click desc");
            if (ds.Tables[0].Rows.Count > 0)
            {
                try
                {
                    RepeaterClick.DataSource = ds.Tables[0].DefaultView;
                    RepeaterClick.DataBind();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }

        private void HotProBound()
        {
            Products bllproduct = new Products();
            DataSet ds = bllproduct.GetList(8, "IsLock = 0 and IsHot = 1", "isTop desc,ClassId asc,Id desc");
            if (ds.Tables[0].Rows.Count > 0)
            {
                try
                {
                    RepeaterHotPro.DataSource = ds.Tables[0].DefaultView;
                    RepeaterHotPro.DataBind();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }

        private void TuijianProBound()
        {
            Products bllproduct = new Products();
            DataSet ds = bllproduct.GetList(8, "IsLock = 0 and IsRed = 1", "isTop desc,ClassId asc,Id desc");
            if (ds.Tables[0].Rows.Count > 0)
            {
                try
                {
                    RepeaterTuijianPro.DataSource = ds.Tables[0].DefaultView;
                    RepeaterTuijianPro.DataBind();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
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

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater Repeater2 = (Repeater)e.Item.FindControl("Repeater2");
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
                        try
                        {
                            Repeater2.DataSource = dt;
                            Repeater2.DataBind();
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.Message);
                        }


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
                        Repeater Repeater3 = (Repeater)e.Item.FindControl("Repeater3");
                        Products bllproduct = new Products();
                        DataSet ds = bllproduct.GetList(10, "ClassId in(" + idList + ") and IsLock = 0 and IsRed = 1", "isTop desc,Id desc,ClassId asc");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            try
                            {
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

        protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

            }
        }

        protected void RepeaterNews1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater RepeaterNews2 = (Repeater)e.Item.FindControl("RepeaterNews2");
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int ID = Convert.ToInt32(drv["Id"]);
                string idList = string.Empty;
                if (ID > 0)
                {
                    DtCms.BLL.Article bllarticle = new Article();
                    DataSet ds = bllarticle.GetList(4, "IsLock = 0 and IsRed = 1 and ClassId = " + ID, "isTop desc,Id desc");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        RepeaterNews2.DataSource = ds.Tables[0].DefaultView;
                        RepeaterNews2.DataBind();
                    }
                }
            }
        }
    }
}
