using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DtCms.BLL;

namespace DtCms.Web
{
    public partial class joinlist : DtCms.Web.UI.BasePage
    {
        public int channelid;
        public int classId = 107;

        public int pcount = 0; //总条数
        public int page; //当前页

        public int pagesize; //设置每页显示的大小
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

                this.pagesize = webset.WebProSize;
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
            //获得总条数
            this.pcount = bllproduct.GetCount("ClassId = " + classId + " and IsLock = 0");
            //查询分页绑定数据
            DataSet ds = bllproduct.GetPageList(this.pagesize, this.page, "ClassId = " + classId + " and IsLock = 0", "isTop desc,ClassId asc,Id desc");
            rptList.DataSource = ds.Tables[0].DefaultView;
            rptList.DataBind();
        }


        #region 组合URL参数
        protected string CombKeywords(int _channelid, int _classId, string _orderby, string _keywords, string _property)
        {
            System.Text.StringBuilder strTemp = new System.Text.StringBuilder();
            _keywords = _keywords.Replace("'", "");
            if (_classId > 0)
            {
                strTemp.Append("classId=" + _classId + "&");
            }
            if (_channelid > 0)
            {
                strTemp.Append("channelId=" + _channelid + "&");
            }
            if (!string.IsNullOrEmpty(_orderby))
            {
                strTemp.Append("orderby=" + _orderby + "&");
            }
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