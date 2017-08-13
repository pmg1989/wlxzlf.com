using System;
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
                //repeater1Bound();//绑定正中间最外层一级分类的repeater
                //Newsdatabound();//右上侧新闻栏绑定
                //TuijianProBound();//右侧栏推荐产品绑定
                //HotProBound();//右侧栏热点产品绑定
                //ClickProDound();//右侧栏点击排行榜
            }
        }
    }

}
