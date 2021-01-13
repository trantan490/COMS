<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="takeOutDataList.aspx.cs" Inherits="main_visit_listVisit" Title="신청 내역" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
function confirmDelete(url){
    if(confirm('한번 삭제된 데이터는 복구가 불가능합니다.\n\n정말로 삭제하시겠습니까?')){
        window.location=url;
    }else{
        return;
    }
}
</script>
<script language="javascript" type="text/javascript" src="../../include/js/calendar.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td valign="top" style="height: 1403px">			
							
		<table width="100%">
		<tr>
			<td align="right">
                <asp:CheckBox ID="ckTakeOut" runat="server" Text="미반입" />
				<asp:DropDownList ID="dateType" runat="server">
                    <asp:ListItem>-</asp:ListItem>
                    <asp:ListItem Value="d.takeOutTime">반출일</asp:ListItem>
                    <asp:ListItem Value="d.takeInTime">반입일</asp:ListItem>
                    <asp:ListItem Value="a.scheduleOutDate">반출예정일</asp:ListItem>
                    <asp:ListItem Value="a.scheduleInDate">반입예정일</asp:ListItem>
                    <asp:ListItem Value="a.regDate">등록일</asp:ListItem>
                </asp:DropDownList>
				<input type="text" size="8" name="searchStartDate" value="<%=Request["searchStartDate"]%>" /> 
				<img src="../../images/icon/calendar.gif" alt="날짜선택" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].searchStartDate,'yyyy-mm-dd',-1,-1);" />
				<input type="text" size="8" name="searchEndDate" value="<%=Request["searchEndDate"]%>" /> 
				<img src="../../images/icon/calendar.gif" alt="날짜선택" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].searchEndDate,'yyyy-mm-dd',-1,-1);" />
					<asp:DropDownList id="keyWord" runat="server">
                        <asp:ListItem Value="a.takeOutDataCode">반출번호</asp:ListItem>
                        <asp:ListItem Value="i.dep_name">신청부서</asp:ListItem>
                        <asp:ListItem Value="b.displayName">신청자</asp:ListItem>
                        <asp:ListItem Value="h.companyName">반출처</asp:ListItem>
                    </asp:DropDownList><asp:TextBox id="key" runat="server" Width="80px"></asp:TextBox>
                <asp:DropDownList ID="cboPurpose" runat="server" AutoPostBack="True"
                    Width="120px">
                </asp:DropDownList>
				<asp:Button ID="Button2" runat="server" Text="검   색" />
                    <asp:Button ID="Button1" runat="server" Text="다운로드" OnClick="Button1_Click" />
					<input type="button" value="인  쇄" onclick="window.print()" />
			</td>
		</tr>
		</table>
		<table width="100%">
		<tr>
				<td>
				<asp:GridView ID="GridView1" runat="server" AllowPaging="True"
		CellPadding="4"
		PageSize="50" OnRowDataBound="GridView1_RowDataBound1" Width="100%" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" EmptyDataText="등록 된 내용이 없습니다.">
		<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
		<Columns>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="반출번호" SortExpression="TakeOutDataCode" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="반출일" >
			    <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="신청자" >
			    <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="CompanyName" HeaderText="반출처" SortExpression="CompanyName" >
			    <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
            <asp:BoundField DataField="RecieveName" HeaderText="수령자">
                <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="RequireIN" HeaderText="반입여부" SortExpression="RequireIN" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="반출항목" >
                <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutObjectName" HeaderText="반출목적" SortExpression="TakeOutObjectName" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="ScheduleOutDate" HeaderText="반출 예정일">
                <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="ScheduleInDate" HeaderText="반입 예정일" SortExpression="ScheduleInDate" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="반입일" >                        
                <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:HyperLinkField HeaderText="상태">
				<ItemStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
			</asp:HyperLinkField>
		</Columns>
		<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
		<HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
	</asp:GridView>
					<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectTakeOutDataList" TypeName="HanaMicron.COMS.SQLServerDAL.TakeOutData">
						<SelectParameters>
							<asp:ControlParameter ControlID="keyWord" Name="keyWord" PropertyName="SelectedValue" Type="String" />
							<asp:ControlParameter ControlID="key" Name="key" PropertyName="Text" Type="String" />
							<asp:FormParameter FormField="searchStartDate" Name="searchStartDate" Type="String" />
							<asp:FormParameter DefaultValue="" FormField="searchEndDate" Name="searchEndDate" Type="String" />
                            <asp:ControlParameter ControlID="dateType" Name="dateType" PropertyName="SelectedValue"
                                Type="String" />
							<asp:Parameter Name="requestUserCode" Type="String" />
                            <asp:Parameter Name="pageType" Type="String" />
                            <asp:ControlParameter ControlID="ckTakeOut" Name="check" PropertyName="Checked" Type="Boolean" />
                            <asp:ControlParameter ControlID="cboPurpose" Name="visitPurpose" PropertyName="SelectedValue"
                                Type="String" />
						</SelectParameters>
					</asp:ObjectDataSource>
				</td>
			</tr>
		</table>
        <asp:GridView ID="GridViewExcel" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
            Visible="False" OnRowDataBound="GridViewExcel_RowDataBound">
            <Columns>
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="반출번호" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="반출일" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="신청자" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="RequestUserDepartment" HeaderText="반출부서" SortExpression="RequestUserDepartment" />
                <asp:BoundField DataField="RequestUserDisplayName" HeaderText="반출자" SortExpression="RequestUserDisplayName" />
                <asp:BoundField DataField="RequestUserTitleName" HeaderText="반출자 직급" SortExpression="RequestUserTitleName" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="대분류" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="중분류" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="품명" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="규격/Serial No" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="수량" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="단위" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutObjectName" HeaderText="반출목적" SortExpression="TakeOutObjectName" />
                <asp:BoundField DataField="ObjectContents" HeaderText="반출세부목적" SortExpression="ObjectContents" />
                <asp:BoundField DataField="CompanyName" HeaderText="반출처" SortExpression="CompanyName" />
                <asp:BoundField DataField="RecieveName" HeaderText="수령자" SortExpression="RecieveName" />
                <asp:BoundField DataField="RequireIN" HeaderText="반입여부" SortExpression="RequireIN" />
                <asp:BoundField DataField="ScheduleOutDate" HeaderText="반출예정일" SortExpression="ScheduleOutDate" />
                <asp:BoundField DataField="ScheduleInDate" HeaderText="반입예정일" SortExpression="ScheduleInDate" />
                <asp:BoundField DataField="CarNumber" HeaderText="차량번호" SortExpression="CarNumber" />
                <asp:BoundField DataField="ApproveTime" HeaderText="결재시간" SortExpression="ApproveTime" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="반출처리자" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutPathStartName" HeaderText="반출시작지" SortExpression="TakeOutPathStartName" />
                <asp:BoundField DataField="DisApprovalCategoryName" HeaderText="반입불가명" SortExpression="DisApprovalCategoryName" />
                <asp:BoundField DataField="DisApprovalCategoryDetail" HeaderText="반입불가세부사유" SortExpression="DisApprovalCategoryDetail" />
                <asp:BoundField DataField="RequestUserOfficeName" HeaderText="사업장" SortExpression="RequestUserOfficeName" />
                <asp:BoundField DataField="TakeOutPathEndName" HeaderText="반출목적지" SortExpression="TakeOutPathEndName" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="반입시간" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="상태" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="반입처리자" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="RegDate" HeaderText="등록일" SortExpression="RegDate" />
            </Columns>
        </asp:GridView>
	</td>
	<td valign="top" style="height: 1403px">&nbsp;</td>
</tr>
</table>
	
</asp:Content>

