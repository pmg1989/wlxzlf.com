using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DtCms.Web
{
    public partial class addLinks : DtCms.Web.UI.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

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
            if (string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtTitle.Text) || string.IsNullOrEmpty(txtWebUrl.Text))
            {
                this.jsLayMsg(350, 200, "警告提示", "<b>必填选项不能为空</b>对不起，请填写完整后再提交！", "", "Warning");
                return;
            }
            btnSend.Enabled = false;

            DtCms.Model.Links model = new DtCms.Model.Links();
            DtCms.BLL.Links bll = new DtCms.BLL.Links();
            model.Title = txtTitle.Text.Trim();
            model.UserName = txtUserName.Text.Trim();//5+1+a+s+p+x
            model.UserTel = txtUserTel.Text.Trim();
            model.UserMail = txtUserMail.Text.Trim();
            model.WebUrl = txtWebUrl.Text.Trim();
            model.ImgUrl = txtImgUrl.Text.Trim();
            model.IsImage = int.Parse(rblIsImage.SelectedValue);
            model.IsLock = 1;
            bll.Add(model);
            this.jsAutoMsg("申请链接成功，请等待我们的审核！", "Links.aspx");
        }
    }
}
