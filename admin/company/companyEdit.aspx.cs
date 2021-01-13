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

/// <summary>
/// 2018-05-17-임종우 : 사업장관리번호, 사업개시번호 추가 (박민수과장 요청)
/// </summary>
public partial class _Default : System.Web.UI.Page
{
    Company bll = new Company();
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

        if (Page.IsPostBack)
        {
            // 수정하기
            if (mode.Value.Equals("modify"))
            {
				CompanyInfo company = new CompanyInfo();

				company = bll.getCompany(Request["companyCode"]);

                company.CompanyCode = Convert.ToInt32(Request.QueryString["companyCode"]);
                company.CompanyName = companyName.Text;
                company.RegNumber1 = regNumber1.Text;
                company.RegNumber2 = regNumber2.Text;
                company.RegNumber3 = regNumber3.Text;
                company.Phone1 = phone1.Text;
                company.Phone2 = phone2.Text;
                company.Phone3 = phone3.Text;
                company.MasterName = masterName.Text;
                company.Address = address.Text;
                company.CompanyManagementNo = companyManagementNo.Text;
                company.CompanyStartNo = companyStartNo.Text;

                int result = bll.updateCompany(company);
                Response.Redirect("companyList.aspx");
            }
            // 등록하기
            else
            {
                // 등록 여부 검사
                bool exists = bll.existsComapny(regNumber1.Text,regNumber2.Text,regNumber3.Text,companyName.Text);

                if (exists == true)
                {
                    Page.RegisterStartupScript("alertMsg",JavaScriptBuilder.alert(companyName.Text+" 는 이미 등록된 업체 명입니다.\\n회사명으로 검색해 보시기 바랍니다."));
                }
                else
                {
                    // 객체를 만들어 저장
					CompanyInfo company = new CompanyInfo();

                    company.CompanyName = companyName.Text;
                    company.RegNumber1 = regNumber1.Text;
                    company.RegNumber2 = regNumber2.Text;
                    company.RegNumber3 = regNumber3.Text;
                    company.Phone1 = phone1.Text;
                    company.Phone2 = phone2.Text;
                    company.Phone3 = phone3.Text;
                    company.MasterName = masterName.Text;
                    company.Address = address.Text;
					company.Approve = 1;
                    company.EmployeeCode = loginEmployee.Upnid;
                    company.CompanyManagementNo = companyManagementNo.Text;
                    company.CompanyStartNo = companyStartNo.Text;
                    company.EmployeeName = loginEmployee.DisplayName;

                    int result = bll.insertCompany(company);
                    bll.CreateHtml(company);
                    Response.Redirect("companyList.aspx");
                }
                
            }
        }
        else
        {   
            if (Request.QueryString["mode"].Equals("modify"))
            {
				CompanyInfo company = bll.getCompany(Request.QueryString["companyCode"]);

                companyName.Text = company.CompanyName;
                regNumber1.Text = company.RegNumber1;
                regNumber2.Text = company.RegNumber2;
                regNumber3.Text = company.RegNumber3;
                phone1.Text = company.Phone1;
                phone2.Text = company.Phone2;
                phone3.Text = company.Phone3;
                masterName.Text = company.MasterName;
                address.Text = company.Address;
                companyManagementNo.Text = company.CompanyManagementNo;
                companyStartNo.Text = company.CompanyStartNo;

                lableCodeName.Text = company.CompanyName+ " 업체 정보 수정하기";
                mode.Value = Request.QueryString["mode"];
            }
            else
            {
                lableCodeName.Text = "업체 등록하기";
                mode.Value = Request.QueryString["mode"];
            }   
            
        }
        
        
    }
}
