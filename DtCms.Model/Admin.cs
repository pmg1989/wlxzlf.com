using System;
namespace DtCms.Model
{
	/// <summary>
	/// ʵ����Admin ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	[Serializable]
	public class Admin
	{
		public Admin()
		{}
		#region Model
		private int _id;
		private string _username;
		private string _userpwd;
		private string _readname;
		private string _useremail;
		private int _usertype;
		private string _userlevel;
		private int _islock;
		/// <summary>
		/// �������
		/// </summary>
		public int Id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// ��¼�ʺ�
		/// </summary>
		public string UserName
		{
			set{ _username=value;}
			get{return _username;}
		}
		/// <summary>
		/// ��¼����
		/// </summary>
		public string UserPwd
		{
			set{ _userpwd=value;}
			get{return _userpwd;}
		}
		/// <summary>
		/// ��ʵ����
		/// </summary>
		public string ReadName
		{
			set{ _readname=value;}
			get{return _readname;}
		}
		/// <summary>
		/// �����ʼ�
		/// </summary>
		public string UserEmail
		{
			set{ _useremail=value;}
			get{return _useremail;}
		}
		/// <summary>
		/// �û�����
		/// </summary>
		public int UserType
		{
			set{ _usertype=value;}
			get{return _usertype;}
		}
		/// <summary>
		/// �û�Ȩ��
		/// </summary>
		public string UserLevel
		{
			set{ _userlevel=value;}
			get{return _userlevel;}
		}
		/// <summary>
		/// �Ƿ�����
		/// </summary>
		public int IsLock
		{
			set{ _islock=value;}
			get{return _islock;}
		}
		#endregion Model

	}
}

