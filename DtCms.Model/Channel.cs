using System;
namespace DtCms.Model
{
	/// <summary>
	/// ʵ����Channel ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	[Serializable]
	public class Channel
	{
		public Channel()
		{}
		#region Model
		private int _id;
		private string _title;
		private int _parentid;
		private string _classlist;
		private int _classlayer;
		private int _classorder;
        private string _pageurl;
		private int _kindid;
		/// <summary>
		/// ����ID
		/// </summary>
		public int Id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// �������
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ����ID
		/// </summary>
		public int ParentId
		{
			set{ _parentid=value;}
			get{return _parentid;}
		}
		/// <summary>
		/// ���ID�б�
		/// </summary>
		public string ClassList
		{
			set{ _classlist=value;}
			get{return _classlist;}
		}
		/// <summary>
		/// ������
		/// </summary>
		public int ClassLayer
		{
			set{ _classlayer=value;}
			get{return _classlayer;}
		}
		/// <summary>
		/// �������
		/// </summary>
		public int ClassOrder
		{
			set{ _classorder=value;}
			get{return _classorder;}
		}
        /// <summary>
        /// ҳ�浼��
        /// </summary>
        public string PageUrl
        {
            set { _pageurl = value; }
            get { return _pageurl; }
        }
		/// <summary>
		/// �������
		/// </summary>
		public int KindId
		{
			set{ _kindid=value;}
			get{return _kindid;}
		}
		#endregion Model

	}
}

