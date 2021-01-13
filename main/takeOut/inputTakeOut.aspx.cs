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
using System.Collections.Generic;

public partial class main_takeOut_inputTakeOut : System.Web.UI.Page
{
    // 전자 결재 연동을 위한 문서 코드
    public String approveDocCode;

	public String itemCategoryNameList;
	public String itemCategoryCodeList;
	public String unitNameList;
	public String unitCodeList;

	public String displayCellCount = "0"; // 최초

	public String objectContents; // 반출 세부 목적
	public String disApprovalCategoryDetail; // 불가 세부 사유
	public int carCode; // 차량 코드
	public String carNumber; // 차량 번호
	public String scheduleDateTitle; // 반입 예정일
    public String scheduleDateOut; // 반출 예정일
	public int companyCode; // 반출처 code
	public String companyName; // 반출처 이름
	public String recieveName; // 수령자 이름
	public String ckRequire1; // 반입 필
	public String ckRequire2; // 반입 불가

	public String tableApprove; // 반려 사유
    public String note; //비고

	public String arrTakeOutItemList; // 수정 시 사용될 반출 제품 목록

	private TakeOutData bllTakeOutData;
	private TakeOutItemData bllTakeOutItemData;
    private VisitData bllVisitData;

    protected void Page_Load(object sender, EventArgs e)
	{
		bllTakeOutData = new TakeOutData();
		bllTakeOutItemData = new TakeOutItemData();
        bllVisitData = new VisitData();

		String takeOutDataCode; // 반출 번호

		// 로그인 체크
		EmployeeInfo loginEmployee = new EmployeeInfo();
		loginEmployee = (EmployeeInfo)Session["loginMember"];
		if (loginEmployee == null)
		{
			Response.Redirect("~/login.aspx", true);
		}

		if (Page.IsPostBack)
		{
            #region 파일 업로드

            //String userFileMimeType1 = String.Empty;
            //String userFileMimeType2 = String.Empty;
            //String userFileMimeType3 = String.Empty;

            //String userFileName1 = String.Empty;
            //String userFileName2 = String.Empty;
            //String userFileName3 = String.Empty;

            //String userFileByte1 = String.Empty;
            //String userFileByte2 = String.Empty;
            //String userFileByte3 = String.Empty;

            //String userFileDBName1 = String.Empty;
            //String userFileDBName2 = String.Empty;
            //String userFileDBName3 = String.Empty;

            //String separator = "|";

            //String fileUploadDir = ConfigurationManager.AppSettings["fileUploadPath"];

            //string[] arrFileName;
            //string ext;
            
            //if (userFile1.HasFile)
            //{
            //    arrFileName = userFile1.FileName.Split('.');
            //    ext = arrFileName[arrFileName.Length - 1].ToLower();

            //    userFileName1 = HanaMicron.COMS.Utility.StringUtil.ReplaceSpecial(userFile1.FileName.Replace("." + ext, "")) + "." + ext;
            //    String savePath1 = fileUploadDir + "\\" + (userFileName1);
            //    userFileMimeType1 = userFile1.PostedFile.ContentType;
            //    userFileByte1 = userFile1.PostedFile.ContentLength.ToString();
            //    userFile1.SaveAs(savePath1);
            //    userFileDBName1 = userFileName1 + separator + userFileMimeType1 + separator + userFileByte1;
            //}

            //if (userFile2.HasFile)
            //{
            //    arrFileName = userFile2.FileName.Split('.');
            //    ext = arrFileName[arrFileName.Length - 1].ToLower();

            //    userFileName2 = HanaMicron.COMS.Utility.StringUtil.ReplaceSpecial(userFile2.FileName.Replace("." + ext, "")) + "." + ext;
            //    userFileMimeType2 = userFile2.PostedFile.ContentType;
            //    userFileByte2 = userFile2.PostedFile.ContentLength.ToString();
            //    String savePath2 = fileUploadDir + "\\" + userFileName2;
            //    userFile2.SaveAs(savePath2);
            //    userFileDBName2 = userFileName2 + separator + userFileMimeType2 + separator + userFileByte2;
            //}

            //if (userFile3.HasFile)
            //{
            //    arrFileName = userFile3.FileName.Split('.');
            //    ext = arrFileName[arrFileName.Length - 1].ToLower();

            //    userFileName3 = HanaMicron.COMS.Utility.StringUtil.ReplaceSpecial(userFile3.FileName.Replace("." + ext, "")) + "." + ext;
            //    userFileMimeType3 = userFile3.PostedFile.ContentType;
            //    userFileByte3 = userFile3.PostedFile.ContentLength.ToString();
            //    String savePath3 = fileUploadDir + "\\" + userFileName3;
            //    userFile3.SaveAs(savePath3);
            //    userFileDBName3 = userFileName3 + separator + userFileMimeType3 + separator + userFileByte3;
            //}
            #endregion

			// 반출 정보 Data 만들기
			TakeOutDataInfo takeOutDataInfo = new TakeOutDataInfo();
			
			takeOutDataInfo.CompanyCode = Convert.ToInt32(Request["companyCode"]);
			takeOutDataInfo.RecieveName = Request["recieveName"];
			takeOutDataInfo.RequestUserCode = loginEmployee.Upnid;
			takeOutDataInfo.RequireIN = Convert.ToInt32(Request["requireIN"]); //반입 필 여부
			takeOutDataInfo.ObjectContents = Request["objectContents"];

            //반입필 일 경우만 반입예정일 입력
            if (takeOutDataInfo.RequireIN == 1)
            {
                takeOutDataInfo.ScheduleInDate = Request["scheduleInDate"];
            }

            takeOutDataInfo.ScheduleOutDate = Request["scheduleOutDate"];
			takeOutDataInfo.CarCode = Convert.ToInt32(Request["carCode"]);
			takeOutDataInfo.TakeOutStateCode = 0;
			takeOutDataInfo.TakeOutObjectCode = Convert.ToInt32(takeOutObjectCode.SelectedValue);
            //takeOutDataInfo.ApprovalUserCode = Request["approvalUserCode"];
			takeOutDataInfo.TakeOutPathEndCode = Convert.ToInt32(takeOutPathEnd.SelectedValue);
			takeOutDataInfo.TakeOutPathStartCode = Convert.ToInt32(takeOutPathStart.SelectedValue);
            takeOutDataInfo.Note = Request["note"];

            //반입불가 일때만 반입불가사유 입력 (수정시에도 해당됨)
            if (takeOutDataInfo.RequireIN == 2)
            {
                takeOutDataInfo.DisApprovalCategoryCode = Convert.ToInt32(disApprovalCategoryCode.SelectedValue);
            }

			takeOutDataInfo.DisApprovalCategoryDetail = Request["disApprovalCategoryDetail"];
            takeOutDataInfo.ElecApproveCode = Request["elecApproveCode"];
			
			// 신규
			if (Request.QueryString["mode"].Equals("write"))
			{
				// 반출 번호 만들기 (물품 저장 될것을 위해서)
				takeOutDataCode = bllTakeOutData.selectNextTakeOutDataCode();
				takeOutDataInfo.TakeOutDataCode = takeOutDataCode;
				takeOutDataInfo.ApprovalState = 0;
                //takeOutDataInfo.UserFile1 = userFileDBName1;
                //takeOutDataInfo.UserFile2 = userFileDBName2;
                //takeOutDataInfo.UserFile3 = userFileDBName3;

				int result=bllTakeOutData.insertTakeOutData(takeOutDataInfo);
			}

			// 수정
			else
			{
				takeOutDataCode =Request["takeOutDataCode"];

				TakeOutDataInfo oldData = bllTakeOutData.selectTakeOutData(Request.QueryString["takeOutDataCode"]);
				takeOutDataInfo.TakeOutDataCode = takeOutDataCode;
				takeOutDataInfo.ApprovalState = 0;
                //takeOutDataInfo.TakeOutItemDataList[0].TakeOutTime = oldData.TakeOutItemDataList[0].TakeOutTime;
                //takeOutDataInfo.TakeOutItemDataList[0].TakeINTime = oldData.TakeOutItemDataList[0].TakeINTime;
                //takeOutDataInfo.ApproveTime = oldData.ApproveTime;
                takeOutDataInfo.ElecApproveCode = oldData.ElecApproveCode;

                //if (!String.IsNullOrEmpty(userFileName1)) takeOutDataInfo.UserFile1 = userFileDBName1;
                //if (!String.IsNullOrEmpty(userFileName2)) takeOutDataInfo.UserFile2 = userFileDBName2;
                //if (!String.IsNullOrEmpty(userFileName3)) takeOutDataInfo.UserFile3 = userFileDBName3;

				int result=bllTakeOutData.updateTakeOutData(takeOutDataInfo);

                // 이전 물품 삭제
				List<TakeOutItemDataInfo> takeOutItemList = bllTakeOutItemData.selectTakeOutItemDataList(oldData.TakeOutDataCode);
				for (int i = 0; i < takeOutItemList.Count; i++)
				{
					TakeOutItemDataInfo obj = (TakeOutItemDataInfo)takeOutItemList[i];
					int resultDelete=bllTakeOutItemData.deleteTakeOutItemData(obj);
				}
			}

			// 반출 물품 정보 넣기
			String subTakeOutItemCategoryCodes = Request["subTakeOutItemCategoryCodes"];
			String[] arrSubTakeOutItemCategoryCode = subTakeOutItemCategoryCodes.Split(',');

			String takeOutItemNames = Request["takeOutItemNames"];
			String[] arrTakeOutItemNames = takeOutItemNames.Split(',');

			String takeOutItemNameTypes = Request["takeOutItemNameTypes"];
			String[] arrTakeOutItemNameTypes = takeOutItemNameTypes.Split(',');

			String takeOutItemAccounts = Request["takeOutItemAccounts"];
			String[] arrTakeOutItemAccounts = takeOutItemAccounts.Split(',');

			String takeOutUnits = Request["takeOutUnits"];
			String[] arrTakeOutUnits = takeOutUnits.Split(',');

			for (int i = 0; i < arrSubTakeOutItemCategoryCode.Length; i++)
		    {
				if (!String.IsNullOrEmpty(arrSubTakeOutItemCategoryCode[i]))
		        {
					TakeOutItemDataInfo takeOutItemDataInfo = new TakeOutItemDataInfo();
					takeOutItemDataInfo.TakeOutDataCode = takeOutDataCode;
					takeOutItemDataInfo.SubCategoryCode = Convert.ToInt32(arrSubTakeOutItemCategoryCode[i]);
					takeOutItemDataInfo.TakeOutItemName = arrTakeOutItemNames[i];
					takeOutItemDataInfo.TakeOutItemType = arrTakeOutItemNameTypes[i];
					takeOutItemDataInfo.Account = Convert.ToInt32(arrTakeOutItemAccounts[i]);
					takeOutItemDataInfo.UnitCode = Convert.ToInt32(arrTakeOutUnits[i]);

					int itemResult = bllTakeOutItemData.insertTakeOutItemData(takeOutItemDataInfo);
		        }
		    }

            Response.Redirect("viewTakeOut.aspx?takeOutDataCode=" + takeOutDataCode, true);
		}
		else
		{
			// 신규
			if (Request.QueryString["mode"].Equals("write"))
			{
                // 신규 결재 코드 가져오기
                approveDocCode = bllVisitData.GetNewApproveCode();
			}
			// 수정
			else
			{
				// 반출 번호
				TakeOutDataInfo oldData = bllTakeOutData.selectTakeOutData(Request.QueryString["takeOutDataCode"]);
				lblTakeOutDataCode.Text = Request["takeOutDataCode"];
				scheduleDateTitle = oldData.ScheduleInDate;
                scheduleDateOut = oldData.ScheduleOutDate;
				takeOutObjectCode.SelectedValue = oldData.TakeOutObjectCode.ToString();
				takeOutPathStart.SelectedValue = oldData.TakeOutPathStartCode.ToString();
				takeOutPathEnd.SelectedValue = oldData.TakeOutPathEndCode.ToString();
				objectContents = oldData.ObjectContents;
				companyCode = oldData.CompanyCode;
				companyName = oldData.CompanyName;
				recieveName = oldData.RecieveName;
				carCode = oldData.CarCode;
				carNumber = oldData.CarNumber;

                // 반입불가가 아닌경우(반입가능) 불가사유 없으므로 수정시 select 1로 하고 실제 저장시에는 저장 안되게 되어 있음.
                if (oldData.DisApprovalCategoryCode == 0)
                {
                    disApprovalCategoryCode.SelectedValue = "1";
                }
                else
                {
                    disApprovalCategoryCode.SelectedValue = oldData.DisApprovalCategoryCode.ToString();
                }

				disApprovalCategoryDetail = oldData.DisApprovalCategoryDetail;

				if (oldData.RequireIN == 1) ckRequire1 = "checked";
				else ckRequire2 = "checked";

				// 이전 물품 정보 보여주기
				List<TakeOutItemDataInfo> takeOutItemList = bllTakeOutItemData.selectTakeOutItemDataList(Request.QueryString["takeOutDataCode"]);
				for (int i = 0; i < takeOutItemList.Count; i++)
				{
					TakeOutItemDataInfo obj = (TakeOutItemDataInfo)takeOutItemList[i];

					arrTakeOutItemList += "parentCategory[" + i + "]='" + obj.ParentCategoryCode + "';\n";
					arrTakeOutItemList += "subCategory[" + i + "]='" + obj.SubCategoryCode + "';\n";
					arrTakeOutItemList += "itemName[" + i + "]='" + obj.TakeOutItemName + "';\n";
					arrTakeOutItemList += "itemType[" + i + "]='" + obj.TakeOutItemType + "';\n";
					arrTakeOutItemList += "account[" + i + "]='" + obj.Account.ToString() + "';\n";
					arrTakeOutItemList += "unit[" + i + "]='" + obj.UnitCode + "';\n";
				}

				displayCellCount = takeOutItemList.Count.ToString();

                // 결재 코드
                approveDocCode = oldData.ElecApproveCode;

                // 첨부 파일
                //if (!String.IsNullOrEmpty(oldData.UserFile1))
                //{
                //    lblUserFile1.Text = "<a href='" + ConfigurationManager.AppSettings["fileOpenPath"] + "/" + bllTakeOutData.GetFileName(oldData.UserFile1) + "' target='_blank'>" + bllTakeOutData.GetFileName(oldData.UserFile1) + "</a>";
                //    lblUserFile1.Text += "<a href='#;' onclick=\"confirmMove('정말로 삭제하시겠습니까?','userFileDeleteTakeOut.aspx?takeOutDataCode=" + oldData.TakeOutDataCode + "&fileNumber=1&fileName=" + HttpUtility.UrlEncode(bllTakeOutData.GetFileName(oldData.UserFile1)) + "',document.dummy)\"><img src='../../images/icon/fileDelete.gif' align='absmiddle'></a>";
                //}

                //if (!String.IsNullOrEmpty(oldData.UserFile2))
                //{
                //    String[] arrUserFile2 = oldData.UserFile2.Split('|');
                //    lblUserFile2.Text = "<a href='" + ConfigurationManager.AppSettings["fileOpenPath"] + "/" + bllTakeOutData.GetFileName(oldData.UserFile2) + "' target='_blank'>" + bllTakeOutData.GetFileName(oldData.UserFile2) + "</a>";
                //    lblUserFile2.Text += "<a href='#;' onclick=\"confirmMove('정말로 삭제하시겠습니까?','userFileDeleteTakeOut.aspx?takeOutDataCode=" + oldData.TakeOutDataCode + "&fileNumber=2&fileName=" + HttpUtility.UrlEncode(bllTakeOutData.GetFileName(oldData.UserFile2)) + "',document.dummy)\"><img src='../../images/icon/fileDelete.gif' align='absmiddle'></a>";
                //}

                //if (!String.IsNullOrEmpty(oldData.UserFile3))
                //{
                //    String[] arrUserFile3 = oldData.UserFile3.Split('|');
                //    lblUserFile3.Text = "<a href='" + ConfigurationManager.AppSettings["fileOpenPath"] + "/" + bllTakeOutData.GetFileName(oldData.UserFile3) + "' target='_blank'>" + bllTakeOutData.GetFileName(oldData.UserFile3) + "</a>";
                //    lblUserFile3.Text += "<a href='#;' onclick=\"confirmMove('정말로 삭제하시겠습니까?','userFileDeleteTakeOut.aspx?takeOutDataCode=" + oldData.TakeOutDataCode + "&fileNumber=3&fileName=" + HttpUtility.UrlEncode(bllTakeOutData.GetFileName(oldData.UserFile3)) + "',document.dummy)\"><img src='../../images/icon/fileDelete.gif' align='absmiddle'></a>";
                //}

                note = oldData.Note;
			}

			// 임직원 정보 보이기
			lblDepartment.Text = loginEmployee.Dep_name;
			lblUpnid.Text = loginEmployee.Upnid;
			lblOfficeName.Text = loginEmployee.OfficeName;
			lblDisplayName.Text = loginEmployee.DisplayName;
			lblTitle.Text = loginEmployee.Title_name;
			lblPhone.Text = loginEmployee.MobilePhoneNumber;


			// 대분류 가져오기
			TakeOutItemCategory bllTakeOutItemCategory = new TakeOutItemCategory();
			List<TakeOutItemCategoryInfo> categorylist = bllTakeOutItemCategory.selectTakeOutItemCategoryList(1, 0);
			for (int i = 0; i < categorylist.Count; i++)
			{
				TakeOutItemCategoryInfo itemCategory = (TakeOutItemCategoryInfo)categorylist[i];
				itemCategoryNameList += "arrItemCategoryNameList[" + i + "] = '" + itemCategory.CodeName + "';\n";
				itemCategoryCodeList += "arrItemCategoryCodeList[" + i + "] = '" + itemCategory.TakeOutItemCategoryCode + "';\n";

			}

			

			// 단위 가져오기
			HanaMicron.COMS.BLL.Unit bllUnit = new HanaMicron.COMS.BLL.Unit();
			String unitSearchKey = "A";
			List<UnitInfo> unitList = bllUnit.selectUnitList(unitSearchKey);
			for (int i = 0; i < unitList.Count; i++)
			{
				UnitInfo unitInfo = (UnitInfo)unitList[i];

				unitNameList += "arrUnitNameList[" + i + "] = '" + unitInfo.CodeName + "';\n";
				unitCodeList += "arrUnitCodeList[" + i + "] = '" + unitInfo.UnitCode + "';\n";

			}
		}
	}
}
