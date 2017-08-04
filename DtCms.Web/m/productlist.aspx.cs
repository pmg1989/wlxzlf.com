using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DtCms.BLL;

namespace DtCms.Web.m
{
    public partial class productlist : DtCms.Web.UI.BasePage
    {
        public int channelid;
        public int classId;

        public int pcount = 0; //总条数
        public int page; //当前页

        public readonly int pagesize = 1000; //设置每页显示的大小
        public string orderby = "";
        public string keywords = "";
        public string property = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["channelid"] != null)
                {
                    if (!int.TryParse(Request.QueryString["channelid"].ToString(), out this.channelid))
                    {
                        channelid = 0;
                    }
                }

                if (Request.QueryString["classid"] != null)
                {
                    classId = int.Parse(Request.QueryString["classid"].ToString());
                }

                productlistbound();
            }
        }

        private void productlistbound()
        {
            if (!int.TryParse(Request.Params["page"] as string, out this.page))
            {
                this.page = 0;
            }

            DtCms.BLL.Products bllproduct = new DtCms.BLL.Products();
            DataSet ds = bllproduct.GetPageList(this.pagesize, this.page, "IsLock = 0 and IsRed = 1" + this.keywords, "isTop desc,ClassId asc,Id desc");
            rptList.DataSource = ds.Tables[0].DefaultView;
            rptList.DataBind();
        }
    }
}