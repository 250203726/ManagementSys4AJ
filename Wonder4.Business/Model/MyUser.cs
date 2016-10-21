using System;
namespace N_Bers.Business.Model
{
    /// <summary>
    /// MyUser:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    public partial class MyUser
    {
        public MyUser()
        { }
        #region Model
        private int _id;
        private string _account;
        private string _nickname;
        private string _password;
        private string _bind_account;
        private int? _last_login_time = 0;
        private string _last_login_ip = "NULL";
        private int? _login_count = 0;
        private string _verify = "NULL";
        private string _email;
        private string _remark;
        private int _create_time;
        private int _update_time;
        private int? _status = 0;
        private int? _type_id = 0;
        private string _info;
        private string _phone;
        /// <summary>
        /// 
        /// </summary>
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string account
        {
            set { _account = value; }
            get { return _account; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string nickname
        {
            set { _nickname = value; }
            get { return _nickname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string password
        {
            set { _password = value; }
            get { return _password; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string bind_account
        {
            set { _bind_account = value; }
            get { return _bind_account; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? last_login_time
        {
            set { _last_login_time = value; }
            get { return _last_login_time; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string last_login_ip
        {
            set { _last_login_ip = value; }
            get { return _last_login_ip; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? login_count
        {
            set { _login_count = value; }
            get { return _login_count; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string verify
        {
            set { _verify = value; }
            get { return _verify; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string email
        {
            set { _email = value; }
            get { return _email; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string remark
        {
            set { _remark = value; }
            get { return _remark; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int create_time
        {
            set { _create_time = value; }
            get { return _create_time; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int update_time
        {
            set { _update_time = value; }
            get { return _update_time; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? status
        {
            set { _status = value; }
            get { return _status; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? type_id
        {
            set { _type_id = value; }
            get { return _type_id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string info
        {
            set { _info = value; }
            get { return _info; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string phone
        {
            set { _phone = value; }
            get { return _phone; }
        }
        #endregion Model

    }
}

