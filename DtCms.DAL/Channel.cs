using System;
using System.Data;
using System.Text;
using System.Data.OleDb;
using DtCms.DBUtility;//�����������
namespace DtCms.DAL
{
	/// <summary>
	/// ���ݷ�����Channel��
	/// </summary>
	public class Channel
	{
		public Channel()
		{}
		#region  ��Ա����
        /// <summary>
        /// ȡ�����²����ID
        /// </summary>
        public int GetMaxID(string FieldName)
        {
            return DbHelperOleDb.GetMaxID(FieldName, "Channel");
        }

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int Id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Channel");
			strSql.Append(" where Id=@Id ");
			OleDbParameter[] parameters = {
					new OleDbParameter("@Id", OleDbType.Integer,4)};
			parameters[0].Value = Id;

			return DbHelperOleDb.Exists(strSql.ToString(),parameters);
		}

        /// <summary>
        /// ������Ŀ����
        /// </summary>
        /// <param name="classId"></param>
        /// <returns></returns>
        public string GetChannelTitle(int classId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 Title from Channel");
            strSql.Append(" where Id=" + classId);
            return Convert.ToString(DbHelperOleDb.GetSingle(strSql.ToString()));
        }


		/// <summary>
		/// ����һ������
		/// </summary>
		public void Add(DtCms.Model.Channel model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Channel(");
            strSql.Append("Title,ParentId,ClassList,ClassLayer,ClassOrder,PageUrl,KindId)");
			strSql.Append(" values (");
            strSql.Append("@Title,@ParentId,@ClassList,@ClassLayer,@ClassOrder,@PageUrl,@KindId)");
			OleDbParameter[] parameters = {
					new OleDbParameter("@Title", OleDbType.VarWChar,50),
					new OleDbParameter("@ParentId", OleDbType.Integer,4),
					new OleDbParameter("@ClassList", OleDbType.VarWChar,300),
					new OleDbParameter("@ClassLayer", OleDbType.Integer,4),
					new OleDbParameter("@ClassOrder", OleDbType.Integer,4),
                    new OleDbParameter("@PageUrl",OleDbType.VarWChar,250),
					new OleDbParameter("@KindId", OleDbType.Integer,4)};
			parameters[0].Value = model.Title;
			parameters[1].Value = model.ParentId;
			parameters[2].Value = model.ClassList;
			parameters[3].Value = model.ClassLayer;
            parameters[4].Value = model.ClassOrder;
            parameters[5].Value = model.PageUrl;
			parameters[6].Value = model.KindId;

            DbHelperOleDb.ExecuteSql(strSql.ToString(), parameters);
		}
		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(DtCms.Model.Channel model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Channel set ");
			strSql.Append("Title=@Title,");
			strSql.Append("ParentId=@ParentId,");
			strSql.Append("ClassList=@ClassList,");
			strSql.Append("ClassLayer=@ClassLayer,");
			strSql.Append("ClassOrder=@ClassOrder,");
            strSql.Append("PageUrl=@PageUrl,");
			strSql.Append("KindId=@KindId");
			strSql.Append(" where Id=@Id ");
			OleDbParameter[] parameters = {
					new OleDbParameter("@Title", OleDbType.VarWChar,50),
					new OleDbParameter("@ParentId", OleDbType.Integer,4),
					new OleDbParameter("@ClassList", OleDbType.VarWChar,300),
					new OleDbParameter("@ClassLayer", OleDbType.Integer,4),
					new OleDbParameter("@ClassOrder", OleDbType.Integer,4),
                    new OleDbParameter("@PageUrl", OleDbType.VarWChar,250),
					new OleDbParameter("@KindId", OleDbType.Integer,4),
                    new OleDbParameter("@Id", OleDbType.Integer,4)};
			parameters[0].Value = model.Title;
			parameters[1].Value = model.ParentId;
			parameters[2].Value = model.ClassList;
			parameters[3].Value = model.ClassLayer;
			parameters[4].Value = model.ClassOrder;
            parameters[5].Value = model.PageUrl;
			parameters[6].Value = model.KindId;
            parameters[7].Value = model.Id;

			DbHelperOleDb.ExecuteSql(strSql.ToString(),parameters);
		}

		/// <summary>
		/// ɾ��������������·�������
		/// </summary>
		public void Delete(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from Channel ");
            strSql.Append(" where ClassList like '%,"+Id+",%' ");

			DbHelperOleDb.Query(strSql.ToString());
		}


		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public DtCms.Model.Channel GetModel(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 Id,Title,ParentId,ClassList,ClassLayer,ClassOrder,PageUrl,KindId from Channel ");
			strSql.Append(" where Id=@Id ");
			OleDbParameter[] parameters = {
					new OleDbParameter("@Id", OleDbType.Integer,4)};
			parameters[0].Value = Id;

			DtCms.Model.Channel model=new DtCms.Model.Channel();
			DataSet ds=DbHelperOleDb.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["Id"].ToString()!="")
				{
					model.Id=int.Parse(ds.Tables[0].Rows[0]["Id"].ToString());
				}
				model.Title=ds.Tables[0].Rows[0]["Title"].ToString();
				if(ds.Tables[0].Rows[0]["ParentId"].ToString()!="")
				{
					model.ParentId=int.Parse(ds.Tables[0].Rows[0]["ParentId"].ToString());
				}
				model.ClassList=ds.Tables[0].Rows[0]["ClassList"].ToString();
				if(ds.Tables[0].Rows[0]["ClassLayer"].ToString()!="")
				{
					model.ClassLayer=int.Parse(ds.Tables[0].Rows[0]["ClassLayer"].ToString());
				}
				if(ds.Tables[0].Rows[0]["ClassOrder"].ToString()!="")
				{
					model.ClassOrder=int.Parse(ds.Tables[0].Rows[0]["ClassOrder"].ToString());
				}
                model.PageUrl = ds.Tables[0].Rows[0]["PageUrl"].ToString();
				if(ds.Tables[0].Rows[0]["KindId"].ToString()!="")
				{
					model.KindId=int.Parse(ds.Tables[0].Rows[0]["KindId"].ToString());
				}
				return model;
			}
			else
			{
				return null;
			}
		}

        /// <summary>
        /// ȡ��������Ŀ�б�
        /// </summary>
        /// <param name="PId">��ID</param>
        /// <param name="KId">����ID</param>
        /// <returns></returns>
        public DataTable GetList(int PId, int KId)
        {
            DataTable data = new DataTable();
            //������
            DataColumn Id = new DataColumn("Id", typeof(int));
            DataColumn Title = new DataColumn("Title", typeof(string));
            DataColumn ParentId = new DataColumn("ParentId", typeof(int));
            DataColumn ClassList = new DataColumn("ClassList", typeof(string));
            DataColumn ClassLayer = new DataColumn("ClassLayer", typeof(int));
            DataColumn ClassOrder = new DataColumn("ClassOrder", typeof(int));
            DataColumn PageUrl = new DataColumn("PageUrl", typeof(string));
            DataColumn KindId = new DataColumn("KindId", typeof(int));
            //�����
            data.Columns.Add(Id);
            data.Columns.Add(Title);
            data.Columns.Add(ParentId);
            data.Columns.Add(ClassList);
            data.Columns.Add(ClassLayer);
            data.Columns.Add(ClassOrder);
            data.Columns.Add(PageUrl);
            data.Columns.Add(KindId);
            //���õ�����ϳ�DAGATABLE
            GetChannelChild(data, PId, KId);
            return data;
        }

        /// <summary>
        /// ȡ��������Ŀ�б�
        /// </summary>
        /// <param name="PId">��ID</param>
        /// <param name="KId">����ID</param>
        /// <returns></returns>
        public DataTable GetList2(int PId, int KId)
        {
            DataTable data = new DataTable();
            //������
            DataColumn Id = new DataColumn("Id", typeof(int));
            DataColumn Title = new DataColumn("Title", typeof(string));
            DataColumn ParentId = new DataColumn("ParentId", typeof(int));
            DataColumn ClassList = new DataColumn("ClassList", typeof(string));
            DataColumn ClassLayer = new DataColumn("ClassLayer", typeof(int));
            DataColumn ClassOrder = new DataColumn("ClassOrder", typeof(int));
            DataColumn PageUrl = new DataColumn("PageUrl", typeof(string));
            DataColumn KindId = new DataColumn("KindId", typeof(int));
            //�����
            data.Columns.Add(Id);
            data.Columns.Add(Title);
            data.Columns.Add(ParentId);
            data.Columns.Add(ClassList);
            data.Columns.Add(ClassLayer);
            data.Columns.Add(ClassOrder);
            data.Columns.Add(PageUrl);
            data.Columns.Add(KindId);
            //���õ�����ϳ�DAGATABLE
            GetChannelChild2(data, PId, KId);
            return data;
        }

        /// <summary>
        /// ȡ�ø���Ŀ�������¼���Ŀ�б�
        /// </summary>
        /// <param name="data">DATATABLE��</param>
        /// <param name="PId">����ĿID</param>
        /// <param name="KId">����ID</param>
        private void GetChannelChild(DataTable data, int PId, int KId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select Id,Title,ParentId,ClassList,ClassLayer,ClassOrder,PageUrl,KindId from Channel");
            strSql.Append(" where ParentId=" + PId + " and KindId=" + KId + " order by ClassOrder asc,Id desc");
            DataSet ds = DbHelperOleDb.Query(strSql.ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DataRow dr = ds.Tables[0].Rows[i];
                    //���һ������
                    DataRow row = data.NewRow();
                    row[0] = int.Parse(dr["Id"].ToString());
                    row[1] = dr["Title"].ToString();
                    row[2] = int.Parse(dr["ParentId"].ToString());
                    row[3] = dr["ClassList"].ToString();
                    row[4] = int.Parse(dr["ClassLayer"].ToString());
                    row[5] = int.Parse(dr["ClassOrder"].ToString());
                    row[6] = dr["PageUrl"].ToString();
                    row[7] = int.Parse(dr["KindId"].ToString());
                    data.Rows.Add(row);
                    //�����������
                    this.GetChannelChild(data, int.Parse(dr["Id"].ToString()), KId);
                }
            }
        }

        /// <summary>
        /// ȡ�ø���Ŀ�������¼���Ŀ�б�
        /// </summary>
        /// <param name="data">DATATABLE��</param>
        /// <param name="PId">����ĿID</param>
        /// <param name="KId">����ID</param>
        private void GetChannelChild2(DataTable data, int PId, int KId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select Id,Title,ParentId,ClassList,ClassLayer,ClassOrder,PageUrl,KindId from Channel");
            strSql.Append(" where ParentId=" + PId + " and KindId=" + KId + " order by ClassOrder asc,Id desc");
            DataSet ds = DbHelperOleDb.Query(strSql.ToString());
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DataRow dr = ds.Tables[0].Rows[i];
                    //���һ������
                    DataRow row = data.NewRow();
                    row[0] = int.Parse(dr["Id"].ToString());
                    row[1] = dr["Title"].ToString();
                    row[2] = int.Parse(dr["ParentId"].ToString());
                    row[3] = dr["ClassList"].ToString();
                    row[4] = int.Parse(dr["ClassLayer"].ToString());
                    row[5] = int.Parse(dr["ClassOrder"].ToString());
                    row[6] = dr["PageUrl"].ToString();
                    row[7] = int.Parse(dr["KindId"].ToString());
                    data.Rows.Add(row);
                    //�����������
                    //this.GetChannelChild(data, int.Parse(dr["Id"].ToString()), KId);
                }
            }
        }

        /// <summary>
        /// ȡ�ø���Ŀ�µ���������Ŀ��ID
        /// </summary>
        /// <param name="classId"></param>
        /// <returns></returns>
        public DataSet GetChannelListByClassId(int classId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 ClassList,ClassLayer from Channel");
            strSql.Append(" where Id=" + classId + " ");
            return DbHelperOleDb.Query(strSql.ToString());
        }

        /// <summary>
        /// ���ǰ��������
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" Id,Title,ParentId,ClassList,ClassLayer,ClassOrder,PageUrl,KindId ");
            strSql.Append(" from Channel ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DbHelperOleDb.Query(strSql.ToString());
        }

		#endregion  ��Ա����
	}
}

