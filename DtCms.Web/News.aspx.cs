using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DtCms.BLL;
using System.Data;

namespace DtCms.Web
{
    public partial class News : DtCms.Web.UI.BasePage
    {
        public int pcount = 0; //总条数
        public int page; //当前页
        public int pagesize; //设置每页显示的大小

        public int classId;
        public string property = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.Params["classId"] as string, out this.classId))
            {
                this.classId = 0;
            }
            if (!string.IsNullOrEmpty(Request.Params["property"]))
            {
                this.property = Request.Params["property"].Trim();
            }
            if (!Page.IsPostBack)
            {
                this.pagesize = webset.WebNewsSize;
                RptBind("IsLock=0 " + this.CombSqlTxt(this.classId, this.property), "AddTime desc");

                HotProBound();//右侧栏热点产品绑定
                //ClickProDound();//右侧栏点击排行榜
            }
        }

        #region 列表绑定
        private void RptBind(string _where, string _orderby)
        {
            if (!int.TryParse(Request.Params["page"] as string, out this.page))
            {
                this.page = 0;
            }
            DtCms.BLL.Article bll = new DtCms.BLL.Article();
            //获得总条数
            this.pcount = bll.GetCount(_where);
            //查询分页绑定数据
            this.rptList.DataSource = bll.GetPageList(this.pagesize, this.page, _where, _orderby);
            this.rptList.DataBind();
        }
        #endregion

        #region 组合URL参数
        protected string CombKeywords(int _classId, string _property)
        {
            StringBuilder strTemp = new StringBuilder();
            if (_classId > 0)
            {
                strTemp.Append("classId=" + _classId + "&");
            }
            if (!string.IsNullOrEmpty(_property))
            {
                strTemp.Append("property=" + _property + "&");
            }

            return strTemp.ToString();
        }
        #endregion

        #region 组合查询语句
        protected string CombSqlTxt(int _classId, string _property)
        {
            StringBuilder strTemp = new StringBuilder();
            if (_classId > 0)
            {
                strTemp.Append(" and ClassId=" + _classId);
            }
            if (!string.IsNullOrEmpty(_property))
            {
                switch (_property)
                {
                    case "IsMsg":
                        strTemp.Append(" and IsMsg=1");
                        break;
                    case "IsTop":
                        strTemp.Append(" and IsTop=1");
                        break;
                    case "IsRed":
                        strTemp.Append(" and IsRed=1");
                        break;
                    case "IsHot":
                        strTemp.Append(" and IsHot=1");
                        break;
                    case "IsSlide":
                        strTemp.Append(" and IsSlide=1");
                        break;
                }
            }

            return strTemp.ToString();
        }
        #endregion

        private void HotProBound()
        {
            Products bllproduct = new Products();
            DataSet ds = bllproduct.GetList(6, "IsLock = 0 and IsHot = 1", "isTop desc,ClassId asc,Id desc");
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

        //private void ClickProDound()
        //{
        //    Products bllproduct = new Products();
        //    DataSet ds = bllproduct.GetList(5, "IsLock = 0", "Click desc");
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        try
        //        {
        //            RepeaterClick.DataSource = ds.Tables[0].DefaultView;
        //            RepeaterClick.DataBind();
        //        }
        //        catch (Exception ex)
        //        {
        //            throw new Exception(ex.Message);
        //        }
        //    }
        //}
    }
}
