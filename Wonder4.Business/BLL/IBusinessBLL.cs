using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace N_Bers.Business.BLL
{
    /// <summary>
    /// 业务层接口，所有业务接口都要实现
    /// </summary>
    interface IBusinessBLL
    {
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="t"></param>
        int Insert(object t);
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="t"></param>
        int Update(object t);
        /// <summary>
        /// 删除
        /// </summary>
        /// <returns></returns>
        int Delete();
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        List<object> Query(string strfilter);


    }
}
