using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DtCms.Web
{
    public partial class leftTuijian : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TuijianProBound();//左侧栏推荐产品绑定
            }
        }

        private void TuijianProBound()
        {
            DtCms.BLL.Products bllproduct = new DtCms.BLL.Products();
            DataSet ds = bllproduct.GetList(8, "IsLock = 0 and IsRed = 1", "isTop desc,ClassId asc,Id desc");
            if (ds.Tables[0].Rows.Count > 0)
            {
                try
                {
                    RepeaterTuijianPro.DataSource = ds.Tables[0].DefaultView;
                    RepeaterTuijianPro.DataBind();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }
    }
}