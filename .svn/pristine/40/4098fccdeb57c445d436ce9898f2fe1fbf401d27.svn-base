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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		Employee bll=new Employee();
		//  로그인 체크
		EmployeeInfo loginEmployee = new EmployeeInfo();
		loginEmployee = (EmployeeInfo)Session["loginMember"];
        if (Response.Cookies["ssoID"] != null ||
                    string.IsNullOrEmpty(Response.Cookies["ssoID"].Value) == false)
        {
            String id = Response.Cookies["ssoID"].Value;
            if (id != null)
            {
                loginEmployee = bll.selectEmployee(id);
                Response.Redirect("main/visit/inputVisit.aspx?mode=write/"+id);
            }
            else
            {
                Response.Redirect("~/main/security/visitDataList.aspx/"+id, true);
            }
        }
        

        


		if (loginEmployee == null)
		{
			Response.Redirect("/COMS/login.aspx");
		}
		else
		{
			// 관리자 이면
			if (loginEmployee.ManagerLevel == 2)
			{
				Response.Redirect("~/admin/Default.aspx", true);
			}
			else
			{
				// 내방 결재자 이면
				//if (bll.existsApprovor(loginEmployee.Upnid, "1", "0"))
				//{
				//    Response.Redirect("~/main/approve/visitDataList.aspx?employeeCode="+loginEmployee.Upnid, true);
				//}

				// 반출 결재자 이면
				//if (bll.existsApprovor(loginEmployee.Upnid, "0", "1"))
				//{
				//    Response.Redirect("~/main/approve/takeOutDataList.aspx?employeeCode="+loginEmployee.Upnid, true);
				//}

				// 보안 요원이면
				if (loginEmployee.ManagerLevel == 1)
				{
					Response.Redirect("~/main/security/visitDataList.aspx", true);
				}

				// 직원이면
                //Response.Redirect("main/visit/listVisit.aspx?employeeCode="+loginEmployee.Upnid);
                Response.Redirect("main/visit/inputVisit.aspx?mode=write");
			}
		}
		
    }
}
