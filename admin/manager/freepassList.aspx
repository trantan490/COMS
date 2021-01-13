﻿<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="freepassList.aspx.cs" Inherits="admin_manager_freepassList" Title="Free pass 관리" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">

	
// 삭제 여부
function confirmInsert(url){
    if(confirm('선택한 사용자를 등록하시겠습니까?')){
        window.location=url;
    }else{
        return;
    }
}

</script>

	
	<table>
		<tr>
			<td colspan="4">
				<asp:Image ID="imgError" runat="server" ImageUrl="~/images/icon/error.gif" Visible="False" />
				<asp:Label ID="lblError" runat="server" Font-Bold="False" CssClass="errorMsg" Visible="False"></asp:Label></td>
		</tr>
		<tr>
			<td rowspan="2" style="height: 187px">
                &nbsp;</td>
			<td rowspan="2" valign="middle" style="height: 187px; width: 298px;">
                <asp:TextBox ID="txtKey" runat="server" Width="123px"></asp:TextBox><asp:Button
                    ID="Button2" runat="server" Text="검   색" /><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                    CellPadding="3" DataSourceID="ObjectDataSource2" EmptyDataText="등록 된 내용이 없습니다."
                    Height="1px"  PageSize="1" Width="98%" OnRowDataBound="GridView1_RowDataBound">
                    <RowStyle ForeColor="#000066" />
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Upnid" HeaderText="사번" SortExpression="Upnid" />
                        <asp:BoundField DataField="DisplayName" HeaderText="이름" SortExpression="DisplayName" />
                        <asp:BoundField DataField="Dep_name" HeaderText="부서" SortExpression="Dep_name" />
                        <asp:BoundField HeaderText="등록" />
                    </Columns>
                </asp:GridView>
                &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br /><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="selectEmployeeForfreepass"
					TypeName="HanaMicron.COMS.BLL.Employee">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtKey" DefaultValue=" 113" Name="ename" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
			</td>
			<td valign="middle" style="height: 187px">
				</td>
			<td valign="middle" style="height: 187px; width: 258px;">
				Freepass 등록자<br />
				<asp:ListBox ID="managerList" runat="server" Width="200px" DataSourceID="ObjectDataSource1" DataTextField="DisplayName" DataValueField="Upnid" Height="250px" CssClass="input1"></asp:ListBox>
                <asp:ImageButton ID="ImageButton" runat="server" ImageUrl="~/images/icon/delete.gif"
                    OnClick="ImageButton_Click" Width="44px" Height="19px" />
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectManagerList"
					TypeName="HanaMicron.COMS.BLL.Manager">
					<SelectParameters>
						<asp:Parameter DefaultValue="-1" Name="managerLevel" Type="Int32" />
					</SelectParameters>
				</asp:ObjectDataSource>
                &nbsp; &nbsp;
			</td>
		</tr>
	</table>
	
</asp:Content>

