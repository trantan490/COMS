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
using HanaMicron.COMS.Model;
using HanaMicron.COMS.BLL;

public partial class MasterPage : System.Web.UI.MasterPage
{
	public String employeeCode;
    protected void Page_Load(object sender, EventArgs e)
    {
		//  로그인 체크
		if (this.Context.User.Identity.Name != null)
		{
			EmployeeInfo loginEmployee = new EmployeeInfo();
			Employee bllEmployee = new Employee();
			loginEmployee = bllEmployee.selectEmployee(this.Context.User.Identity.Name);

			lblLogin.Text = loginEmployee.DisplayName + " (" + loginEmployee.Upnid + ") 님 으로 로그인 하셨습니다.";
			// 직원
			PanelEmployeeTop.Visible = true;
			//PanelEmployeeLeft.Visible = true;

			// 보안실 메뉴 보이기
			if (loginEmployee.ManagerLevel == 1)
			{
				PanelEmployeeTop.Visible = false;
				//PanelEmployeeLeft.Visible = false;
            }
            
            if (loginEmployee.ManagerLevel > 0)
            {
                PanelSecurityTop.Visible = true;
                PanelSecuritySearch.Visible = true;
				//PanelSecurityLeft.Visible = true;
            }

			// 결재 권한자 메뉴 보이기
			Employee bll = new Employee();
			
			// 내방
			if (bll.existsApprovor(loginEmployee.Upnid, "1", "0"))
			{
				//PanelVisitApproveTop.Visible = true;
				//PanelVisitApproveLeft.Visible = true;
			}

			// 반출
			if (bll.existsApprovor(loginEmployee.Upnid, "0", "1"))
			{
				//PanelTakeOutApproveTop.Visible = true;
				//PanelTakeOutApproveLeft.Visible = true;
			}

			

			employeeCode = loginEmployee.Upnid;
		}
		else
		{
			//Response.Redirect("~/login.aspx");
		}
    }
}
