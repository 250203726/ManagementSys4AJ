using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    /// <summary>
    /// role_user实体类
    /// </summary>
    [Serializable]
    [DataEntity(Alias="nbers_role_user")]
    public class RoleUserModel : NbersBaseModel
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
        /// user_id
        /// </summary>		
        private int _user_id;
        [DataColumn(Alias = "user_id")]
        public int user_id
        {
            get { return _user_id; }
            set { _user_id = value; }
        }        
    }
}
