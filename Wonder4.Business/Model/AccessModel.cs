using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    /// <summary>
    /// AccessModel实体类
    /// </summary>
    [Serializable]
    [DataEntity(Alias = "nbers_access")]
    public class AccessModel : NbersBaseModel
    {

        /// <summary>
        /// role_id
        /// </summary>		
        private int _role_id;
        [DataColumn(Alias = "role_id")]
        public int role_id
        {
            get { return _role_id; }
            set { _role_id = value; }
        }
        /// <summary>
        /// node_id
        /// </summary>		
        private int _node_id;
        [DataColumn(Alias = "node_id")]
        public int node_id
        {
            get { return _node_id; }
            set { _node_id = value; }
        }

        #region 后面的字段都用不到
        /// <summary>
        /// level
        /// </summary>		
        private int _level;
        [DataColumn(Alias = "level")]
        public int level
        {
            get { return _level; }
            set { _level = value; }
        }
        /// <summary>
        /// pid
        /// </summary>		
        private int _pid;
        [DataColumn(Alias = "pid")]
        public int pid
        {
            get { return _pid; }
            set { _pid = value; }
        }
        /// <summary>
        /// module
        /// </summary>		
        private string _module;
        [DataColumn(Alias = "module")]
        public string module
        {
            get { return _module; }
            set { _module = value; }
        }
        #endregion
    }
}
