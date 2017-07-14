using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DtCms.Web.m
{
    public partial class aboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DtCms.BLL.Contents bll = new DtCms.BLL.Contents();
                DtCms.Model.Contents model = new DtCms.Model.Contents();
                model = bll.GetModel(7);
                this.lbcontent.Text = model.Content;
            }
        }
    }
}