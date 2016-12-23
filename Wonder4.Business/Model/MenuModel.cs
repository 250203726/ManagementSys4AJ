using System;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    /// <summary>
    /// MyMemu:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    [DataEntity(Alias = "nbers_node")]
    public partial class MenuModel: NbersBaseModel
    {
        public MenuModel()
        { }
        #region Model
	
		private long _version;
        private int _parentid;
		private string _name;
		private string _url;
		private string _params;
        private string _icon;
        private int _levels;
        private int _sortcode;
        private string _moduleid;
        private string _enable;
        private string _group_id;

		[DataColumn(Alias = "version",IsNullable=true)]
        public long version
        {
            get{ return _version; }
            set{ _version = value; }
        }

        [DataColumn(Alias = "parentId", IsNullable = false,DefaultValue="0")]
        public int parentId
        {
            get{ return _parentid; }
            set{ _parentid = value; }
        }        
		

		[DataColumn(Alias = "name",IsNullable=false)]
        public string name
        {
            get{ return _name; }
            set{ _name = value; }
        }        
	

		[DataColumn(Alias = "url",IsNullable=true)]
        public string url
        {
            get{ return _url; }
            set{ _url = value; }
        }        	

		[DataColumn(Alias = "params",IsNullable=true,DefaultValue ="")]
        public string paramss
        {
            get{ return _params; }
            set{ _params = value; }
        }        
	
		[DataColumn(Alias = "icon",IsNullable=true)]
        public string icon
        {
            get{ return _icon; }
            set{ _icon = value; }
        }        
	
		[DataColumn(Alias = "levels",DefaultValue="0",IsNullable=true)]
        public int levels
        {
            get{ return _levels; }
            set{ _levels = value; }
        }        
	
		[DataColumn(Alias = "sortCode",IsNullable=true)]
        public int sortCode
        {
            get{ return _sortcode; }
            set{ _sortcode = value; }
        }        

		[DataColumn(Alias = "moduleId",IsNullable=true)]
        public string moduleId
        {
            get{ return _moduleid; }
            set{ _moduleid = value; }
        }        
	
		[DataColumn(Alias = "enable",IsNullable=true)]
        public string enable
        {
            get{ return _enable; }
            set{ _enable = value; }
        }        
	
		[DataColumn(Alias = "group_id",DefaultValue="0",IsNullable=true)]
        public string group_id
        {
            get{ return _group_id; }
            set{ _group_id = value; }
        }        
        #endregion Model

    }
}

