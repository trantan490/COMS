using System;
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
using HanaMicron.COMS.Utility;

public partial class admin_company_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Company bll = new Company();
		CompanyInfo obj = new CompanyInfo();
		obj=bll.getCompany(Request["companyCode"]);
		obj.Approve = 1;
		int result=bll.updateCompany(obj);

		Page.RegisterClientScriptBlock("alert",JavaScriptBuilder.alert("승인 처리 하였습니다.","requestList.aspx"));
    }
}
