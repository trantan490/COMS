<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="takeOutDataList.aspx.cs" Inherits="main_visit_listVisit" Title="��û ����" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript">
function confirmDelete(url){
    if(confirm('�ѹ� ������ �����ʹ� ������ �Ұ����մϴ�.\n\n������ �����Ͻðڽ��ϱ�?')){
        window.location=url;
    }else{
        return;
    }
}

// 2019-01-17-������ : ����Ű�� �˻� �ǵ��� ����
function enterkey() {
    if (window.event.keyCode == 13) { // ����:13        
        searchStart();
    }
}

function searchStart(){
    var f= document.forms[0];
	var dateType=f.dateType.value;
	var startDate=f.searchStartDate.value;
	var endDate=f.searchEndDate.value;
	var keyWord=f.keyWord.value;
	var key=f.key.value;
	var check = f.ckTakeOut.checked;
	var url='';	
	
	url='takeOutDataList.aspx?dateType='+ dateType + '&startDate='+startDate+'&endDate='+endDate + '&keyWord='+ keyWord + '&key='+ key +'&check=' + check ;
	window.location=url; 
}
</script>
<script language="javascript" type="text/javascript" src="../../include/js/calendar.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0" onkeyup="enterkey()">
<tr>
	<td><!--################################ Ÿ��Ʋ, ������ġ ���� ################################-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>                                                                                                                                                                                 
			<td height="4" colspan="3"></td>
		</tr>
		<tr>
			<td width="26" height="35"><img src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td class="contents_title">���Ƚ� > ������</td>
			<td align="right" class="location">HOME &gt; ���Ƚ� > ������ <asp:Button ID="Button9" runat="server" Text="" BackColor="White" 
                    BorderColor="White" ForeColor="White" Height="16px" Width="0px"  /> <%-- ���͹�ư Ŭ���� ���� ��ư���� �̵��ϴ� ������ ��¥��ư ����.(text �±׿� asp ��Ʈ�ѷ� ���� ������� ����..)--%></td>
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
                <%--<asp:CheckBox ID="ckTakeOut" runat="server" Text="�̹���" />--%>
			    <%--<asp:DropDownList ID="dateType" runat="server">
                    <asp:ListItem>-</asp:ListItem>
                    <asp:ListItem Value="d.takeOutTime">������</asp:ListItem>
                    <asp:ListItem Value="d.takeInTime">������</asp:ListItem>
                    <asp:ListItem Value="a.scheduleOutDate">���⿹����</asp:ListItem>
                    <asp:ListItem Value="a.scheduleInDate">���Կ�����</asp:ListItem>
                    <asp:ListItem Value="a.regDate">�����</asp:ListItem>
                </asp:DropDownList>--%>
                <input id="ckTakeOut" type="checkbox" />
                �̹���<select name="dateType" align="absmiddle">
                    <option >-</option>
                    <option value="d.takeOutTime">������</option>
                    <option value="d.takeInTime">������</option>
                    <option value="a.scheduleOutDate">���⿹����</option>
                    <option value="a.scheduleInDate">���Կ�����</option>
                    <option value="a.regDate">�����</option>
                </select>
				<input type="text" size="8" name="searchStartDate" value="<%=Request["startDate"]%>" /> 
				<img src="../../images/icon/calendar.gif" alt="��¥����" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].searchStartDate,'yyyy-mm-dd',-1,-1);" />
				<input type="text" size="8" name="searchEndDate" value="<%=Request["endDate"]%>" /> 
				<img src="../../images/icon/calendar.gif" alt="��¥����" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].searchEndDate,'yyyy-mm-dd',-1,-1);" />
<%--					<asp:DropDownList id="keyWord" runat="server" >
                        <asp:ListItem Value="a.takeOutDataCode">�����ȣ</asp:ListItem>
                        <asp:ListItem Value="i.dep_name">��û�μ�</asp:ListItem>
                        <asp:ListItem Value="b.displayName">��û��</asp:ListItem>
                        <asp:ListItem Value="h.companyName">����ó</asp:ListItem>
                    </asp:DropDownList>--%>
                <select name="keyWord" align="absmiddle">
                    <option value="a.takeOutDataCode">�����ȣ</option>
                    <option value="i.dep_name">��û�μ�</option>
                    <option value="b.displayName">��û��</option>
                    <option value="h.companyName">����ó</option>
                </select>

                <input type="text" name="key" size="80px" value="<%=Request["key"]%>" />
                <%--<asp:TextBox id="key" runat="server" Width="80px"></asp:TextBox>--%>
                <input id="Button3" type="button" value="��  ��" onclick="searchStart()" />
				<%--<asp:Button ID="Button2" runat="server" Text="��   ��" /> --%>                  
                    <asp:Button ID="Button1" runat="server" Text="�ٿ�ε�" OnClick="Button1_Click" TabIndex="1"/>
					<input type="button" value="��  ��" onclick="window.print()" />
			</td>
		</tr>
		</table>
		<table width="100%">
		<tr>
				<td>
				<asp:GridView ID="GridView1" runat="server" AllowPaging="True"
		CellPadding="3"
		PageSize="50" OnRowDataBound="GridView1_RowDataBound1" Width="100%" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
		<FooterStyle BackColor="White" ForeColor="#000066" />
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
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="RecieveName" HeaderText="������" >
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
			<asp:BoundField DataField="ScheduleOutDate" HeaderText="���� ������" Visible="False" >
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
            <asp:BoundField DataField="ApprovalState" HeaderText="����" SortExpression="ApprovalState">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TakeOutDataCode" HeaderText="������ ó��" SortExpression="TakeOutDataCode">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
		</Columns>
		<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
		<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
					<RowStyle ForeColor="#000066" />
	</asp:GridView>
					<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectTakeOutDataList" TypeName="HanaMicron.COMS.SQLServerDAL.TakeOutData">
						<SelectParameters>
                            <asp:QueryStringParameter Name="keyWord" QueryStringField="keyWord" Type="String" />
                            <asp:QueryStringParameter Name="key" QueryStringField="key" Type="String" />
                            <asp:QueryStringParameter Name="searchStartDate" QueryStringField="startDate"
                                Type="String" />
                            <asp:QueryStringParameter DefaultValue="" Name="searchEndDate" QueryStringField="endDate"
                                Type="String" />
                            <asp:QueryStringParameter Name="dateType" QueryStringField="dateType" Type="String" />
							<asp:QueryStringParameter Name="requestUserCode" QueryStringField="employeeCode" Type="String" />
                            <asp:Parameter Name="pageType" Type="String" />
                            <asp:QueryStringParameter Name="check" QueryStringField="check" Type="Boolean" />
						</SelectParameters>
					</asp:ObjectDataSource>
				</td>
			</tr>
		</table>
	</td>
	<td width="20" valign="top">&nbsp;</td>
</tr>
</table>
	
</asp:Content>

