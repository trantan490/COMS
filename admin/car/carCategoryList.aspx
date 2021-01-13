﻿<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="carCategoryList.aspx.cs" Inherits="_Default" Title="차종 관리" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
function confirmDelete(url){
    if(confirm('한번 삭제된 데이터는 복구가 불가능합니다.\n\n정말로 삭제하시겠습니까?')){
        window.location=url;
    }else{
        return false;
    }
}
</script>
    <table style="width: 100%; height: 100%;" id="TABLE1">
        <tr>
            <td align="left" valign="top" style="height: 24px">
                <table style="width: 100%" id="TABLE2">
                    <tr>
                        <td style="width: 192px; height: 27px">
                            등록된 차종 수 :
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            개</td>
                        <td align="right" style="height: 27px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="key"
                                Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="AllValidators">검색어를 입력하세요</asp:RequiredFieldValidator>
                            <asp:DropDownList ID="keyWord" runat="server">
                                <asp:ListItem Value="codeName">차종</asp:ListItem>
                            </asp:DropDownList><asp:TextBox ID="key" runat="server" CssClass="input1" Width="80px"></asp:TextBox>
                            <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/images/icon/searchEng.gif"
                                ValidationGroup="AllValidators" /><a href="carCategoryEdit.aspx?mode=write"><img src="../../images/icon/write.gif" style="border-top-style: none; border-right-style: none;
                                border-left-style: none; border-bottom-style: none" alt="신규 등록" /></a>
                                <asp:Button ID="Button1" runat="server" Text="다운로드" OnClick="Button1_Click" />
								<input type="button" value="인  쇄" onclick="window.print()" />
                        </td>
                    </tr>
                </table>
				<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
					DataSourceID="ObjectDataSource1" ForeColor="Black" OnRowDataBound="GridView1_RowDataBound"
					Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" AllowPaging="True" PageSize="50" EmptyDataText="등록 된 내용이 없습니다.">
					<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
					<Columns>
						<asp:BoundField DataField="CodeName" HeaderText="차종" SortExpression="CodeName">
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:BoundField DataField="RegDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="등록일"
							HtmlEncode="False" SortExpression="RegDate">
							<ItemStyle HorizontalAlign="Center" />
							<HeaderStyle HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:HyperLinkField HeaderText="수정">
							<ItemStyle HorizontalAlign="Center" Width="100px" />
							<HeaderStyle HorizontalAlign="Center" />
						</asp:HyperLinkField>
						<asp:HyperLinkField HeaderText="삭제">
							<ItemStyle HorizontalAlign="Center" Width="100px" />
							<HeaderStyle HorizontalAlign="Center" />
						</asp:HyperLinkField>
                        <asp:BoundField DataField="Status" HeaderText="사용유무" SortExpression="Status">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
					</Columns>
					<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
					<HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
				</asp:GridView>
				<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getCarCategoryList"
					TypeName="HanaMicron.COMS.BLL.Car">
					<SelectParameters>
						<asp:ControlParameter ControlID="key" Name="txtKey" PropertyName="Text" Type="String" />
					</SelectParameters>
				</asp:ObjectDataSource>
                </td>
        </tr>
        <tr>
            <td align="left" valign="top">
				<table style="width: 100%">
                    <tr>
                        <td>
							&nbsp;</td>
                        <td align="right">
                            <a href="carCategoryEdit.aspx?mode=write"><img src="../../images/icon/write.gif" style="border-top-style: none; border-right-style: none;
                                border-left-style: none; border-bottom-style: none" alt="신규 등록" /></a></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

