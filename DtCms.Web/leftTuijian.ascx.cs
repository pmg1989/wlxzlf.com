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
                TuijianNewsBound();//左侧栏推荐新闻绑定
            }
        }

        private void TuijianNewsBound()
        {
            DtCms.BLL.Article bll = new DtCms.BLL.Article();
            //查询绑定数据
            this.newsList.DataSource = bll.GetList(8, "IsLock = 0 and isRed=1", "isTop desc,ClassId asc,Id desc");
            this.newsList.DataBind();
        }
    }
}