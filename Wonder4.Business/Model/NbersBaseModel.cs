using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.Model
{
    /// <summary>
    /// 支持orm实体类的insert update delete
    /// </summary>
    public class NbersBaseModel:BaseEntity
    {
        private int _id;
        [DataColumn(Alias = "id", PrimaryKey = true, Identity = true)]
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }
    }
}
