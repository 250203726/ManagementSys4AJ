
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business
{
    public class TestDemo
    {
        public string getName()
        {            
            var x = CPQuery.From("select * from think_node").ToList<MenuModel>();
            return JsonExtensions.ToJson(x);
        }
    }
}
