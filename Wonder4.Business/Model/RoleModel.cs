using System;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    /// <summary>
    /// role:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    [DataEntity(Alias = "nbers_role")]
    public partial class RoleModel:NbersBaseModel
    {
        public RoleModel()
		{}
		#region Model
		private string _name;
		private int? _pid=null;
		private int? _status=null;
		private string _remark= "NULL";
		private string _ename= "NULL";
		private int _create_time;
		private int _update_time;
		
        [DataColumn(Alias = "name", IsNullable = false)]
		public string name
		{
			set{ _name=value;}
			get{return _name;}
		}

        [DataColumn(Alias = "pid")]
		public int? pid
		{
			set{ _pid=value;}
			get{return _pid;}
		}

        [DataColumn(Alias = "status")]
		public int? status
		{
			set{ _status=value;}
			get{return _status;}
		}

        [DataColumn(Alias = "remark")]
		public string remark
		{
			set{ _remark=value;}
			get{return _remark;}
		}

        [DataColumn(Alias = "ename")]
		public string ename
		{
			set{ _ename=value;}
			get{return _ename;}
		}

        [DataColumn(Alias = "create_time", IsNullable=false)]
		public int create_time
		{
			set{ _create_time=value;}
			get{return _create_time;}
		}

        [DataColumn(Alias = "update_time", IsNullable = false)]
		public int update_time
		{
			set{ _update_time=value;}
			get{return _update_time;}
		}
		#endregion Model
    }
}
