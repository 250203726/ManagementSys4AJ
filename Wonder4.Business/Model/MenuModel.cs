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
        private string _name;
        private string _title = "NULL";
        private int? _status = 0;
        private string _remark = "NULL";
        private string _sort = "NULL";
        private int _pid;
        private int _level;
        private int _type = 0;
        private int? _group_id = 0;

        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "name",IsNullable =false)]
        public string name
        {
            set { _name = value; }
            get { return _name; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "title")]
        public string title
        {
            set { _title = value; }
            get { return _title; }
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
        [DataColumn(Alias = "remark")]
        public string remark
        {
            set { _remark = value; }
            get { return _remark; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "sort")]
        public string sort
        {
            set { _sort = value; }
            get { return _sort; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "pid")]
        public int pid
        {
            set { _pid = value; }
            get { return _pid; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "level")]
        public int level
        {
            set { _level = value; }
            get { return _level; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "type")]
        public int type
        {
            set { _type = value; }
            get { return _type; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "group_id")]
        public int? group_id
        {
            set { _group_id = value; }
            get { return _group_id; }
        }
        #endregion Model

    }
}

