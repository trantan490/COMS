﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using HanaMicron.COMS.DBUtility;
using HanaMicron.COMS.Model;
using HanaMicron.COMS.IDAL;
using System.Globalization;
using log4net;


namespace HanaMicron.COMS.SQLServerDAL
{
	/// <summary>
	/// Office 
	/// </summary>
	public class TakeOutObject : ITakeOutObject
	{

		private static readonly log4net.ILog log = log4net.LogManager.GetLogger(typeof(TakeOutObject));

		public TakeOutObject()
		{
			log4net.Config.DOMConfigurator.Configure();
		}

		#region ITakeOutObject 멤버

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutObjectCode"></param>
		/// <returns></returns>
		public TakeOutObjectInfo selectTakeOutObject(string takeOutObjectCode)
		{
			log.Debug(@"=================START selectTakeOutObject=================");
			log.Debug(@"takeOutObjectCode = " + takeOutObjectCode);

			TakeOutObjectInfo obj = new TakeOutObjectInfo();

			StringBuilder sql_select = new StringBuilder();
			sql_select.Append("SELECT * FROM TakeOutObject WHERE takeOutObjectCode=" + takeOutObjectCode);

			using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select.ToString(), null))
			{
				if (rdr.Read())
				{
					obj = bindObject(rdr, obj);
				}
			}

			log.Debug(@"=================END selectTakeOutObject=================");
			return obj;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="key"></param>
		/// <returns></returns>
		public List<TakeOutObjectInfo> selectTakeOutObjectList(string key)
		{
			log.Debug("=================START selectTakeOutObjectList=================");
			log.Debug("key = " + key);

			List<TakeOutObjectInfo> list = new List<TakeOutObjectInfo>();

			StringBuilder sql_select = new StringBuilder();
            sql_select.Append("SELECT * FROM TakeOutObject ");
            //sql_select.Append(" WHERE status = 'Y' " + "\n");

            if (!String.IsNullOrEmpty(key))
            {
                if (key.Equals("A"))
                {
                    sql_select.Append("  WHERE status = 'Y' " + "\n");
                }
                else
                {
                    sql_select.Append("WHERE codeName LIKE '%" + key + "%'");
                }

            }
            sql_select.Append("ORDER BY codeName");


            //sql_select.Append("SELECT takeOutObjectCode,codeName,regDate " + "\n");
            //sql_select.Append("  FROM ( " + "\n");
            //sql_select.Append("        SELECT ROW_NUMBER() OVER(ORDER BY takeOutObjectCode) AS NUM,* " + "\n");
            //sql_select.Append("          FROM TakeOutObject " + "\n");
            //sql_select.Append("         WHERE NOT codeName='기  타' " + "\n");
            //sql_select.Append("         UNION ALL " + "\n");
            //sql_select.Append("        SELECT '999' AS NUM,* " + "\n");
            //sql_select.Append("          FROM TakeOutObject " + "\n");
            //sql_select.Append("         WHERE codeName='기  타' " + "\n");
            //sql_select.Append("       ) a " + "\n");

            //if (!String.IsNullOrEmpty(key))
            //{
            //    sql_select.Append("WHERE codeName LIKE '%" + key + "%'");
            //}
            //sql_select.Append("ORDER BY NUM");


			//Execute the query against the database
			using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select.ToString(), null))
			{
				// Scroll through the results
				while (rdr.Read())
				{
					TakeOutObjectInfo obj = new TakeOutObjectInfo();
					obj = bindObject(rdr, obj);
					list.Add(obj);
				}
			}

			log.Debug(@"=================END selectTakeOutObjectList=================");

			return list;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="key"></param>
		/// <returns></returns>
		public int selectTakeOutObjectTotal(string key)
		{
			log.Debug("=================START selectTakeOutObjectTotal=================");
			log.Debug("key = " + key);

			Object totalCount = null;
			StringBuilder sql_select_total = new StringBuilder();
			sql_select_total.Append("SELECT COUNT(*) ");
			sql_select_total.Append("FROM TakeOutObject ");
			if (!String.IsNullOrEmpty(key))
			{
				sql_select_total.Append(" WHERE codeName LIKE '%" + key + "%'");
			}


			totalCount = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select_total.ToString(), null);

			log.Debug(@"=================END selectTakeOutObjectTotal=================");

			if (totalCount == null)
			{
				return Convert.ToInt32("0");
			}
			else
			{
				return Convert.ToInt32(totalCount);
			}
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutObjectInfo"></param>
		/// <returns></returns>
		public int updateTakeOutObject(TakeOutObjectInfo takeOutObjectInfo)
		{
			log.Debug("=================START updateTakeOutObject=================");
			log.Debug("takeOutObjectInfo = " + takeOutObjectInfo.ToString());

			StringBuilder sql_update = new StringBuilder();
            sql_update.Append("UPDATE TakeOutObject SET codeName='" + takeOutObjectInfo.CodeName + "' , status='" + takeOutObjectInfo.Status + "' WHERE takeOutObjectCode=" + takeOutObjectInfo.TakeOutObjectCode);

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_update.ToString(), null);

			log.Debug(@"=================END updateTakeOutObject=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutObjectInfo"></param>
		/// <returns></returns>
		public int insertTakeOutObject(TakeOutObjectInfo takeOutObjectInfo)
		{
			log.Debug("=================START insertTakeOutObject=================");
			log.Debug("takeOutObjectInfo = " + takeOutObjectInfo.ToString());

			StringBuilder sql_insert = new StringBuilder();
			sql_insert.Append("INSERT INTO TakeOutObject");
			sql_insert.Append(" (codeName,regDate,status) ");
			sql_insert.Append(" VALUES ");
            sql_insert.Append(" ('" + takeOutObjectInfo.CodeName + "', GETDATE(),'" + takeOutObjectInfo.Status + "')");

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_insert.ToString(), null);

			log.Debug(@"=================END insertTakeOutObject=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutObjectInfo"></param>
		/// <returns></returns>
		public int deleteTakeOutObject(TakeOutObjectInfo takeOutObjectInfo)
		{
			log.Debug("=================START deleteTakeOutObject=================");
			log.Debug("takeOutObjectInfo = " + takeOutObjectInfo.ToString());

			StringBuilder sql_delete = new StringBuilder();
			sql_delete.Append("DELETE FROM TakeOutObject WHERE takeOutObjectCode=" + takeOutObjectInfo.TakeOutObjectCode);

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_delete.ToString(), null);

			log.Debug(@"=================END deleteTakeOutObject=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="rdr"></param>
		/// <param name="obj"></param>
		/// <returns></returns>
		private TakeOutObjectInfo bindObject(SqlDataReader rdr, TakeOutObjectInfo obj)
		{
			obj.TakeOutObjectCode = rdr.GetInt32(0);
			obj.CodeName = rdr.GetString(1);
			obj.RegDate = rdr.GetDateTime(2);
            obj.Status = rdr.GetString(3);

			return obj;
		}
		#endregion
	}
}
