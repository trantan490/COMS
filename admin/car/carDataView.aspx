<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="carDataView.aspx.cs" Inherits="admin_car_carCategoryView" Title="상세보기" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White"
		BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1"
		ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%" OnDataBound="DetailsView1_DataBound">
		<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
		<EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
		<Fields>
			<asp:BoundField DataField="CarCode" HeaderText="코드" SortExpression="CarCode" />
			<asp:BoundField DataField="CodeName" HeaderText="차종" SortExpression="CodeName" />
            <asp:BoundField DataField="CarType" HeaderText="구분" SortExpression="CarType" />
            <asp:BoundField DataField="CompanyName" HeaderText="업체명" SortExpression="CompanyName" />
			<asp:BoundField DataField="CarCode" HeaderText="운전자" SortExpression="Handler" />
			<asp:BoundField DataField="CarCode" HeaderText="연락처" SortExpression="Phone" />
			<asp:BoundField DataField="Header" HeaderText="차량 번호 앞자리" SortExpression="Header" />
			<asp:BoundField DataField="Number" HeaderText="차량 번호 뒷자리" SortExpression="Number" />
			<asp:BoundField DataField="Reject" HeaderText="방문 거부 여부" SortExpression="Reject" />
			<asp:BoundField DataField="RejectContent" HeaderText="거부 사유" SortExpression="RejectContent" />
			<asp:BoundField DataField="RegDate" HeaderText="등록일" SortExpression="RegDate" />
			<asp:HyperLinkField />
		</Fields>
		<HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
	</asp:DetailsView>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getCarData"
		TypeName="HanaMicron.COMS.BLL.Car">
		<SelectParameters>
            <asp:QueryStringParameter Name="type" QueryStringField="type" Type="String" />
            <asp:QueryStringParameter Name="code" QueryStringField="code" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>

