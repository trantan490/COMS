<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="takeOutDataView.aspx.cs" Inherits="main_visit_viewVisit" Title="�� ����" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript" src="../../include/js/calendar.js"></script>

	<table width="100%" cellpadding="6" cellspacing="1" style="background-color:#CCCCCC">
		<tr>
			<td colspan="6" class="contents_title" style="background-color:#FFFFFF">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle"> ��û������
			</td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				�μ���
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblDepartment" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				�� ��
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblUpnid" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				�����
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblOfficeName" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				�� ��
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblDisplayName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				�� ��
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblTitle" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				����ó
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblPhone" runat="server"></asp:Label></td>
		</tr>
	</table>
	<br />
	<br />
	<table width="100%" cellpadding="6" cellspacing="1" style="background-color:#CCCCCC">
		<tr>
			<td colspan="6" class="contents_title" style="background-color:#FFFFFF">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle">
				��������
			</td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				�����ȣ
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblTakeOutDataCode" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				���� ������
			</td>
			<td style="background-color:#FFFFFF" colspan="3">
				<%--<asp:Label ID="lblScheduleDate" runat="server"</asp:Label>--%>
				<input type="text" name="scheduleInDate" class="input" size="10" readonly  value="<%=scheduleDateTitle%>" />
                <img src="../../images/icon/calendar.gif" alt="��¥����" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].scheduleInDate,'yyyy-mm-dd',950,330);"/>
            </td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				�������
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblTakeOutObject" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				���⼼�θ���
			</td>
			<td style="background-color:#FFFFFF" colspan="3">
				<asp:Label ID="lblTakeOutObjectContents" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				������
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblTakeOutPathStart" runat="server"></asp:Label> �� <asp:Label ID="lblTakeOutPathEnd" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				����ó
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblCompanyName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				������
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblReceiveName" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				������ ����
			</td>
			<td style="background-color:#FFFFFF">
				<%--<asp:Label ID="lblRequireIN" runat="server"></asp:Label>--%>
                &nbsp;
                <input type="radio" name="requireIN" value="1" <%=ckRequire1%> /> ������
				<input type="radio" name="requireIN" value="2" <%=ckRequire2%> /> ���ԺҰ�
			<td style="background-color:#F5F5F5">
				�Ұ�����
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblDisApproveName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				�Ұ����λ���
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblDisApproveDetail" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				���� ��ȣ
			</td>
			<td style="background-color:#FFFFFF" >
				<asp:Label ID="lblCarNumber" runat="server"></asp:Label></td>
		    <td style="background-color:#F5F5F5">
		        �� ��
		    </td>
		    <td style="background-color:#FFFFFF" colspan="5">
		        <%--<asp:Label ID="lblNote" runat="server"></asp:Label>--%>
                <input type="text" name="txtNote" class="input" value="<%=stNote%>" style="width: 321px" /></td>
	    </tr>
		<tr>
			<td style="background-color:#F5F5F5">
				���� ó����
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblOutUserName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				���� �ð�
			</td>
			<td style="background-color:#FFFFFF" colspan="3">
				<asp:Label ID="lblOutTime" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				���� ó����
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblINUserName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				���� �ð�
			</td>
			<td style="background-color:#FFFFFF" colspan="3">
				<asp:Label ID="lblINTime" runat="server"></asp:Label></td>
		</tr>
	</table>
	<br />
	<br />
	<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
		BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
		CellPadding="3" DataSourceID="ObjectDataSource1" OnRowDataBound="GridView1_RowDataBound" Width="100%">
		<FooterStyle BackColor="White" ForeColor="#000066" />
		<Columns>
			<asp:BoundField DataField="ParentCodeName" HeaderText="��з�" SortExpression="ParentCodeName" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="SubCodeName" HeaderText="�ߺз�" SortExpression="SubCodeName" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutItemName" HeaderText="ǰ��" SortExpression="TakeOutItemName" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutItemType" HeaderText="�԰�" SortExpression="TakeOutItemType" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="Account" HeaderText="����" SortExpression="Account" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="UnitName" HeaderText="����" SortExpression="UnitName" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
		</Columns>
		<RowStyle ForeColor="#000066" />
		<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
		<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
	</asp:GridView>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectTakeOutItemDataList"
		TypeName="HanaMicron.COMS.BLL.TakeOutItemData">
		<SelectParameters>
			<asp:QueryStringParameter Name="takeOutDataCode" QueryStringField="takeOutDataCode" Type="String" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<br />
	<br />
	
	

	<table width="100%" cellpadding="6" cellspacing="1" id="approveBtnTable" style="display:block">
		<tr>
			<td align="center">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="��     ��" />
				<input type="button" value="Ȯ     ��" onclick="history.go(-1)" />
			</td>
		</tr>
	</table>
</asp:Content>

