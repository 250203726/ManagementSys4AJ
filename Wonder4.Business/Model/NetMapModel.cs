using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    [DataEntity(Alias = "nbers_netmap")]
   public class NetMapModel:BaseEntity
    {
        public NetMapModel() { }
        /// <summary>
		/// node_guid
        /// </summary>		
		private Guid _node_guid;
        [DataColumn(Alias = "node_guid",PrimaryKey =true)]
        public Guid node_guid
        {
            get {
                if (Guid.Empty==_node_guid)
                {
                    return Guid.Empty;
                }
                return _node_guid; }
            set { _node_guid = value; }
        }
        /// <summary>
        /// node_name
        /// </summary>		
        private string _node_name;
        [DataColumn(Alias = "node_name")]
        public string name
        {
            get { return _node_name; }
            set { _node_name = value; }
        }
        /// <summary>
        /// node_name
        /// </summary>		
        private string _station_name;
        [DataColumn(Alias = "station_name")]
        public string station_name
        {
            get { return _station_name; }
            set { _station_name = value; }
        }
        /// <summary>
        /// auditor
        /// </summary>		
        private string _auditor;
        [DataColumn(Alias = "auditor")]
        public string auditor
        {
            get { return _auditor; }
            set { _auditor = value; }
        }
        /// <summary>
        /// parentguid
        /// </summary>		
        private Guid _parentguid;
        [DataColumn(Alias = "parentguid")]
        public Guid parentguid
        {
            get { return _parentguid; }
            set { _parentguid = value; }
        }
        /// <summary>
        /// remark
        /// </summary>		
        private string _remark;
        [DataColumn(Alias = "remark")]
        public string remark
        {
            get { return _remark; }
            set { _remark = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        private int _sort_order;
        [DataColumn(Alias = "sort_order")]
        public int sort_order
        {
            get { return _sort_order; }
            set { _sort_order = value; }
        }
    }
}
