<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listTakeOutTeam.aspx.cs" Inherits="main_takeOut_listTakeOutTeam" Title="��û ����(����)" %>
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
	<td><!--################################ Ÿ��Ʋ, ������ġ ���� ################################-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="4" colspan="3"></td>
		</tr>
		<tr>
			<td width="26" height="35"><img src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td class="contents_title">���� ��û ����(����)</td>
			<td align="right" class="location">HOME &gt; ���� ��û ����(����)</td>
		</tr>
		<tr>
			<td colspan="3" class="title_line"></td>
		</tr>
	</table>
	<!--################################ Ÿ��Ʋ, ������ġ �� ################################--></td>
</tr>
<tr>
	<td height="10"></td>
</tr>
<tr>
	<td valign="top">			
							
		<table width="100%">
		<tr>
			<td align="right">
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
                    </asp:DropDownList><asp:TextBox id="key" runat="server" Width="80px"></asp:TextBox>
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
		PageSize="50" OnRowDataBound="GridView1_RowDataBound1" Width="100%" ForeColor="#333333" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
		<FooterStyle BackColor="White" ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="TakeOutDataCode" HeaderText="�����ȣ" >
                            <HeaderStyle HorizontalAlign="Center" />
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
                        <asp:BoundField DataField="CompanyName" HeaderText="����ó">
                            <HeaderStyle HorizontalAlign="Center" />
							<ItemStyle HorizontalAlign="Center" />
						</asp:BoundField>
                        <asp:BoundField DataField="RecieveName" HeaderText="������">
                            <HeaderStyle HorizontalAlign="Center" />
							<ItemStyle HorizontalAlign="Center" />
						</asp:BoundField>
                        <asp:BoundField DataField="RequireIN" HeaderText="���Կ���">
                            <HeaderStyle HorizontalAlign="Center" />
							<ItemStyle HorizontalAlign="Center" />
						</asp:BoundField>
                        <asp:BoundField DataField="TakeOutDataCode" HeaderText="�����׸�" >
                            <HeaderStyle HorizontalAlign="Center" />
							<ItemStyle HorizontalAlign="Center" />
						</asp:BoundField>
                        <asp:BoundField DataField="TakeOutObjectName" HeaderText="�������">
                            <HeaderStyle HorizontalAlign="Center" />
							<ItemStyle HorizontalAlign="Center" />
						</asp:BoundField>
                        <asp:BoundField DataField="ScheduleInDate" HeaderText="���Կ�����">
                            <HeaderStyle HorizontalAlign="Center" />
							<ItemStyle HorizontalAlign="Center" />
						</asp:BoundField>
                        <asp:BoundField DataField="TakeOutDataCode" HeaderText="������" >                        
                            <HeaderStyle HorizontalAlign="Center" />
							<ItemStyle HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:BoundField DataField="TakeOutDataCode" HeaderText="����" >
						    <HeaderStyle HorizontalAlign="Center" />
						    <ItemStyle HorizontalAlign="Center" />
						</asp:BoundField>
                    </Columns>
		<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
		<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
					<EditRowStyle BackColor="#2461BF" />
					<AlternatingRowStyle BackColor="White" />
	</asp:GridView>
                    &nbsp;
					<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectTakeOutDataList" TypeName="HanaMicron.COMS.BLL.TakeOutData">
						<SelectParameters>
							<asp:ControlParameter ControlID="keyWord" Name="keyWord" PropertyName="SelectedValue" Type="String" />
							<asp:ControlParameter ControlID="key" Name="key" PropertyName="Text" Type="String" />
							<asp:FormParameter FormField="searchStartDate" Name="searchStartDate" Type="String" />
							<asp:FormParameter DefaultValue="" FormField="searchEndDate" Name="searchEndDate" Type="String" />
                            <asp:ControlParameter ControlID="dateType" Name="dateType" PropertyName="SelectedValue"
                                Type="String" />
							<asp:SessionParameter DefaultValue="" Name="requestUserCode" SessionField="loginUpnid" Type="String" />
                            <asp:Parameter DefaultValue="TEAM" Name="pageType" Type="String" />
                            <asp:Parameter Name="check" Type="Boolean" />
						</SelectParameters>
					</asp:ObjectDataSource>
				</td>
			</tr>
		</table>
	</td>
	<td width="20" valign="top">&nbsp;</td>
</tr>
</table>
<%--	<%=Session["loginMember"]["Upnid"]%>--%>
</asp:Content>

