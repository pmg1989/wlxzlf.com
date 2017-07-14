using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DtCms.Web.UI;
using System.IO;

namespace DtCms.Web.Admin
{
    public partial class admin_index : ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    lblAdminName.Text = Session["AdminName"].ToString();
                    switch (int.Parse(Session["AdminType"].ToString()))
                    {
                        case 1:
                            lblAdminName.Text += "（超级管理员）";
                            break;
                        case 2:
                            lblAdminName.Text += "（系统管理员）";
                            break;
                        case 3:
                            lblAdminName.Text += "（内容管理员）";
                            break;
                    }
                }
                catch
                {
                }
            }
        }

        protected void lbtnExit_Click(object sender, EventArgs e)
        {
            Session["AdminNo"] = null;
            Session["AdminName"] = null;
            Session["AdminType"] = null;
            Session["AdminLevel"] = null;
            Response.Redirect("login.aspx");
        }

        protected void LinkBtnFabu_Click(object sender, EventArgs e)
        {
            if (AspxToHtml("../index.aspx", Server.MapPath("../index.html")))
            {
                //JscriptPrint("系统设置成功啦！", "admin_config.aspx", "Success");
                Response.Write("<script>alert('网站发布成功!');</script>");
            }
            else
            {
                JscriptMsg(350, 280, "错误提示", "<b>发布网站首页失败！</b>请检查是否有写入权限，如果没有，请联系管理员开启写入该文件的权限！", "admin_config.aspx", "Error");
            }
        }

        /// <summary>
        /// 将Url放到Path目录下，保存为FileName
        /// </summary>
        /// <param name="Url">aspx页面url</param>
        /// <param name="PathFileName">保存路径和生成html文件名</param>
        /// <returns></returns>
        public bool AspxToHtml(string Url, string PathFileName)
        {
            try
            {
                StringWriter strHTML = new StringWriter();
                System.Web.UI.Page myPage = new Page();//System.Web.UI.Page中有个Server对象，我们要利用一下它
                myPage.Server.Execute(Url, strHTML);//将asp_net.aspx将在客户段显示的html内容读到了strHTML中
                StreamWriter sw = new StreamWriter(PathFileName, false, System.Text.Encoding.GetEncoding("GB2312"));
                //StreamWriter sw = new StreamWriter(PathFileName, false, System.Text.Encoding.Default);
                sw.Write(strHTML.ToString());//将strHTML中的字符写到指定的文件中

                strHTML.Close();
                strHTML.Dispose();
                sw.Close();
                sw.Dispose();
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}
