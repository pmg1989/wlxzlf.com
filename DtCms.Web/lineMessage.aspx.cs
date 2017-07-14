using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DtCms.Web
{
    public partial class lineMessage : DtCms.Web.UI.BasePage
    {
        public int pcount = 0; //总条数
        public int page; //当前页
        public readonly int pagesize = 3; //设置每页显示的大小

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RptBind("IsLock=0", "AddTime desc");
            }
        }

        #region 列表绑定
        private void RptBind(string _where, string _orderby)
        {
            if (!int.TryParse(Request.Params["page"] as string, out this.page))
            {
                this.page = 0;
            }
            DtCms.BLL.Feedback bll = new DtCms.BLL.Feedback();
            //获得总条数
            this.pcount = bll.GetCount(_where);
            //查询分页绑定数据
            this.rptList.DataSource = bll.GetPageList(this.pagesize, this.page, _where, _orderby);
            this.rptList.DataBind();
        }
        #endregion

        protected void btnSend_Click(object sender, EventArgs e)
        {
            //验证码检查
            string _code = txtCode.Text.Trim();
            if (string.IsNullOrEmpty(_code))
            {
                this.jsLayMsg(350, 200, "警告提示", "<b>验证码不能为空</b>对不起，为了防止注册机提交，请填写验证码！", "", "Warning");
                return;
            }
            if (Session["DtCode"] == null)
            {
                this.jsLayMsg(350, 200, "警告提示", "<b>验证码生成错误</b>对不起，系统找不到生成的验证码！", "", "Warning");
                return;
            }
            if (_code.ToLower() != (Session["DtCode"].ToString()).ToLower())
            {
                this.jsLayMsg(350, 200, "错误提示", "<b>验证码填写不正确</b>对不起，您输入的验证码有误！", "", "Error");
                return;
            }
            //必填项检查
            if (string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtContent.Text))
            {
                this.jsLayMsg(350, 200, "警告提示", "<b>留言选项不能为空</b>对不起，请填写联系人和留言内容再提交！", "", "Warning");
                return;
            }
            btnSend.Enabled = false;
            DtCms.Model.Feedback model = new DtCms.Model.Feedback();
            DtCms.BLL.Feedback bll = new DtCms.BLL.Feedback();
            model.UserName = txtUserName.Text.Trim();
            model.UserTel = txtUserTel.Text.Trim();
            model.UserQQ = txtUserQQ.Text.Trim();
            model.Title = txtTitle.Text.Trim();
            model.Content = DtCms.Common.StringPlus.ToHtml(txtContent.Text);
            model.AddTime = DateTime.Now;
            bll.Add(model);
            this.jsAutoMsg("留言成功，感谢您的支持！", "lineMessage.aspx");
        }
    }
}
