using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DtCms.Web
{
    public partial class joindetail : DtCms.Web.UI.BasePage
    {
        public int proId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    if (!int.TryParse(Request.QueryString["id"].ToString(), out this.proId))
                    {
                        this.proId = 0;
                    }

                    addClick();//增加点击率
                    ProductDetailBound();
                }
            }
        }


        private void addClick()
        {
            DtCms.BLL.Products bllproduct = new DtCms.BLL.Products();
            bllproduct.UpdateField(proId, "Click = Click + 1");
        }


        private void ProductDetailBound()
        {
            DtCms.BLL.Products bllproduct = new BLL.Products();
            DtCms.Model.Products modproduct = bllproduct.GetModel(proId);
            this.lbtitle.Text = modproduct.Title;
            this.lbaddtime.Text = Convert.ToDateTime(modproduct.AddTime.ToString()).ToString("yyyy-MM-dd");
            this.lbClick.Text = modproduct.Click.ToString();
            //this.lbcontent.Text = DtCms.Common.StringPlus.DropHTML(modproduct.Content);
            this.lbcontent.Text = modproduct.Content;

            string[] imgs = modproduct.ImgUrl.Split(' ');
            DataTable table = new DataTable();
            table.Columns.Add("id", typeof(System.Int32));//类型是可以变换的，比如System.Int32,System.Double..  
            table.Columns.Add("ImgUrl", typeof(System.String));
            for (int i = 0; i < imgs.Length; i++)
            {
                DataRow dr = table.NewRow();
                dr["id"] = i;
                dr["ImgUrl"] = imgs[i];
                table.Rows.Add(dr);
            }
            this.Repeater1.DataSource = table.DefaultView;
            this.Repeater1.DataBind();
        }
    }
}