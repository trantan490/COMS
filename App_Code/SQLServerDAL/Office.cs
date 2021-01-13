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
	public class Office : IOffice
	{

		private static readonly log4net.ILog log = log4net.LogManager.GetLogger(typeof(Office));

		public Office()
		{
			log4net.Config.DOMConfigurator.Configure();
		}

		#region IOffice 멤버

		/// <summary>
		/// select
		/// </summary>
		/// <param name="officeCode"></param>
		/// <returns></returns>
		public OfficeInfo selectOffice(string officeCode)
		{
			log.Debug(@"=================START selectOffice=================");
			log.Debug(@"officeCode = " + officeCode);

			OfficeInfo obj = new OfficeInfo();

			StringBuilder sql_select = new StringBuilder();
			sql_select.Append("SELECT * FROM Office WHERE officeCode=" + officeCode);

			using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select.ToString(), null))
			{
				if (rdr.Read())
				{
					obj = bindOffice(rdr, obj);
				}
			}

			log.Debug(@"=================END selectOffice=================");
			return obj;
		}

		/// <summary>
		/// list
		/// </summary>
		/// <param name="keyWord"></param>
		/// <param name="key"></param>
		/// <returns></returns>
		public List<OfficeInfo> selectOfficeList(string keyWord, string key)
		{
            log.Debug("=================START selectOfficeList=================");
            log.Debug("keyWord = " + keyWord);
            log.Debug("key = " + key);

			List<OfficeInfo> list = new List<OfficeInfo>();

			StringBuilder sql_select = new StringBuilder();
			sql_select.Append("SELECT * FROM Office WHERE DEL_FLAG is null ");

            if (!String.IsNullOrEmpty(key))
            {
                if (key.Equals("A"))
                {
                    sql_select.Append("AND status = 'Y' ");
                }
                else
                {
                    sql_select.Append("AND " + keyWord + " LIKE '%" + key + "%'");
                }

            }




			sql_select.Append("ORDER BY officeName");

			//Execute the query against the database
			using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select.ToString(), null))
			{
				// Scroll through the results
				while (rdr.Read())
				{
					OfficeInfo obj = new OfficeInfo();
					obj = bindOffice(rdr, obj);
					list.Add(obj);
				}
			}

            log.Debug(@"=================END selectOfficeList=================");

			return list;
		}

		/// <summary>
		/// total
		/// </summary>
		/// <param name="keyWord"></param>
		/// <param name="key"></param>
		/// <returns></returns>
		public int selectOfficeTotal(string keyWord, string key)
		{
            log.Debug("=================START selectOfficeTotal=================");
            log.Debug("keyWord = " + keyWord);
            log.Debug("key = " + key);

			Object totalCount = null;
			StringBuilder sql_select_total = new StringBuilder();
			sql_select_total.Append("SELECT COUNT(*) ");
			sql_select_total.Append("FROM Office ");
			if (!String.IsNullOrEmpty(key))
			{
				sql_select_total.Append(" WHERE " + keyWord + " LIKE '%" + key + "%'");
			}


			totalCount = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_select_total.ToString(), null);

            log.Debug(@"=================END selectOfficeTotal=================");

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
		/// update
		/// </summary>
		/// <param name="office"></param>
		/// <returns></returns>
		public int updateOffice(OfficeInfo office)
		{
            log.Debug("=================START updateOffice=================");
            log.Debug("office = " + office.ToString());

			StringBuilder sql_update = new StringBuilder();
            sql_update.Append("UPDATE Office SET officeName='" + office.OfficeName + "', status='" + office.Status + "' WHERE officeCode=" + office.OfficeCode);

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_update.ToString(), null);

            log.Debug(@"=================END updateOffice=================");

			return result;
		}

		/// <summary>
		/// insert
		/// </summary>
		/// <param name="office"></param>
		/// <returns></returns>
		public int insertOffice(OfficeInfo office)
		{
            log.Debug("=================START insertOffice=================");
            log.Debug("office = " + office.ToString());
             
			StringBuilder sql_insert = new StringBuilder();
			sql_insert.Append("INSERT INTO Office");
            sql_insert.Append(" (officeName,regDate,status) ");
			sql_insert.Append(" VALUES ");
            sql_insert.Append(" ('" + office.OfficeName + "',GETDATE(),'" + office.Status + "')");

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_insert.ToString(), null);

            log.Debug(@"=================END insertOffice=================");

			return result;
		}

		/// <summary>
		/// delete
		/// </summary>
		/// <param name="office"></param>
		/// <returns></returns>
		public int deleteOffice(OfficeInfo office)
        {
            log.Debug("=================START deleteOffice=================");
            log.Debug("office = " + office.ToString());

            StringBuilder sql_delete = new StringBuilder();

			//2010-12-21 김민우: 건물명 삭제시 FLAG값 변경으로 변경
            //sql_delete.Append("DELETE FROM Office WHERE officeCode=" + office.OfficeCode);
            sql_delete.Append("UPDATE Office SET DEL_FLAG ='Y' WHERE officeCode=" + office.OfficeCode);

			int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql_delete.ToString(), null);

            log.Debug(@"=================END deleteOffice=================");

			return result;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="rdr"></param>
		/// <param name="obj"></param>
		/// <returns></returns>
		private OfficeInfo bindOffice(SqlDataReader rdr, OfficeInfo obj)
		{
			obj.OfficeCode = rdr.GetInt32(0);
			obj.OfficeName = rdr.GetString(1);
			obj.RegDate = rdr.GetDateTime(2);
            obj.Status = rdr.GetString(4);

			return obj;
		}
		#endregion
	}
}
