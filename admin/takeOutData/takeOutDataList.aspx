<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="takeOutDataList.aspx.cs" Inherits="main_visit_listVisit" Title="��û ����" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
function confirmDelete(url){
    if(confirm('�ѹ� ������ �����ʹ� ������ �Ұ����մϴ�.\n\n������ �����Ͻðڽ��ϱ�?')){
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
                <asp:CheckBox ID="ckTakeOut" runat="server" Text="�̹���" />
				<asp:DropDownList ID="dateType" runat="server">
                    <asp:ListItem>-</asp:ListItem>
                    <asp:ListItem Value="d.takeOutTime">������</asp:ListItem>
                    <asp:ListItem Value="d.takeInTime">������</asp:ListItem>
                    <asp:ListItem Value="a.scheduleOutDate">���⿹����</asp:ListItem>
                    <asp:ListItem Value="a.scheduleInDate">���Կ�����</asp:ListItem>
                    <asp:ListItem Value="a.regDate">�����</asp:ListItem>
                </asp:DropDownList>
				<input type="text" size="8" name="searchStartDate" value="<%=Request["searchStartDate"]%>" /> 
				<img src="../../images/icon/calendar.gif" alt="��¥����" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].searchStartDate,'yyyy-mm-dd',-1,-1);" />
				<input type="text" size="8" name="searchEndDate" value="<%=Request["searchEndDate"]%>" /> 
				<img src="../../images/icon/calendar.gif" alt="��¥����" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].searchEndDate,'yyyy-mm-dd',-1,-1);" />
					<asp:DropDownList id="keyWord" runat="server">
                        <asp:ListItem Value="a.takeOutDataCode">�����ȣ</asp:ListItem>
                        <asp:ListItem Value="i.dep_name">��û�μ�</asp:ListItem>
                        <asp:ListItem Value="b.displayName">��û��</asp:ListItem>
                        <asp:ListItem Value="h.companyName">����ó</asp:ListItem>
                    </asp:DropDownList><asp:TextBox id="key" runat="server" Width="80px"></asp:TextBox>
                <asp:DropDownList ID="cboPurpose" runat="server" AutoPostBack="True"
                    Width="120px">
                </asp:DropDownList>
				<asp:Button ID="Button2" runat="server" Text="��   ��" />
                    <asp:Button ID="Button1" runat="server" Text="�ٿ�ε�" OnClick="Button1_Click" />
					<input type="button" value="��  ��" onclick="window.print()" />
			</td>
		</tr>
		</table>
		<table width="100%">
		<tr>
				<td>
				<asp:GridView ID="GridView1" runat="server" AllowPaging="True"
		CellPadding="4"
		PageSize="50" OnRowDataBound="GridView1_RowDataBound1" Width="100%" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" EmptyDataText="��� �� ������ �����ϴ�.">
		<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
		<Columns>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="�����ȣ" SortExpression="TakeOutDataCode" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="������" >
			    <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="��û��" >
			    <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="CompanyName" HeaderText="����ó" SortExpression="CompanyName" >
			    <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
            <asp:BoundField DataField="RecieveName" HeaderText="������">
                <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="RequireIN" HeaderText="���Կ���" SortExpression="RequireIN" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="�����׸�" >
                <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutObjectName" HeaderText="�������" SortExpression="TakeOutObjectName" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="ScheduleOutDate" HeaderText="���� ������">
                <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="ScheduleInDate" HeaderText="���� ������" SortExpression="ScheduleInDate" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="������" >                        
                <HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:HyperLinkField HeaderText="����">
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
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="�����ȣ" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="������" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="��û��" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="RequestUserDepartment" HeaderText="����μ�" SortExpression="RequestUserDepartment" />
                <asp:BoundField DataField="RequestUserDisplayName" HeaderText="������" SortExpression="RequestUserDisplayName" />
                <asp:BoundField DataField="RequestUserTitleName" HeaderText="������ ����" SortExpression="RequestUserTitleName" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="��з�" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="�ߺз�" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="ǰ��" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="�԰�/Serial No" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="����" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="����" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutObjectName" HeaderText="�������" SortExpression="TakeOutObjectName" />
                <asp:BoundField DataField="ObjectContents" HeaderText="���⼼�θ���" SortExpression="ObjectContents" />
                <asp:BoundField DataField="CompanyName" HeaderText="����ó" SortExpression="CompanyName" />
                <asp:BoundField DataField="RecieveName" HeaderText="������" SortExpression="RecieveName" />
                <asp:BoundField DataField="RequireIN" HeaderText="���Կ���" SortExpression="RequireIN" />
                <asp:BoundField DataField="ScheduleOutDate" HeaderText="���⿹����" SortExpression="ScheduleOutDate" />
                <asp:BoundField DataField="ScheduleInDate" HeaderText="���Կ�����" SortExpression="ScheduleInDate" />
                <asp:BoundField DataField="CarNumber" HeaderText="������ȣ" SortExpression="CarNumber" />
                <asp:BoundField DataField="ApproveTime" HeaderText="����ð�" SortExpression="ApproveTime" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="����ó����" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutPathStartName" HeaderText="���������" SortExpression="TakeOutPathStartName" />
                <asp:BoundField DataField="DisApprovalCategoryName" HeaderText="���ԺҰ���" SortExpression="DisApprovalCategoryName" />
                <asp:BoundField DataField="DisApprovalCategoryDetail" HeaderText="���ԺҰ����λ���" SortExpression="DisApprovalCategoryDetail" />
                <asp:BoundField DataField="RequestUserOfficeName" HeaderText="�����" SortExpression="RequestUserOfficeName" />
                <asp:BoundField DataField="TakeOutPathEndName" HeaderText="���������" SortExpression="TakeOutPathEndName" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="���Խð�" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="����" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="TakeOutDataCode" HeaderText="����ó����" SortExpression="TakeOutDataCode" />
                <asp:BoundField DataField="RegDate" HeaderText="�����" SortExpression="RegDate" />
            </Columns>
        </asp:GridView>
	</td>
	<td valign="top" style="height: 1403px">&nbsp;</td>
</tr>
</table>
	
</asp:Content>

