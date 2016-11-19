using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace N_Bers.Business.Model
{
   public class NetMapInfo
    {
        public Guid guid { get; set; }
        public string name { get; set; }

        public string value { get; set; }
        public List<NetMapInfo> children { get; set; }
    }
}
