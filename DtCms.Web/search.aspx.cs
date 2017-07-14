using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DtCms.Web
{
    public partial class search : DtCms.Web.UI.BasePage
    {
        public int pcount = 0; //总条数
        public int page; //当前页
        public readonly int pagesize = 15; //设置每页显示的大小
        public string keywords = "";
        public string property = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.Params["keywords"]))
            {
                this.keywords = Server.UrlDecode(Request.Params["keywords"].Trim());
            }
            if (!string.IsNullOrEmpty(Request.Params["property"]))
            {
                this.property = Request.Params["property"].Trim();
            }

            if (!IsPostBack)
            {
                productlistbound();
            }

        }

        private void productlistbound()
        {
            if (!int.TryParse(Request.Params["page"] as string, out this.page))
            {
                this.page = 0;
            }

            DataSet ds = null;
            DtCms.BLL.Products bllproduct = new DtCms.BLL.Products();

            this.pcount = bllproduct.GetCount("IsLock = 0 and title like '%" + this.keywords + "%'");
            ds = bllproduct.GetPageList(this.pagesize, this.page, "IsLock = 0 and title like '%" + this.keywords + "%'", "isTop desc,ClassId asc,Id desc");

            if (ds.Tables[0].Rows.Count > 0)
            {
                try
                {
                    for(int i=0;i < ds.Tables[0].Rows.Count; i++)
                    {
                        ds.Tables[0].Rows[i]["title"] = ds.Tables[0].Rows[i]["title"].ToString().Replace(this.keywords, "<font color=red>" + this.keywords + "</font>");
                    }
                    RepeaterProductInfo.DataSource = ds.Tables[0].DefaultView;
                    RepeaterProductInfo.DataBind();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }

        #region 组合URL参数
        protected string CombKeywords(string _keywords, string _property)
        {
            System.Text.StringBuilder strTemp = new System.Text.StringBuilder();
            _keywords = _keywords.Replace("'", "");

            if (!string.IsNullOrEmpty(_keywords))
            {
                strTemp.Append("keywords=" + HttpUtility.UrlEncode(_keywords) + "&");
            }
            if (!string.IsNullOrEmpty(_property))
            {
                strTemp.Append("property=" + _property + "&");
            }

            return strTemp.ToString();
        }
        #endregion
    }
}