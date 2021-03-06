﻿using System;
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
                hotProductListBound();
                hotNewsBound();
                hotJiamenBound();
                aboutUsBound();
            }
        }


        private void hotProductListBound()
        {
            DtCms.BLL.Products bll = new DtCms.BLL.Products();
            //查询绑定数据
            this.productList.DataSource = bll.GetList(8, "classId=106 and IsLock = 0 and isRed=1", "isTop desc,ClassId asc,Id desc");
            this.productList.DataBind();
        }

        private void hotNewsBound()
        {
            DtCms.BLL.Article bll = new DtCms.BLL.Article();
            //查询绑定数据
            DataSet ds = bll.GetList(7, "IsLock = 0 and isRed=1", "isTop desc,ClassId asc,Id desc");
            this.newsList.DataSource = ds;
            this.newsList.DataBind();
        }


        private void hotJiamenBound()
        {
            DtCms.BLL.Products bll = new DtCms.BLL.Products();
            //查询绑定数据
            this.jiamengList.DataSource = bll.GetList(8, "classId=107 and IsLock = 0 and isRed=1", "isTop desc,ClassId asc,Id desc");
            this.jiamengList.DataBind();
        }

        private void aboutUsBound()
        {
            DtCms.BLL.Contents bll = new DtCms.BLL.Contents();
            DtCms.Model.Contents model = new DtCms.Model.Contents();
            model = bll.GetModel(1);
            this.lbcontent.Text = model.Content;
        }
    }

}
