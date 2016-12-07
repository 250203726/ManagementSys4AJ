using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace N_Bers.Business.Core
{
    public static class DBHelper
    {
        /// <summary>  
      /// 备份配置文件config.xml中数据库  
      /// </summary>  
      /// <param name="backupFolder">备份文件路径</param>  
      /// <returns></returns>  
      public static bool DataBackupConfigDB(string backupFolder)
        {
            //获取配置文件中sql数据库名  
            string dbName = "N_Bers_aj";
            string name = dbName + DateTime.Now.ToString("yyyyMMddHHmmss");
            string procname;
            string sql;
            //创建连接对象  
            SqlConnection conn = new SqlConnection(GetConnStr());
            conn.Open();        //打开数据库连接  
                                //删除逻辑备份设备，但不会删掉备份的数据库文件  
            procname = "sp_dropdevice";
            SqlCommand sqlcmd1 = new SqlCommand(procname, conn);
            sqlcmd1.CommandType = CommandType.StoredProcedure;
            SqlParameter sqlpar = new SqlParameter();
            sqlpar = sqlcmd1.Parameters.Add("@logicalname", SqlDbType.VarChar, 20);
            sqlpar.Direction = ParameterDirection.Input;
            sqlpar.Value = dbName;
            try        //如果逻辑设备不存在，略去错误  
            {
                sqlcmd1.ExecuteNonQuery();
            }
            catch//log
            {
                
            }
            //创建逻辑备份设备  
            procname = "sp_addumpdevice";
            SqlCommand sqlcmd2 = new SqlCommand(procname, conn);
            sqlcmd2.CommandType = CommandType.StoredProcedure;
            sqlpar = sqlcmd2.Parameters.Add("@devtype", SqlDbType.VarChar, 20);
            sqlpar.Direction = ParameterDirection.Input;
            sqlpar.Value = "disk";
            sqlpar = sqlcmd2.Parameters.Add("@logicalname", SqlDbType.VarChar, 20);//逻辑设备名  
            sqlpar.Direction = ParameterDirection.Input;
            sqlpar.Value = dbName;
            sqlpar = sqlcmd2.Parameters.Add("@physicalname", SqlDbType.NVarChar, 260);//物理设备名  
            sqlpar.Direction = ParameterDirection.Input;
            sqlpar.Value = backupFolder + name + ".bak";
            try
            {
                int i = sqlcmd2.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                string str = err.Message;
            }
            //备份数据库到指定的数据库文件(完全备份)  
            sql = "BACKUP DATABASE " + dbName + " TO " + dbName + " WITH INIT";
            SqlCommand sqlcmd3 = new SqlCommand(sql, conn);
            sqlcmd3.CommandType = CommandType.Text;
            try
            {
                sqlcmd3.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                string str = err.Message;
                conn.Close();
                return false;
            }
            conn.Close();//关闭数据库连接  
            return true;
        }

        private static string GetConnStr()
        {
            return ConfigurationManager.ConnectionStrings["wonder4_conn"].ToString();
        }
    }
}
