using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using DtCms.Common;

namespace DtCms.ActionLabel
{
    public class Contents
    {
        public static string ViewTxtList(int top, int txtNum, string strWhere, string orderby, string txtUrl)
        {
            DtCms.BLL.Contents bll = new DtCms.BLL.Contents();
            StringBuilder strTxt = new StringBuilder();
            DataSet ds = bll.GetList(top, strWhere, orderby);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DataRow dr = ds.Tables[0].Rows[i];
                    strTxt.Append("<li><a href=\"" + txtUrl + "?id=" + dr["Id"].ToString() + "\" title=\"" + dr["Title"].ToString() + "\">" + StringPlus.CutString(dr["Title"].ToString(), txtNum) + "</a></li>\n");
                }
            }

            return strTxt.ToString();
        }
    }
}
