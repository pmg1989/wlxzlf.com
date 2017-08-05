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
    public partial class index : DtCms.Web.UI.BasePage
    {
        public int proClassId = 106;
        public int joinClassId = 107;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //推荐产品列表
                productlistBound();
                //案例学员列表
                joinlistBound();
                //推荐新闻列表
                newsBind();

                //联系我们
                contactUsBind();
            }
            
        }

        private void productlistBound()
        {

            DtCms.BLL.Products bllproduct = new DtCms.BLL.Products();
            DataSet ds = bllproduct.GetList(4, "ClassId = " + proClassId + " and IsLock = 0 and isRed=1", "isTop desc,ClassId asc,Id desc");
            productList.DataSource = ds.Tables[0].DefaultView;
            productList.DataBind();
        }

        private void joinlistBound()
        {

            DtCms.BLL.Products bllproduct = new DtCms.BLL.Products();
            DataSet ds = bllproduct.GetList(2, "ClassId = " + joinClassId + " and IsLock = 0 and isRed=1", "isTop desc,ClassId asc,Id desc");
            joinList.DataSource = ds.Tables[0].DefaultView;
            joinList.DataBind();
        }

        private void newsBind()
        {
            DtCms.BLL.Article bll = new DtCms.BLL.Article();
            //查询绑定数据
            this.newsList.DataSource = bll.GetList(4, "IsLock = 0 and isRed=1", "isTop desc,ClassId asc,Id desc");
            this.newsList.DataBind();
        }

        private void contactUsBind() {
            DtCms.BLL.Contents bll = new DtCms.BLL.Contents();
            DtCms.Model.Contents model = new DtCms.Model.Contents();
            model = bll.GetModel(1);
            this.lbcontent.Text = model.Content;
        }
    }
}