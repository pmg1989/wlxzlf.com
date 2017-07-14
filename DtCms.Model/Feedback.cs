using System;
namespace DtCms.Model
{
	/// <summary>
	/// ��������ʵ����Feedback
	/// </summary>
	[Serializable]
	public class Feedback
	{
		public Feedback()
		{}
		#region Model
		private int _id;
		private string _username;
		private string _usertel;
		private string _userqq;
		private string _title;
		private string _content;
        private int _islock = 0;
        private DateTime _addtime = DateTime.Now;
        private string _recontent = "";
        private DateTime _retime = DateTime.Now;
		/// <summary>
		/// ����ID
		/// </summary>
		public int Id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// �ǳƻ�����
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
		/// ��ϵQQ
		/// </summary>
		public string UserQQ
		{
			set{ _userqq=value;}
			get{return _userqq;}
		}
		/// <summary>
		/// ���Ա���
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ��������
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
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
		/// ����ʱ��
		/// </summary>
		public DateTime AddTime
		{
			set{ _addtime=value;}
			get{return _addtime;}
		}
		/// <summary>
		/// �ظ�����
		/// </summary>
		public string ReContent
		{
			set{ _recontent=value;}
			get{return _recontent;}
		}
		/// <summary>
		/// �ظ�ʱ��
		/// </summary>
		public DateTime ReTime
		{
			set{ _retime=value;}
			get{return _retime;}
		}
		#endregion Model

	}
}

