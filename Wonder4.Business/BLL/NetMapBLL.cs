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

        public string GenerateTree4Dom()
        {
            List<NetMapModel> allList = DoQuery("1=1 ORDER BY parentguid,sort_order");
            var rootNode =
               (from item in allList
                where item.parentguid == Guid.Empty
                select item).FirstOrDefault<NetMapModel>();

            NetMapInfo tree_data = new NetMapInfo();
            string ul_tpl_r = "</ul>";
            string li_tpl_l = "<li class='node_hierarchy_@name'>";
            string li_tpl_r = "</li>";
            StringBuilder strDom = new StringBuilder("<ul  id='org' style='display: none'>");

            // strDom = strDom.Replace("@content",li_tpl.Replace("@name", string.Concat(rootNode.name, rootNode.station_name, string.IsNullOrEmpty(rootNode.auditor) ? "" : ":" + rootNode.auditor)));
            //合并左半部分加上文本
            strDom = strDom.Append(li_tpl_l.Replace("@name", "0")).Append(string.Concat(rootNode.name, rootNode.station_name, string.IsNullOrEmpty(rootNode.auditor) ? "" : ":" + rootNode.auditor));
            //合并孩子节点
            strDom = strDom.Append(GetChilds4Dom(allList, rootNode.node_guid));

            //合并后半边
            strDom = strDom.Append(li_tpl_r);

            strDom = strDom.Append(ul_tpl_r);
            return strDom.ToString();
        }

        /// <summary>
        /// 找到当前结点的下一级孩子节点
        /// </summary>
        /// <param name="list"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        public string GetChilds4Dom(List<NetMapModel> list, Guid parentid)
        {
            string ul_tpl_l = "<ul class='ul_@name'>";
            string ul_tpl_r = "</ul>";
            string li_tpl_l = "<li class='node_hierarchy_@name'>";
            string li_tpl_r = "</li>";
            string auditor = string.Empty;

            StringBuilder strDom = new StringBuilder("");

            List<NetMapInfo> rtnList = new List<NetMapInfo>();

            var childs =
                from item in list
                where item.parentguid == parentid
                orderby item.sort_order
                select item;
            if (childs == null)
            {
                return string.Empty;
            }
            strDom = strDom.Append(ul_tpl_l);
            foreach (NetMapModel item in childs)
            {                
                if (item.hierarchy>3)
                {
                    auditor = (!string.IsNullOrEmpty(item.auditor)) ? "<p class='new_line'/>"+ item.auditor : "";
                }
                else if (!string.IsNullOrEmpty(item.auditor))
                {
                    auditor = ": " + item.auditor;
                }
                strDom = strDom.Append(li_tpl_l.Replace("@name",item.hierarchy.ToString())).Append(string.Concat(item.name, item.station_name, auditor));
                strDom = strDom.Append(GetChilds4Dom(list, item.node_guid));
                strDom = strDom.Append(li_tpl_r);
            }
            strDom = strDom.Append(ul_tpl_r);

            return strDom.ToString();
        }

    }
}
