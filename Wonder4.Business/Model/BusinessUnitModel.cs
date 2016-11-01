using System;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    /// <summary>
    /// MyBusinessUnit:实体类(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    [Serializable]
    [DataEntity(Alias = "nbers_businessunit")]
    public partial class BusinessUnitModel:NbersBaseModel
    {
        public BusinessUnitModel()
        { }
        #region Model
        private string _unit_name;
        private string _unit_fullname;
        private int? _pid;
        private int? _createby;
        private DateTime? _createon;
        private int _unit_type;
        private string _child_type;
        private string _remark;
        private string _unit_duty;
        private string _unit_figure;

        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "unit_name",IsNullable =false)]
        public string unit_name
        {
            set { _unit_name = value; }
            get { return _unit_name; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "unit_fullname",IsNullable =true)]
        public string unit_fullname
        {
            set { _unit_fullname = value; }
            get { return _unit_fullname; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "pid",IsNullable =false)]
        public int? pid
        {
            set { _pid = value; }
            get { return _pid; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "createby",IsNullable =false)]
        public int? createby
        {
            set { _createby = value; }
            get { return _createby; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "createon",IsNullable =false)]
        public DateTime? createon
        {
            set { _createon = value; }
            get { return _createon; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "unit_type", IsNullable = true)]
        public int unit_type
        {
            set { _unit_type = value; }
            get { return _unit_type; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "child_type", IsNullable = true)]
        public string child_type
        {
            set { _child_type = value; }
            get { return _child_type; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "unit_duty", IsNullable = true)]
        public string unit_duty
        {
            set { _unit_duty = value; }
            get { return _unit_duty; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "unit_figure", IsNullable = true)]
        public string unit_figure
        {
            set { _unit_figure = value; }
            get { return _unit_figure; }
        }
        /// <summary>
        /// 
        /// </summary>
        [DataColumn(Alias = "remark",IsNullable =true)]
        public string remark
        {
            set { _remark = value; }
            get { return _remark; }
        }
        #endregion Model

    }
}

