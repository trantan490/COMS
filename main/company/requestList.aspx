﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="requestList.aspx.cs" Inherits="main_company_requestList" Title="신청 업체" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
function confirmDelete(url){
    if(confirm('한번 삭제된 데이터는 복구가 불가능합니다.\n\n정말로 삭제하시겠습니까?')){
        window.location=url;
    }else{
        return false;
    }
}

function selectIt(companyName,companyCode){
    opener.addNameID(companyName,companyCode);
    self.close();
}
</script>
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
    <table style="width: 100%; height: 100%;" id="TABLE1">
        <tr>
            <td align="left" valign="top" style="height: 24px">
                <table style="width: 100%" id="TABLE2">
                    <tr>
                        <td style="width: 192px; height: 27px">
                            신청된 업체 수 :
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            개</td>
                        <td align="right" style="height: 27px;">
                            <strong>승인중인 업체입니다. <span style="color:blue">관리자 승인 후</span> 업체등록이 완료 됩니다.</strong>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKey"
                                Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="AllValidators">검색어를 입력하세요</asp:RequiredFieldValidator>
                            
                            <asp:DropDownList ID="txtKeyWord" runat="server">
                                <asp:ListItem Value="companyName">회사명</asp:ListItem>
                                <asp:ListItem Value="phone">전화번호</asp:ListItem>
                                <asp:ListItem Value="regNumber">사업자번호</asp:ListItem>
                            </asp:DropDownList>
                            
                            <asp:TextBox ID="txtKey" runat="server" CssClass="input1" Width="80px"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" ValidationGroup="AllValidators" Text="검색하기"/>
                            <input type="button" value="등록 신청하기" onClick="window.location='inputCompany.aspx?mode=write'"/>
                        </td>
                    </tr>
                </table>
				<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
					CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound" PageSize="50"
					Width="100%">
					<FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
					<Columns>
						<asp:BoundField DataField="CompanyName" HeaderText="회사명" SortExpression="CompanyName">
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:BoundField DataField="RegNumber1" HeaderText="사업자번호" SortExpression="RegNumber1">
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:BoundField DataField="RegNumber2" HeaderText="RegNumber2" SortExpression="RegNumber2" />
						<asp:BoundField DataField="RegNumber3" HeaderText="RegNumber3" SortExpression="RegNumber3" />
						<asp:BoundField DataField="Phone1" HeaderText="전화번호" SortExpression="Phone1">
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:BoundField DataField="Phone2" HeaderText="Phone2" SortExpression="Phone2" />
						<asp:BoundField DataField="Phone3" HeaderText="Phone3" SortExpression="Phone3" />
						<asp:BoundField DataField="MasterName" HeaderText="대표자명" SortExpression="MasterName">
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:BoundField DataField="RegDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="등록일"
							HtmlEncode="False" SortExpression="RegDate">
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:HyperLinkField HeaderText="수정">
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle HorizontalAlign="Center" Width="100px" />
						</asp:HyperLinkField>
					</Columns>
					<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
					<EditRowStyle BackColor="#999999" />
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				</asp:GridView>
                </td>
        </tr>
        <tr>
            <td align="left" valign="top">
				&nbsp;<table style="width: 670px">
                    <tr>
                        <td>
                        </td>
                        <td>
							&nbsp;</td>
                        <td align="right">
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	</td>
	<td width="20" valign="top">&nbsp;</td>
</tr>
</table>
</asp:Content>

