using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace DtCms.Web
{
    public partial class aboutUs : DtCms.Web.UI.BasePage
    {
        protected internal DtCms.Model.WebSet webset;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DtCms.BLL.Contents bll = new DtCms.BLL.Contents();
                DtCms.Model.Contents model = new DtCms.Model.Contents();
                model = bll.GetModel(7);
                this.lbcontent.Text = model.Content;

                webset = new DtCms.BLL.WebSet().loadConfig(Server.MapPath(ConfigurationManager.AppSettings["Configpath"].ToString()));
            }
        }
    }
}