﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using HanaMicron.COMS.BLL;
using HanaMicron.COMS.Model;

public partial class company_companyDelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		// 관리자 체크
		EmployeeInfo loginEmployee = new EmployeeInfo();
		loginEmployee = (EmployeeInfo)Session["loginMember"];
		if (loginEmployee == null)
		{
			Response.Redirect("~/login.aspx", true);
		}

		if (loginEmployee.ISAdmin == false)
		{
			Response.Redirect("~/login.aspx", true);
		}

        String visitorCode = Request.QueryString["visitorCode"];

        Visitor bll = new Visitor();
		int result = bll.deleteVisitor(Convert.ToInt32(visitorCode));

        Response.Redirect("visitorList.aspx");
    }
}