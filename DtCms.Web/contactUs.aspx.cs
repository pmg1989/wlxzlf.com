using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DtCms.Web
{
    public partial class contactUs : DtCms.Web.UI.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DtCms.BLL.Contents bll = new DtCms.BLL.Contents();
                DtCms.Model.Contents model = new DtCms.Model.Contents();
                model = bll.GetModel(1);
                this.lbcontent.Text = model.Content;
            }
        }
    }
}