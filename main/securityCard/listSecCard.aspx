<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listSecCard.aspx.cs" Inherits="main_secCard_listSecCard" Title="��û ����" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">

// ���� ���� ����
var approveServerPath='<%=ConfigurationManager.AppSettings["elecApproveServerPath"]%>'; // ���ڰ��� ���� PATH
var approveServerPort='<%=ConfigurationManager.AppSettings["elecApproveServerPort"]%>'; // ���ڰ��� ���� PORT

if(approveServerPort) approveServerURL=approveServerPath + ":" + approveServerPort;
else approveServerURL=approveServerPath;
	
// ���� ����
function confirmDelete(url){
    if(confirm('�ѹ� ������ �����ʹ� ������ �Ұ����մϴ�.\n\n������ �����Ͻðڽ��ϱ�?')){
        window.location=url;
    }else{
        return;
    }
}

// ���� ���� ����
function showApproveStatus(strDoc_code) {
	//strDoc_code �� doc_code  �Դϴ�.
	var strOpt = 'dialogHeight:260px; dialogWidth:608px; leftmargin:30px; marginwidth:30px; dialogTop:'+(screen.height-250)/2+'px; dialogLeft:'+(screen.width-620)/2+'px;   center: yes; help: no; resizable: no; scroll: auto; status: no;';   
	var url = approveServerURL + '/Elec_legacy/Elec_status/Elec_status.asp?doc_code='+strDoc_code;
	strReturn = window.showModalDialog(url, 'Elec_status', strOpt);   
	return;  
}

</script>
<script language="javascript" type="text/javascript" src="../../include/js/calendar.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td>
		<!--################################ Ÿ��Ʋ, ������ġ ���� ################################-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="26" height="35"><img src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td><span class="contents_title">���Ա��� ��û ����</span> (�ӽ������ ������ ���縦 �����Ͽ��� ���Ա��� ��û ó���� �����մϴ�.)</td>
			<td align="right" class="location">HOME &gt; ���Ա��� ��û ����</td>
		</tr>
		<tr>
			<td colspan="3" class="title_line"></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td valign="top">			
							
		<table width="100%">
		<tr>
			<td align="right">
				<asp:TextBox ID="txtStartDate" runat="server" Width="80px"></asp:TextBox>
				<img src="../../images/icon/calendar.gif" alt="��¥����" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, <%=txtStartDate.ClientID%>,'yyyy-mm-dd',-1,-1);" />
				<asp:TextBox ID="txtEndDate" runat="server" Width="80px"></asp:TextBox>
				<img src="../../images/icon/calendar.gif" alt="��¥����" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, <%=txtEndDate.ClientID%>,'yyyy-mm-dd',-1,-1);" />
					<asp:DropDownList id="txtKeyWord" runat="server">
                        <asp:ListItem Value="requestUserName">��û��</asp:ListItem>
                    </asp:DropDownList><asp:TextBox id="txtKey" runat="server" Width="80px"></asp:TextBox>
				<asp:Button ID="Button2" runat="server" Text="��   ��" />
                    <asp:Button ID="Button1" runat="server" Text="�ٿ�ε�" OnClick="Button1_Click" />
					<input type="button" value="��  ��" onclick="window.print()" />
					<asp:HiddenField id="sisAdmin" runat="server"></asp:HiddenField>
			</td>
		</tr>
		</table>
		<table width="100%">
		<tr>
				<td>
					<asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" Width="100%" OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" DataSourceID="ObjectDataSource1" PageSize="50" EmptyDataText="��� �� ������ �����ϴ�.">
			<FooterStyle BackColor="White" ForeColor="#000066" />
			<RowStyle ForeColor="#000066" />
			<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
			<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
						<Columns>
                            <asp:BoundField DataField="RegDate" HeaderText="��û��" SortExpression="RegDate" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Flag" HeaderText="�űԱ���" SortExpression="Flag">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RequestDepDesc" HeaderText="��û�μ�" SortExpression="RequestDepDesc" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RequestUserName" HeaderText="��û��" SortExpression="RequestUserName" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RoleDesc" HeaderText="����" SortExpression="RoleDesc" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OfficePhone" HeaderText="������ȣ" SortExpression="OfficePhone" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ApprovalState" HeaderText="����" SortExpression="ApprovalState" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="����" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
							</asp:BoundField>
							<asp:BoundField HeaderText="����" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
							</asp:BoundField>
                            
                            
                            
						</Columns>
					</asp:GridView>
					<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectSecCardDataList" TypeName="HanaMicron.COMS.BLL.SecCardData">
						<SelectParameters>
							<asp:ControlParameter ControlID="txtKeyWord" Name="keyWord" PropertyName="SelectedValue" Type="String" />
							<asp:ControlParameter ControlID="txtKey" Name="key" PropertyName="Text" Type="String" />
							<asp:ControlParameter ControlID="txtStartDate" Name="searchStartDate" PropertyName="Text" Type="String" />
							<asp:ControlParameter ControlID="txtEndDate" Name="searchEndDate" PropertyName="Text" Type="String" />
							<asp:SessionParameter Name="upnid" SessionField="loginUpnid" Type="String" />
							<asp:ControlParameter ControlID="sisAdmin" Name="type" PropertyName="Value" Type="String" />
							<asp:Parameter Name="approveUserCode" Type="String" />
                           
						</SelectParameters>
					</asp:ObjectDataSource>
					&nbsp;
				</td>
			</tr>
		</table>
	</td>
</tr>
<!--
<tr>
			<td>
				<strong>���� ����</strong><br />
				�ӽ����� : ���縦 ������� ���� ���� �Դϴ�.<br />
				���� ��� �� : ���縦 ����Ͽ� ���� �ϷḦ ��� �ϴ� ���Դϴ�.<br />
				���� : ���縦 �Ϸ� �� �Թ� ��� �����Դϴ�.<br />
				�Թ� : ���水�� �Թ��� �Ͽ� �⹮ ��� ���� ���� �Դϴ�.<br />
				�⹮ : ���水�� �⹮ �Ͽ� ����� ���� �Դϴ�.<br />
			</td>
		</tr>
-->
</table>
	
</asp:Content>

