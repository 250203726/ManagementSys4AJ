using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace N_Bers.Business.BLL
{
    /// <summary>
    /// 业务层接口，所有业务接口都要实现
    /// </summary>
    interface IBusinessBLL<T>
    {
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="t"></param>
        int Insert(T t);
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="t"></param>
        int Update(T t);
        /// <summary>
        /// 删除
        /// </summary>
        /// <returns></returns>
        int Delete(T t);
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        List<T> DoQuery(string strfilter);

        //根据id获取model
        T GetModel(int id);

        int DeleteByIDs(string ids);
    }
}
