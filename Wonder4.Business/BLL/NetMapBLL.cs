using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.BLL
{
   public class NetMapBLL : IBusinessBLL<NetMapModel>
    {
        public int Delete(NetMapModel t)
        {
            throw new NotImplementedException();
        }

        public int DeleteByIDs(string ids)
        {
            throw new NotImplementedException();
        }

        public List<NetMapModel> DoQuery(string strfilter)
        {
            string queryStr = "SELECT * FROM (select ROW_NUMBER() OVER(ORDER BY node_guid) rid,* from nbers_netmap) tb where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1", strfilter);
            }
            return CPQuery.From(queryStr).ToList<NetMapModel>();
        }

        public NetMapModel GetModel(int id)
        {
            throw new NotImplementedException();
        }
        public NetMapModel GetModelByGuid(Guid guid)
        {
            var list = DoQuery("node_guid ='"+guid.ToString()+"'");
            return list.Count > 0 ? list[0] : null;
        }

        public int Insert(NetMapModel t)
        {
            throw new NotImplementedException();
        }

        public int Update(NetMapModel t)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// 找到当前结点的下一级孩子节点
        /// </summary>
        /// <param name="list"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        public List<NetMapInfo> GetChilds(List<NetMapModel> list, Guid parentid)
        {
            List<NetMapInfo> rtnList = new List<NetMapInfo>();

            var childs =
                from item in list
                where item.parentguid == parentid
                orderby item.sort_order
                select item;
            if (childs==null)
            {
                return null;
            }

            NetMapInfo tep = null;
            foreach (NetMapModel item in childs)
            {
                tep = new NetMapInfo();
                tep.guid = item.node_guid;
                tep.name = string.Concat(item.name,item.station_name, string.IsNullOrEmpty(item.auditor) ? "" : ":" + item.auditor);
                tep.value = item.auditor;
                tep.prefix = item.station_name;

                tep.children = GetChilds(list, tep.guid);

                rtnList.Add(tep);
            }


            return rtnList;
        }

        public NetMapInfo GenerateTree()
        {
            List<NetMapModel> allList = DoQuery("1=1 ORDER BY parentguid,sort_order");
            var rootNode =
               (from item in allList 
                where item.parentguid ==Guid.Empty
                select item).FirstOrDefault<NetMapModel>();

            NetMapInfo tree_data = new NetMapInfo();

            tree_data.name = string.Concat(rootNode.name,  rootNode.station_name, string.IsNullOrEmpty(rootNode.auditor) ? "" : ":" + rootNode.auditor); ;
            tree_data.guid = rootNode.node_guid;
            tree_data.value = rootNode.auditor;
            tree_data.prefix = rootNode.station_name;
            tree_data.children = GetChilds(allList, tree_data.guid);

            return tree_data;
        }

    }
}
