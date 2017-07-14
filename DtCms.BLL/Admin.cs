using System;
using System.Data;
using System.Collections.Generic;
using DtCms.Model;
using DtCms.Common;
namespace DtCms.BLL
{
	/// <summary>
	/// ҵ���߼���Admin ��ժҪ˵����
	/// </summary>
	public class Admin
	{
		private readonly DtCms.DAL.Admin dal=new DtCms.DAL.Admin();
		public Admin()
		{}
		#region  ��Ա����

        /// <summary>
        /// ����¼�Ƿ�ɹ�
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="userPwd"></param>
        /// <returns></returns>
        public bool chkAdminLogin(string userName, string userPwd)
        {
            return dal.chkAdminLoign(userName, DESEncrypt.Encrypt(userPwd));
        }

        /// <summary>
        /// �����������
        /// </summary>
        public int GetCount(string strWhere)
        {
            return dal.GetCount(strWhere);
        }

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int Id)
		{
			return dal.Exists(Id);
		}
        public bool Exists(string UserName)
        {
            return dal.Exists(UserName);
        }

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Add(DtCms.Model.Admin model)
		{
			dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(DtCms.Model.Admin model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int Id)
		{
			
			dal.Delete(Id);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public DtCms.Model.Admin GetModel(int Id)
		{
			
			return dal.GetModel(Id);
		}

        /// <summary>
        /// �����û���ȡ��һ������
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public DtCms.Model.Admin GetModel(string userName)
        {
            return dal.GetModel(userName);
        }

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// ���ǰ��������
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<DtCms.Model.Admin> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		public List<DtCms.Model.Admin> DataTableToList(DataTable dt)
		{
			List<DtCms.Model.Admin> modelList = new List<DtCms.Model.Admin>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				DtCms.Model.Admin model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = new DtCms.Model.Admin();
					if(dt.Rows[n]["Id"].ToString()!="")
					{
						model.Id=int.Parse(dt.Rows[n]["Id"].ToString());
					}
					model.UserName=dt.Rows[n]["UserName"].ToString();
					model.UserPwd=dt.Rows[n]["UserPwd"].ToString();
					model.ReadName=dt.Rows[n]["ReadName"].ToString();
					model.UserEmail=dt.Rows[n]["UserEmail"].ToString();
					if(dt.Rows[n]["UserType"].ToString()!="")
					{
						model.UserType=int.Parse(dt.Rows[n]["UserType"].ToString());
					}
					model.UserLevel=dt.Rows[n]["UserLevel"].ToString();
					if(dt.Rows[n]["IsLock"].ToString()!="")
					{
						model.IsLock=int.Parse(dt.Rows[n]["IsLock"].ToString());
					}
					modelList.Add(model);
				}
			}
			return modelList;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  ��Ա����
	}
}

