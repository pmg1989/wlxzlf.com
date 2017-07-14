using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DtCms.Web
{
    public partial class Newsdetail : DtCms.Web.UI.BasePage
    {
        protected int Id;//全局变量ID
        protected DtCms.Model.Article model = new DtCms.Model.Article();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.Params["id"] as string, out this.Id))
            {
                this.jsLayMsg(350, 230, "错误提示", "<b>出现错误啦！</b>您要查看的信息参数不正确或不存在。", "back", "Error");
                return;
            }
            DtCms.BLL.Article bll = new DtCms.BLL.Article();
            model = bll.GetModel(this.Id);//5+1+a+s+p+x
            //浏览数+1
            bll.UpdateField(this.Id, "Click=Click+1");
        }
    }
}
