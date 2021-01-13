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
	public class TakeOutPathStart : ITakeOutPathStart
	{

		private static readonly log4net.ILog log = log4net.LogManager.GetLogger(typeof(TakeOutPathStart));

		public TakeOutPathStart()
		{
			log4net.Config.DOMConfigurator.Configure();
		}
	
		#region ITakeOutPathStart 멤버

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutPathStartCode"></param>
		/// <returns></returns>
		public TakeOutPathStartInfo selectTakeOutPathStart(string takeOutPathStartCode)
		{
			log.Debug("=================START selectTakeOutPathStart=================");
			log.Debug("takeOutPathStartCode = " + takeOutPathStartCode);

			TakeOutPathStartInfo obj = new TakeOutPathStartInfo();

			StringBuilder sql_select = new StringBuilder();
			sql_select.Append("SELECT * FROM TakeOutPathStart WHERE takeOutPathStartCode=" + takeOutPathStartCode);

			using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select.ToString(), null))
			{
				if (rdr.Read())
				{
					obj = bindObject(rdr, obj);
				}
			}

			log.Debug(@"=================END selectTakeOutPathStart=================");
			return obj;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="key"></param>
		/// <returns></returns>
		public List<TakeOutPathStartInfo>  selectTakeOutPathStartList(string key)
		{
			log.Debug("=================START selectTakeOutPathStartList=================");
			log.Debug("key = " + key);

			List<TakeOutPathStartInfo> list = new List<TakeOutPathStartInfo>();

			StringBuilder sql_select = new StringBuilder();
			sql_select.Append("SELECT * FROM TakeOutPathStart ");

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
			sql_select.Append("ORDER BY takeOutPathStartCode");

			//Execute the query against the database
			using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select.ToString(), null))
			{
				// Scroll through the results
				while (rdr.Read())
				{
					TakeOutPathStartInfo obj = new TakeOutPathStartInfo();
					obj = bindObject(rdr, obj);
					list.Add(obj);
				}
			}

			log.Debug(@"=================END selectTakeOutPathStartList=================");

			return list;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="key"></param>
		/// <returns></returns>
		public int  selectTakeOutPathStartTotal(string key)
		{
			log.Debug("=================START selectTakeOutPathStartTotal=================");
			log.Debug("key = " + key);

			Object totalCount = null;
			StringBuilder sql_select_total = new StringBuilder();
			sql_select_total.Append("SELECT COUNT(*) ");
			sql_select_total.Append("FROM TakeOutPathStart ");
			if (!String.IsNullOrEmpty(key))
			{
				sql_select_total.Append(" WHERE takeOutPathStartName LIKE '%" + key + "%'");
			}


			totalCount = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select_total.ToString(), null);

			log.Debug(@"=================END selectTakeOutPathStartTotal=================");

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
		/// <param name="takeOutPathStartInfo"></param>
		/// <returns></returns>
		public int  updateTakeOutPathStart(TakeOutPathStartInfo takeOutPathStartInfo)
		{
			log.Debug("=================START updateTakeOutPathStart=================");
			log.Debug("takeOutPathStartInfo = " + takeOutPathStartInfo.ToString());

			StringBuilder sql_update = new StringBuilder();
            sql_update.Append("UPDATE TakeOutPathStart SET takeOutPathStartName='" + takeOutPathStartInfo.TakeOutPathStartName + "', status='" + takeOutPathStartInfo.Status + "' WHERE takeOutPathStartCode=" + takeOutPathStartInfo.TakeOutPathStartCode);

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_update.ToString(), null);

			log.Debug(@"=================END updateTakeOutPathStart=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutPathStartInfo"></param>
		/// <returns></returns>
		public int  insertTakeOutPathStart(TakeOutPathStartInfo takeOutPathStartInfo)
		{
			log.Debug("=================START insertTakeOutPathStart=================");
			log.Debug("takeOutPathStartInfo = " + takeOutPathStartInfo.ToString());

			StringBuilder sql_insert = new StringBuilder();
			sql_insert.Append("INSERT INTO TakeOutPathStart");
			sql_insert.Append(" (takeOutPathStartName,regDate) ");
			sql_insert.Append(" VALUES ");
			sql_insert.Append(" ('" + takeOutPathStartInfo.TakeOutPathStartName + "',GETDATE()) ");

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_insert.ToString(), null);

			log.Debug(@"=================END insertTakeOutPathStart=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="takeOutPathStartInfo"></param>
		/// <returns></returns>
		public int  deleteTakeOutPathStart(TakeOutPathStartInfo takeOutPathStartInfo)
		{
			log.Debug("=================START deleteTakeOutPathStart=================");
			log.Debug("takeOutPathStartInfo = " + takeOutPathStartInfo.ToString());

			StringBuilder sql_delete = new StringBuilder();
			sql_delete.Append("DELETE FROM TakeOutPathStart WHERE takeOutPathStartCode=" + takeOutPathStartInfo.TakeOutPathStartCode);

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_delete.ToString(), null);

			log.Debug(@"=================END deleteTakeOutPathStart=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="rdr"></param>
		/// <param name="obj"></param>
		/// <returns></returns>
		private TakeOutPathStartInfo bindObject(SqlDataReader rdr, TakeOutPathStartInfo obj)
		{
			obj.TakeOutPathStartCode = rdr.GetInt32(0);
			obj.TakeOutPathStartName = rdr.GetString(1);
			obj.RegDate = rdr.GetDateTime(2);
            obj.Status = rdr.GetString(3);
			return obj;
		}
		#endregion
	}
}
