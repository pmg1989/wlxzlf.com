using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DtCms.Common;

namespace DtCms.Web.Admin.Products
{
    public partial class Edit : DtCms.Web.UI.ManagePage
    {
        public int Id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.Params["id"] as string, out this.Id))
            {
                JscriptMsg(350, 230, "错误提示", "<b>出现错误啦！</b>您要修改的信息不存在或参数不正确。", "back", "Error");
                return;
            }
            if (!Page.IsPostBack)
            {
                chkLoginLevel("editProducts");
                TreeBind();
                ShowInfo(this.Id);
            }
        }

        //绑定类别
        private void TreeBind()
        {
            DtCms.BLL.Channel cbll = new DtCms.BLL.Channel();
            DataTable dt = cbll.GetList(0, 2);

            this.ddlClassId.Items.Clear();
            this.ddlClassId.Items.Add(new ListItem("请选择所属类别...", ""));
            foreach (DataRow dr in dt.Rows)
            {
                string Id = dr["Id"].ToString();
                int ClassLayer = int.Parse(dr["ClassLayer"].ToString());
                string Title = dr["Title"].ToString().Trim();

                if (ClassLayer == 1)
                {
                    this.ddlClassId.Items.Add(new ListItem(Title, Id));
                }
                else
                {
                    Title = "├ " + Title;
                    Title = StringPlus.StringOfChar(ClassLayer - 1, "　") + Title;
                    this.ddlClassId.Items.Add(new ListItem(Title, Id));
                }
            }
        }

        //赋值操作
        private void ShowInfo(int _id)
        {
            DtCms.BLL.Products bll = new DtCms.BLL.Products();
            DtCms.Model.Products model = bll.GetModel(_id);

            txtTitle.Text = model.Title;
            txtGuige.Text = model.Guige;
            txtXinghao.Text = model.Xinghao;
            txtPrice.Text = model.Price.ToString();
            ddlClassId.SelectedValue = model.ClassId.ToString();
            //txtImgUrl0.Text = model.ImgUrl;
            FCKeditor.Value = model.Content;
            txtClick.Text = model.Click.ToString();

            string[] imgurl = model.ImgUrl.Split(' ');
            //for (int i = 0; i < imgurl.Length; i++)
            //{
            //    TextBox txtImgUrl = (TextBox)form1.FindControl("txtImgUrl" + i);
            //    txtImgUrl.Text = imgurl[i].ToString();
            //}

            switch (imgurl.Length)
            {
                case 1: this.txtImgUrl0.Text = imgurl[0];break;
                case 2: { this.txtImgUrl0.Text = imgurl[0]; this.txtImgUrl1.Text = imgurl[1]; } break;
                case 3: { this.txtImgUrl0.Text = imgurl[0]; this.txtImgUrl1.Text = imgurl[1]; this.txtImgUrl2.Text = imgurl[2]; } break;
                case 4: { this.txtImgUrl0.Text = imgurl[0]; this.txtImgUrl1.Text = imgurl[1]; this.txtImgUrl2.Text = imgurl[2]; this.txtImgUrl3.Text = imgurl[3]; } break;
                default: break;
            }

            if (model.IsMsg == 1)
            {
                cblItem.Items[0].Selected = true;
            }
            if (model.IsTop == 1)
            {
                cblItem.Items[1].Selected = true;
            }
            if (model.IsRed == 1)
            {
                cblItem.Items[2].Selected = true;
            }
            if (model.IsHot == 1)
            {
                cblItem.Items[3].Selected = true;
            }
            if (model.IsSlide == 1)
            {
                cblItem.Items[4].Selected = true;
            }
            if (model.IsLock == 1)
            {
                cblItem.Items[5].Selected = true;
            }
        }

        //保存
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DtCms.BLL.Products bll = new DtCms.BLL.Products();
            DtCms.Model.Products model = bll.GetModel(this.Id);

            model.Title = txtTitle.Text.Trim();
            model.Guige = txtGuige.Text.Trim();
            model.Xinghao = txtXinghao.Text.Trim();
            model.Price = decimal.Parse(txtPrice.Text.Trim());
            model.ClassId = int.Parse(ddlClassId.SelectedValue);
            //model.ImgUrl = txtImgUrl0.Text.Trim();
            model.Content = FCKeditor.Value;
            model.Click = int.Parse(txtClick.Text.Trim());

            string imgs = "";
            if (txtImgUrl0.Text.Trim() != "")
            {
                imgs += txtImgUrl0.Text.Trim() + " ";
            }
            if (txtImgUrl1.Text.Trim() != "")
            {
                imgs += txtImgUrl1.Text.Trim() + " ";
            }
            if (txtImgUrl2.Text.Trim() != "")
            {
                imgs += txtImgUrl2.Text.Trim() + " ";
            }
            if (txtImgUrl3.Text.Trim() != "")
            {
                imgs += txtImgUrl3.Text.Trim() + " ";
            }
            if (imgs.EndsWith(" "))
            {
                imgs = imgs.Substring(0, imgs.Length - 1);
            }
            model.ImgUrl = imgs;

            model.IsMsg = 0;
            model.IsTop = 0;
            model.IsRed = 0;
            model.IsHot = 0;
            model.IsSlide = 0;
            model.IsLock = 0;
            if (cblItem.Items[0].Selected == true)
            {
                model.IsMsg = 1;
            }
            if (cblItem.Items[1].Selected == true)
            {
                model.IsTop = 1;
            }
            if (cblItem.Items[2].Selected == true)
            {
                model.IsRed = 1;
            }
            if (cblItem.Items[3].Selected == true)
            {
                model.IsHot = 1;
            }
            if (cblItem.Items[4].Selected == true)
            {
                model.IsSlide = 1;
            }
            if (cblItem.Items[5].Selected == true)
            {
                model.IsLock = 1;
            }
            bll.Update(model);
            JscriptPrint("产品编辑成功啦！", "List.aspx", "Success");
        }
    }
}
