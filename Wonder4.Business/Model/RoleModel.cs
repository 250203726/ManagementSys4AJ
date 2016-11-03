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
		
		private int? _status=null;
		
        [DataColumn(Alias = "name", IsNullable = false)]
		public string name
		{
			set{ _name=value;}
			get{return _name;}
		}

        [DataColumn(Alias = "status")]
		public int? status
		{
			set{ _status=value;}
			get{return _status;}
		}
		
        #endregion Model
    }
}
