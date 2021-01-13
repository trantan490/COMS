<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="companyView.aspx.cs" Inherits="admin_car_carCategoryView" Title="상세보기" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:Label ID="Label1" runat="server" CssClass="contents_title"></asp:Label><br /><br />
	<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White"
		BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1"
		ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%" OnDataBound="DetailsView1_DataBound">
		<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
		<EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
		<Fields>
			<asp:BoundField DataField="CompanyCode" HeaderText="코드" SortExpression="CompanyCode" />
			<asp:BoundField DataField="CompanyName" HeaderText="회사명" SortExpression="CompanyName" />
			<asp:BoundField DataField="MasterName" HeaderText="대표자명" SortExpression="MasterName" />
			<asp:BoundField DataField="Phone1" HeaderText="전화번호" SortExpression="Phone1" />
			<asp:BoundField DataField="Phone2" HeaderText="Phone2" SortExpression="Phone2" />
			<asp:BoundField DataField="Phone3" HeaderText="Phone3" SortExpression="Phone3" />
			<asp:BoundField DataField="RegNumber1" HeaderText="사업자번호" SortExpression="RegNumber1" />
			<asp:BoundField DataField="RegNumber2" HeaderText="RegNumber2" SortExpression="RegNumber2" />
			<asp:BoundField DataField="RegNumber3" HeaderText="RegNumber3" SortExpression="RegNumber3" />
			<asp:BoundField DataField="Address" HeaderText="주소" SortExpression="Address" />
			<asp:BoundField DataField="CompanyManagementNo" HeaderText="사업장관리번호" SortExpression="CompanyManagementNo" />
			<asp:BoundField DataField="CompanyStartNo" HeaderText="사업개시번호" SortExpression="CompanyStartNo" />
			<asp:BoundField DataField="RegDate" HeaderText="등록일" SortExpression="RegDate" />
			<asp:BoundField DataField="EmployeeName" HeaderText="등록자" SortExpression="EmployeeName" />
			<asp:HyperLinkField />
		</Fields>
		<HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
	</asp:DetailsView>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getCompany"
		TypeName="HanaMicron.COMS.BLL.Company">
		<SelectParameters>
			<asp:QueryStringParameter Name="companyCode" QueryStringField="companyCode" Type="String" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>

