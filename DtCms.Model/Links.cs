using System;
namespace DtCms.Model
{
	/// <summary>
	/// ��������ʵ����Links
	/// </summary>
	[Serializable]
	public class Links
	{
		public Links()
		{}
		#region Model
		private int _id;
		private string _title;
		private string _username;
		private string _usertel;
		private string _usermail;
		private string _weburl;
		private string _imgurl;
        private int _isimage = 0;
        private int _isred = 0;
        private int _islock = 0;
        private int _sortid = 0;
        private DateTime _addtime = DateTime.Now;
		/// <summary>
		/// ����ID
		/// </summary>
		public int Id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// ��վ����
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ��ϵ������
		/// </summary>
		public string UserName
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// ��ϵ�绰
		/// </summary>
		public string UserTel
		{
			set{ _usertel=value;}
			get{return _usertel;}
		}
		/// <summary>
		/// ��ϵ����
		/// </summary>
		public string UserMail
		{
			set{ _usermail=value;}
			get{return _usermail;}
		}
		/// <summary>
		/// ��ַ
		/// </summary>
		public string WebUrl
		{
			set{ _weburl=value;}
			get{return _weburl;}
		}
		/// <summary>
		/// ͼƬ��ַ
		/// </summary>
		public string ImgUrl
		{
			set{ _imgurl=value;}
			get{return _imgurl;}
		}
		/// <summary>
		/// �Ƿ�ͼƬ
		/// </summary>
		public int IsImage
		{
			set{ _isimage=value;}
			get{return _isimage;}
		}
        /// <summary>
        /// �Ƽ�����ҳ
        /// </summary>
        public int IsRed
        {
            set { _isred = value; }
            get { return _isred; }
        }
		/// <summary>
		/// �Ƿ���ʾ
		/// </summary>
		public int IsLock
		{
			set{ _islock=value;}
			get{return _islock;}
		}
		/// <summary>
		/// ����ţ�ԽСԽ��ǰ
		/// </summary>
		public int SortId
		{
			set{ _sortid=value;}
			get{return _sortid;}
		}
		/// <summary>
		/// ���ʱ��
		/// </summary>
		public DateTime AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		#endregion Model

	}
}

