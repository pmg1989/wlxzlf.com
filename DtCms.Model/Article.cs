using System;
namespace DtCms.Model
{
	/// <summary>
	/// ʵ����Article ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	[Serializable]
	public class Article
	{
		public Article()
		{}
		#region Model
		private int _id;
		private string _title;
		private string _author;
		private string _form;
		private string _keyword;
		private string _zhaiyao;
		private int _classid;
		private string _imgurl;
		private string _daodu;
		private string _content;
        private int _click = 0;
        private int _ismsg = 0;
        private int _istop = 0;
        private int _isred = 0;
        private int _ishot = 0;
        private int _isslide = 0;
        private int _islock = 0;
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
		/// ���±���
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ����
		/// </summary>
		public string Author
		{
			set{ _author=value;}
			get{return _author;}
		}
		/// <summary>
		/// ��Դ
		/// </summary>
		public string Form
		{
			set{ _form=value;}
			get{return _form;}
		}
		/// <summary>
		/// �ؽ���
		/// </summary>
		public string Keyword
		{
			set{ _keyword=value;}
			get{return _keyword;}
		}
		/// <summary>
		/// ժҪ
		/// </summary>
		public string Zhaiyao
		{
			set{ _zhaiyao=value;}
			get{return _zhaiyao;}
		}
		/// <summary>
		/// �������
		/// </summary>
		public int ClassId
		{
			set{ _classid=value;}
			get{return _classid;}
		}
		/// <summary>
		/// ����ͼƬ
		/// </summary>
		public string ImgUrl
		{
			set{ _imgurl=value;}
			get{return _imgurl;}
		}
		/// <summary>
		/// ���µ���
		/// </summary>
		public string Daodu
		{
			set{ _daodu=value;}
			get{return _daodu;}
		}
		/// <summary>
		/// ��ϸ����
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
		}
		/// <summary>
		/// �������
		/// </summary>
		public int Click
		{
			set{ _click=value;}
			get{return _click;}
		}
		/// <summary>
		/// �Ƿ���������
		/// </summary>
		public int IsMsg
		{
			set{ _ismsg=value;}
			get{return _ismsg;}
		}
		/// <summary>
		/// �Ƿ��ö�
		/// </summary>
		public int IsTop
		{
			set{ _istop=value;}
			get{return _istop;}
		}
		/// <summary>
		/// �Ƿ��Ƽ�
		/// </summary>
		public int IsRed
		{
			set{ _isred=value;}
			get{return _isred;}
		}
		/// <summary>
		/// �Ƿ�����
		/// </summary>
		public int IsHot
		{
			set{ _ishot=value;}
			get{return _ishot;}
		}
		/// <summary>
		/// �Ƿ�õ�Ƭ
		/// </summary>
		public int IsSlide
		{
			set{ _isslide=value;}
			get{return _isslide;}
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
		#endregion Model

	}
}

