using System;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    /// <summary>
    /// MyUser:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    [DataEntity(Alias = "nbers_user")]
    public partial class UserModel:NbersBaseModel
    {
        public UserModel()
        { }
        #region Model
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
        private int _unit_id;

        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "account",IsNullable =false)]
        public string account
        {
            set { _account = value; }
            get { return _account; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "nickname",IsNullable =false)]
        public string nickname
        {
            set { _nickname = value; }
            get { return _nickname; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "password",IsNullable =false)]
        public string password
        {
            set { _password = value; }
            get { return _password; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "bind_account",IsNullable =false)]
        public string bind_account
        {
            set { _bind_account = value; }
            get { return _bind_account; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "last_login_time")]
        public int? last_login_time
        {
            set { _last_login_time = value; }
            get { return _last_login_time; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "last_login_ip")]
        public string last_login_ip
        {
            set { _last_login_ip = value; }
            get { return _last_login_ip; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "login_count")]
        public int? login_count
        {
            set { _login_count = value; }
            get { return _login_count; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "verify")]
        public string verify
        {
            set { _verify = value; }
            get { return _verify; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "email",IsNullable =false)]
        public string email
        {
            set { _email = value; }
            get { return _email; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "remark")]
        public string remark
        {
            set { _remark = value; }
            get { return _remark; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "create_time",DefaultValue = "GETDATE()")]
        public int create_time
        {
            set { _create_time = value; }
            get { return _create_time; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "update_time", DefaultValue = "GETDATE()")]
        public int update_time
        {
            set { _update_time = value; }
            get { return _update_time; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "status")]
        public int? status
        {
            set { _status = value; }
            get { return _status; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "type_id")]
        public int? type_id
        {
            set { _type_id = value; }
            get { return _type_id; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "info")]
        public string info
        {
            set { _info = value; }
            get { return _info; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "phone")]
        public string phone
        {
            set { _phone = value; }
            get { return _phone; }
        }
        [DataColumn(Alias = "unit_id")]
        public int unit_id
        {
            set { _unit_id = value; }
            get { return _unit_id; }
        }
        #endregion Model

    }
}

