using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions;

namespace N_Bers.Business.Core
{
   public class MyHttpResult
    {
        /// <summary>
        /// result 表示请求是否处理成功，ture表示成功，false表示失败
        /// </summary>
        public bool result { get; set; }
        /// <summary>
        /// msg 服务器返回消息，当业务逻辑中需要返回的信息。
        /// </summary>
        public string msg { get; set; }
        /// <summary>
        /// data 请求需要返回的数据，比如菜单异步请求的菜单数据，都在data中。
        /// </summary>
        public string data { get; set; }
        /// <summary>
        /// 构造函数
        /// </summary>
        public MyHttpResult() { }
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="res"></param>
        /// <param name="msg"></param>
        public MyHttpResult(bool res, string msg)
        {
            this.result = res;
            this.data = string.Empty;
            this.msg = msg;
        }
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="res"></param>
        /// <param name="data"></param>
        public MyHttpResult(bool res, object data)
        {
            this.result = res;
            this.data = JsonExtensions.ToJson(data);
        }
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="res"></param>
        /// <param name="data"></param>
        /// <param name="msg"></param>
        public MyHttpResult(bool res,object data, string msg) {
            this.result = res;
            this.data = JsonExtensions.ToJson( data);
            this.msg = msg;
        }

        public override string ToString()
        {
            return JsonExtensions.ToJson(this);
        }
    }
}
