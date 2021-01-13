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
	public class TakeOutPathEnd : ITakeOutPathEnd
	{

		private static readonly log4net.ILog log = log4net.LogManager.GetLogger(typeof(TakeOutPathEnd));

		public TakeOutPathEnd()
		{
			log4net.Config.DOMConfigurator.Configure();
		}

		#region ITakeOutPathEnd 멤버

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutPathEndCode"></param>
		/// <returns></returns>
		public TakeOutPathEndInfo selectTakeOutPathEnd(string takeOutPathEndCode)
		{
			log.Debug("=================START selectTakeOutPathEnd=================");
			log.Debug("takeOutPathEndCode = " + takeOutPathEndCode);

			TakeOutPathEndInfo obj = new TakeOutPathEndInfo();

			StringBuilder sql_select = new StringBuilder();
			sql_select.Append("SELECT * FROM TakeOutPathEnd WHERE takeOutPathEndCode=" + takeOutPathEndCode);

			using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select.ToString(), null))
			{
				if (rdr.Read())
				{
					obj = bindObject(rdr, obj);
				}
			}

			log.Debug(@"=================END selectTakeOutPathEnd=================");
			return obj;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="key"></param>
		/// <returns></returns>
		public List<TakeOutPathEndInfo> selectTakeOutPathEndList(string key)
		{
			log.Debug("=================START selectTakeOutPathEndList=================");
			log.Debug("key = " + key);

			List<TakeOutPathEndInfo> list = new List<TakeOutPathEndInfo>();

			StringBuilder sql_select = new StringBuilder();
			sql_select.Append("SELECT * FROM TakeOutPathEnd ");

            if (!String.IsNullOrEmpty(key))
            {
                if (key.Equals("A"))
                {
                    sql_select.Append("  WHERE status = 'Y' " + "\n");
                }
                else
                {
                    sql_select.Append("WHERE takeOutPathStartName LIKE '%" + key + "%'");
                }

            }

			sql_select.Append("ORDER BY takeOutPathEndCode");

			//Execute the query against the database
			using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select.ToString(), null))
			{
				// Scroll through the results
				while (rdr.Read())
				{
					TakeOutPathEndInfo obj = new TakeOutPathEndInfo();
					obj = bindObject(rdr, obj);
					list.Add(obj);
				}
			}

			log.Debug(@"=================END selectTakeOutPathEndList=================");

			return list;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="key"></param>
		/// <returns></returns>
		public int selectTakeOutPathEndTotal(string key)
		{
			log.Debug("=================START selectTakeOutPathEndTotal=================");
			log.Debug("key = " + key);

			Object totalCount = null;
			StringBuilder sql_select_total = new StringBuilder();
			sql_select_total.Append("SELECT COUNT(*) ");
			sql_select_total.Append("FROM TakeOutPathEnd ");
			if (!String.IsNullOrEmpty(key))
			{
				sql_select_total.Append(" WHERE takeOutPathStartName LIKE '%" + key + "%'");
			}


			totalCount = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select_total.ToString(), null);

			log.Debug(@"=================END selectTakeOutPathEndTotal=================");

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
		/// <param name="takeOutPathEndInfo"></param>
		/// <returns></returns>
		public int updateTakeOutPathEnd(TakeOutPathEndInfo takeOutPathEndInfo)
		{
			log.Debug("=================START updateTakeOutPathEnd=================");
			log.Debug("takeOutPathEndInfo = " + takeOutPathEndInfo.ToString());

			StringBuilder sql_update = new StringBuilder();
            sql_update.Append("UPDATE TakeOutPathEnd SET takeOutPathEndName='" + takeOutPathEndInfo.TakeOutPathEndName + "', status='" + takeOutPathEndInfo.Status + "' WHERE takeOutPathEndCode=" + takeOutPathEndInfo.TakeOutPathEndCode);

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_update.ToString(), null);

			log.Debug(@"=================END updateTakeOutPathEnd=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutPathEndInfo"></param>
		/// <returns></returns>
		public int insertTakeOutPathEnd(TakeOutPathEndInfo takeOutPathEndInfo)
		{
			log.Debug("=================START insertTakeOutPathEnd=================");
			log.Debug("takeOutPathEndInfo = " + takeOutPathEndInfo.ToString());

			StringBuilder sql_insert = new StringBuilder();
			sql_insert.Append("INSERT INTO TakeOutPathEnd");
			sql_insert.Append(" (takeOutPathEndName,regDate,status) ");
			sql_insert.Append(" VALUES ");
            sql_insert.Append(" ('" + takeOutPathEndInfo.TakeOutPathEndName + "',GETDATE(),'" + takeOutPathEndInfo.Status + "')");

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_insert.ToString(), null);

			log.Debug(@"=================END insertTakeOutPathEnd=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutPathEndInfo"></param>
		/// <returns></returns>
		public int deleteTakeOutPathEnd(TakeOutPathEndInfo takeOutPathEndInfo)
		{
			log.Debug("=================START deleteTakeOutPathEnd=================");
			log.Debug("takeOutPathEndInfo = " + takeOutPathEndInfo.ToString());

			StringBuilder sql_delete = new StringBuilder();
			sql_delete.Append("DELETE FROM TakeOutPathEnd WHERE takeOutPathEndCode=" + takeOutPathEndInfo.TakeOutPathEndCode);

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_delete.ToString(), null);

			log.Debug(@"=================END deleteTakeOutPathEnd=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="rdr"></param>
		/// <param name="obj"></param>
		/// <returns></returns>
		private TakeOutPathEndInfo bindObject(SqlDataReader rdr, TakeOutPathEndInfo obj)
		{
			obj.TakeOutPathEndCode = rdr.GetInt32(0);
			obj.TakeOutPathEndName = rdr.GetString(1);
			obj.RegDate = rdr.GetDateTime(2);
            obj.Status = rdr.GetString(3);
			return obj;
		}
		#endregion
	}
}
