<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inputCompany.aspx.cs" Inherits="_Default" Title="신청 업체" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td><!--################################ 타이틀, 현재위치 시작 ################################-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="4" colspan="3"></td>
		</tr>
		<tr>
			<td width="26" height="35"><img
				src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td class="contents_title">업체 등록 신청</td>
			<td align="right" class="location">HOME &gt; 업체 등록 신청</td>
		</tr>
		<tr>
			<td colspan="3" class="title_line"></td>
		</tr>
	</table>
	<!--################################ 타이틀, 현재위치 끝 ################################--></td>
</tr>
<tr>
	<td height="10"></td>
</tr>
<tr>
	<td valign="top">
    <table style="width: 670px; clip: rect(auto auto auto auto);">
        <tr>
            <td style="width: 100px; background-color: #dcdcdc; height: 30px; font-weight:bold;" align="center">
                회사명</td>
            <td style="background-color: #f5f5f5; height: 30px;">
                <asp:TextBox ID="companyName" runat="server" ValidationGroup="AllValidators"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="companyName" ErrorMessage="회사명을 입력하여 주십시요" ValidationGroup="AllValidators" Display="Dynamic">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 100px; background-color: #dcdcdc; height: 30px; font-weight:bold;" align="center">
                사업자 등록번호</td>
            <td style="background-color: #f5f5f5; height: 24px;">
                <asp:TextBox ID="regNumber1" runat="server" MaxLength="3" ValidationGroup="AllValidators" Width="50px"></asp:TextBox>-
                <asp:TextBox ID="regNumber2" runat="server" MaxLength="2" ValidationGroup="AllValidators" Width="40px"></asp:TextBox>-
                <asp:TextBox ID="regNumber3" runat="server" MaxLength="5" ValidationGroup="AllValidators" Width="80px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="regNumber1" Display="Dynamic" ErrorMessage="사업자등록 번호를 입력하여 주십시요" Height="14px" ValidationGroup="AllValidators" Width="1px">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="regNumber2" Display="Dynamic" ErrorMessage="사업자등록 번호를 입력하여 주십시요" Height="14px" ValidationGroup="AllValidators" Width="1px">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="regNumber3" Display="Dynamic" ErrorMessage="사업자등록 번호를 입력하여 주십시요" Height="14px" ValidationGroup="AllValidators" Width="1px">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; background-color: #dcdcdc; height: 30px;" align="center">
                전화번호</td>
            <td style="background-color: #f5f5f5;">
                <asp:TextBox ID="phone1" runat="server" ValidationGroup="AllValidators" Width="40px" MaxLength="4"></asp:TextBox>-<asp:TextBox ID="phone2" runat="server" ValidationGroup="AllValidators" Width="40px" MaxLength="4"></asp:TextBox>-<asp:TextBox ID="phone3" runat="server" ValidationGroup="AllValidators" Width="40px" MaxLength="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; background-color: #dcdcdc; height: 30px;" align="center">
                대표자 명</td>
            <td style="background-color: #f5f5f5">
                <asp:TextBox ID="masterName" runat="server" ValidationGroup="AllValidators"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px; background-color: #dcdcdc; height: 32px; font-weight:bold;" align="center">
               주 소</td>
            <td style="background-color: #f5f5f5; height: 32px;">
                <asp:TextBox ID="address" runat="server" ValidationGroup="AllValidators" Width="354px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="address" Display="Dynamic" ErrorMessage="주소를 입력하여 주십시요" Height="14px" ValidationGroup="AllValidators" Width="1px">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td style="width: 100px; background-color: #dcdcdc;" align="center">
                </td>
            <td style="background-color: #f5f5f5">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="AllValidators" ForeColor="DarkBlue" />
                
                </td>
        </tr>
        <tr>
            <td style="height: 26px; background-color: #ffffff;" align="center" colspan="2">
                * 내방 업체의 기초정보를 오기입할 경우 승인이 불가합니다.<br />
                (문의 : 총무그룹 김종완 대리(7080), 김진범 사원_7078)
            </td>
        </tr>
        <tr>
            <td style="height: 26px; background-color: #ffffff;" align="center" colspan="2">
                <asp:ImageButton ID="btnSubmit" runat="server" ImageUrl="~/images/icon/write.gif"
                    ValidationGroup="AllValidators" />
                <a href="#" onclick="history.go(-1);"><img src="../../images/icon/cancel.gif" alt="돌아가기" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;" /></a></td>
        </tr>
    </table>
	</td>
	<td width="20" valign="top">&nbsp;</td>
</tr>
</table>
    <asp:HiddenField ID="mode" runat="server" />
</asp:Content>

