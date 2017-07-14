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
    public partial class productlist : DtCms.Web.UI.BasePage
    {
        public int channelid;
        public int classId;

        public int pcount = 0; //总条数
        public int page; //当前页

        public readonly int pagesize = 15; //设置每页显示的大小
        public string orderby = "";
        public string keywords = "";
        public string property = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["channelid"] != null)
                {
                    if (!int.TryParse(Request.QueryString["channelid"].ToString(),out this.channelid))
                    {
                        channelid = 0;
                    } 
                }

                if (Request.QueryString["classid"] != null)
                {
                    classId = int.Parse(Request.QueryString["classid"].ToString());
                }

                ProductMenuBound();
                productlistbound();
                daohangBound();//导航绑定
            }
        }

        private void daohangBound()
        {
            DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
            if (channelid != 0)
            {
                string channelTitle = bll.GetChannelTitle(channelid);
                this.lbdaohang.Text = channelTitle;
            }

            if (classId != 0)
            {
                string channelTitle = bll.GetChannelTitle(classId);
                this.lbdaohang2.Text = ">>&nbsp;" + channelTitle;
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
            if (classId == 0 && channelid ==0)//推荐产品
            {
                this.pcount = bllproduct.GetCount("IsLock = 0 and IsRed = 1");
                ds = bllproduct.GetPageList(this.pagesize, this.page, "IsLock = 0 and IsRed = 1" + this.keywords, "isTop desc,ClassId asc,Id desc");
            }
            else if (classId == 0 && channelid != 0)//一级菜单产品
            {
                DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
                DataTable dt = bll.GetList2(channelid, 2);
                string idList = "0";
                if (dt.Rows.Count > 0)
                {
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
                    
                }
                this.pcount = bllproduct.GetCount("ClassId in(" + idList + ") and IsLock = 0");
                ds = bllproduct.GetPageList(this.pagesize, this.page, "ClassId in(" + idList + ") and IsLock = 0" + this.keywords, "isTop desc,ClassId asc,Id desc");
            }
            else//二级菜单产品绑定
            {
                this.pcount = bllproduct.GetCount("IsLock = 0 and ClassId = " + classId);
                ds = bllproduct.GetPageList(this.pagesize, this.page, "IsLock = 0 and ClassId = " + classId + this.keywords, "isTop desc,ClassId asc,Id desc");
            }
            if (ds.Tables[0].Rows.Count > 0)
            {
                try
                {
                    RepeaterProductInfo.DataSource = ds.Tables[0].DefaultView;
                    RepeaterProductInfo.DataBind();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }

        private void ProductMenuBound()
        {
            DtCms.BLL.Channel bll = new DtCms.BLL.Channel();
            DataTable dt = bll.GetList2(channelid, 2);
            if (dt.Rows.Count > 0)
            {
                try
                {
                    DataListMenu.DataSource = dt;
                    DataListMenu.DataBind();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
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