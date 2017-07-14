using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DtCms.Web
{
    public partial class test : DtCms.Web.UI.BasePage
    {
        private int proId;
        private int classId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    if (!int.TryParse(Request.QueryString["id"].ToString(), out this.proId))
                    {
                        this.proId = 0;
                    }

                    if (!int.TryParse(Request.QueryString["classid"].ToString(), out this.classId))
                    {
                        this.classId = 0;
                    }

                    addClick();//增加点击率
                    ProductDetailBound();
                    daohangBound();//导航绑定
                    XiangguanTuijianProBound();//底部相关产品推荐绑定
                }
            }
        }

        private void addClick()
        {
            DtCms.BLL.Products bllproduct = new DtCms.BLL.Products();
            bllproduct.UpdateField(proId, "Click = Click + 1");
        }

        private void XiangguanTuijianProBound()
        {
            DtCms.BLL.Products bllproduct = new DtCms.BLL.Products();
            DataSet ds = bllproduct.GetList(10, "IsLock = 0 and IsRed = 1 and ClassId = " + classId + " and Id <>" + proId, "isTop desc,ClassId asc,Id desc");
            if (ds.Tables[0].Rows.Count > 0)
            {
                try
                {
                    RepeaterXiangguanTuijian.DataSource = ds.Tables[0].DefaultView;
                    RepeaterXiangguanTuijian.DataBind();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }

        private void daohangBound()
        {
            DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
            if (proId != 0)
            {
                string channelTitle = bll.GetChannelTitle(classId);
                this.lbdaohang2.Text = channelTitle;

                DtCms.Model.Channel modchannel = bll.GetModel(classId);
                modchannel = bll.GetModel(modchannel.ParentId);
                this.lbdaohang1.Text = modchannel.Title;
            }
        }

        private void ProductDetailBound()
        {
            DtCms.BLL.Products bllproduct = new BLL.Products();
            DtCms.Model.Products modproduct = bllproduct.GetModel(proId);
            this.lbtitle.Text = modproduct.Title;
            this.lbdaohangtitle.Text = modproduct.Title;
            this.lbxinghao.Text = modproduct.Xinghao;
            this.lbguige.Text = modproduct.Guige;
            this.lbprice.Text = modproduct.Price.ToString();
            //this.lbcontent.Text = DtCms.Common.StringPlus.DropHTML(modproduct.Content);
            this.lbcontent.Text = modproduct.Content;
            //ViewState["jqzoom"] = modproduct.ImgUrl;

            string[] imgs = modproduct.ImgUrl.Split(' ');
            DataTable table = new DataTable();
            table.Columns.Add("id", typeof(System.Int32));//类型是可以变换的，比如System.Int32,System.Double..  
            table.Columns.Add("ImgUrl", typeof(System.String));
            for (int i = 0; i < imgs.Length; i++)
            {
                DataRow dr = table.NewRow();
                dr["id"] = i;
                dr["ImgUrl"] = imgs[i];
                table.Rows.Add(dr);
            }

            this.Repeater1.DataSource = table.DefaultView;
            this.Repeater1.DataBind();
            //this.Repeater2.DataSource = table.DefaultView;
            //this.Repeater2.DataBind();
        }
    }
}