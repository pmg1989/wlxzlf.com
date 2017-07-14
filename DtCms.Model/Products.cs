using System;
namespace DtCms.Model
{
	/// <summary>
	/// ��Ʒʵ����Products
	/// </summary>
	[Serializable]
	public class Products
	{
		public Products()
		{}
		#region Model
		private int _id;
		private string _title;
		private int _classid;
		private string _guige;
		private string _xinghao;
		private decimal _price;
		private string _imgurl;
		private string _content;
		private int _click;
		private int _ismsg;
		private int _istop;
		private int _isred;
		private int _ishot;
		private int _isslide;
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
		/// ��Ʒ����
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// ��������
		/// </summary>
		public int ClassId
		{
			set{ _classid=value;}
			get{return _classid;}
		}
		/// <summary>
		/// ��Ʒ���
		/// </summary>
		public string Guige
		{
			set{ _guige=value;}
			get{return _guige;}
		}
		/// <summary>
		/// ��Ʒ�ͺ�
		/// </summary>
		public string Xinghao
		{
			set{ _xinghao=value;}
			get{return _xinghao;}
		}
		/// <summary>
		/// ��Ʒ�۸�
		/// </summary>
		public decimal Price
		{
			set{ _price=value;}
			get{return _price;}
		}
		/// <summary>
		/// ��ƷͼƬ
		/// </summary>
		public string ImgUrl
		{
			set{ _imgurl=value;}
			get{return _imgurl;}
		}
		/// <summary>
		/// ��Ʒ��ϸ����
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

