using System;
using System.Data;
using System.Collections.Generic;
using DtCms.Model;
namespace DtCms.BLL
{
	/// <summary>
	/// ҵ���߼���Channel ��ժҪ˵����
	/// </summary>
	public class Channel
	{
		private readonly DtCms.DAL.Channel dal=new DtCms.DAL.Channel();
		public Channel()
		{}
		#region  ��Ա����
        /// <summary>
        /// ȡ�����²����ID
        /// </summary>
        public int GetMaxID(string FieldName)
        {
            return dal.GetMaxID(FieldName);
        }

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int Id)
		{
			return dal.Exists(Id);
		}

        /// <summary>
        /// ������Ŀ����
        /// </summary>
        /// <param name="classId"></param>
        /// <returns></returns>
        public string GetChannelTitle(int classId)
        {
            return dal.GetChannelTitle(classId);
        }

		/// <summary>
		/// ����һ������
		/// </summary>
		public int Add(DtCms.Model.Channel model)
		{
			dal.Add(model);
            return dal.GetMaxID("Id");
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(DtCms.Model.Channel model)
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
		public DtCms.Model.Channel GetModel(int Id)
		{
			
			return dal.GetModel(Id);
		}

		/// <summary>
		/// ��������б�
		/// </summary>
        public DataTable GetList(int PId, int KId)
		{
            return dal.GetList(PId, KId);
		}

        /// <summary>
        /// ��������б�
        /// </summary>
        public DataTable GetList2(int PId, int KId)
        {
            return dal.GetList2(PId, KId);
        }

        /// <summary>
        /// ȡ�ø���Ŀ�µ���������Ŀ
        /// </summary>
        /// <param name="classId"></param>
        /// <returns></returns>
        public DataSet GetChannelListByClassId(int classId)
        {
            return dal.GetChannelListByClassId(classId);
        }

        /// <summary>
        /// ���ǰ��������
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(Top, strWhere, filedOrder);
        }

		#endregion  ��Ա����
	}
}

