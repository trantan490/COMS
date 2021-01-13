<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="visitorView.aspx.cs" Inherits="admin_car_carCategoryView" Title="상세보기" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:Label ID="Label1" runat="server" CssClass="contents_title"></asp:Label><br /><br />
	<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White"
		BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1"
		ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%" OnDataBound="DetailsView1_DataBound">
		<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
		<EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
		<Fields>
			<asp:BoundField DataField="VisitorCode" HeaderText="코드" SortExpression="VisitorCode" />
			<asp:BoundField DataField="VisitorName" HeaderText="성명" SortExpression="VisitorName" />
			<asp:BoundField DataField="CompanyName" HeaderText="회사명" SortExpression="CompanyName" />
			<asp:BoundField DataField="VisitorRegNumber1" HeaderText="생년월일" SortExpression="VisitorRegNumber1" />
			<asp:BoundField DataField="VisitorRegNumber2" HeaderText="VisitorRegNumber2" SortExpression="VisitorRegNumber2" />
			<asp:BoundField DataField="VisitorPhone1" HeaderText="전화번호" SortExpression="VisitorPhone1" />
			<asp:BoundField DataField="VisitorPhone2" HeaderText="VisitorPhone2" SortExpression="VisitorPhone2" />
			<asp:BoundField DataField="VisitorPhone3" HeaderText="VisitorPhone3" SortExpression="VisitorPhone3" />
			<asp:BoundField DataField="Reject" HeaderText="방문거부여부" SortExpression="Reject" />
			<asp:BoundField DataField="RejectContent" HeaderText="방문거부사유" SortExpression="RejectContent" />
			<asp:BoundField DataField="RegDate" HeaderText="등록일" SortExpression="RegDate" />
			<asp:HyperLinkField />
		</Fields>
		<HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
	</asp:DetailsView>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getVisitor"
		TypeName="HanaMicron.COMS.BLL.Visitor">
		<SelectParameters>
			<asp:QueryStringParameter Name="visitorCode" QueryStringField="visitorCode" Type="String" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>

