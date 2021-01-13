<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="visitDataList.aspx.cs" Inherits="main_visit_listVisit" Title="신청 내역" EnableViewState
="false" %>
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
<script language="javascript" type="text/javascript" src="../../include/js/calendar.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td><!--################################ 타이틀, 현재위치 시작 ################################-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="4" colspan="3"></td>
		</tr>
		<tr>
			<td width="26" height="35"><img src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td class="contents_title">보안실 > 내방객</td>
			<td align="right" class="location">HOME &gt; 보안실 > 내방객</td>
		</tr>
		<tr>
			<td colspan="3" class="title_line"></td>
		</tr>
	</table>
	<!--################################ 타이틀, 현재위치 끝 ################################--></td>
</tr>
<tr>
	<td height="10"></td>
</tr>
<tr>
	<td valign="top">
		<table width="100%">
			<tr>
			    <td align="left"><asp:Label ID="Label1" runat="server" Width="20px" BackColor="#FFF7A2" Text=""></asp:Label>&nbsp;Free pass 내방객</td>
				<td align="right" style="height: 27px">
                    <asp:TextBox ID="txtStartDate" runat="server" Width="80px"></asp:TextBox>
					<img src="../../images/icon/calendar.gif" alt="날짜선택" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, <%=txtStartDate.ClientID%>,'yyyy-mm-dd',-1,-1);"/>

					<asp:TextBox ID="txtEndDate" runat="server" Width="80px"></asp:TextBox>
					<img src="../../images/icon/calendar.gif" alt="날짜선택" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, <%=txtEndDate.ClientID%>,'yyyy-mm-dd',-1,-1);"/>
						<asp:DropDownList id="ddlKeyWord" runat="server">
                            <asp:ListItem Value="visitorName">성명(내방객)</asp:ListItem>
                            <asp:ListItem Value="companyName">업체명</asp:ListItem>
						<asp:ListItem Value="DEPART_MTB.dep_name">신청부서</asp:ListItem>
						<asp:ListItem Value="reqUser.displayName">신청자</asp:ListItem>
						</asp:DropDownList>
						<asp:TextBox id="txtKey" runat="server" Width="80px" CssClass="input1" style="ime-mode:active"></asp:TextBox>
						<asp:Button ID="Button2" runat="server" Text="검   색" />
						<asp:Button ID="Button1" runat="server" Text="다운로드" OnClick="Button1_Click" />
						<input type="button" value="인  쇄" onclick="window.print()" />
				</td>
			</tr>
		</table>
		<table width="100%">
			<tr>
				<td>
				<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
		CellPadding="3"
		PageSize="50" OnRowDataBound="GridView1_RowDataBound1" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnPageIndexChanged="GridView1_PageIndexChanged" DataSourceID="ObjectDataSource1" EmptyDataText="등록 된 내용이 없습니다.">
		<FooterStyle BackColor="White" ForeColor="#000066" />
		<Columns>
			<asp:BoundField DataField="VisitDataCode" HeaderText="예약일" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="성명" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="생년월일" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="회사명" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="신청부서" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="접견자" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="차량번호" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="방문목적" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="연락처" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:HyperLinkField HeaderText="현재상태" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:HyperLinkField>
            <asp:HyperLinkField HeaderText="ESD교육이수" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:HyperLinkField>
			<asp:HyperLinkField HeaderText="입출처리" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:HyperLinkField>
            <asp:BoundField HeaderText="Card No." DataField="CardNo" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
		</Columns>
		<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
		<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
					<RowStyle ForeColor="#000066" />
	</asp:GridView>
					<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectVisitDataList" TypeName="HanaMicron.COMS.BLL.VisitData">
						<SelectParameters>
							<asp:ControlParameter ControlID="ddlKeyWord" Name="keyWord" PropertyName="SelectedValue" Type="String" />
							<asp:ControlParameter ControlID="txtKey" Name="key" PropertyName="Text" Type="String" />
							<asp:ControlParameter ControlID="txtStartDate" Name="searchStartDate" PropertyName="Text" Type="String" />
							<asp:ControlParameter ControlID="txtEndDate" Name="searchEndDate" PropertyName="Text" Type="String" />
							<asp:Parameter Name="upnid" Type="String" />
							<asp:Parameter Name="approveUserCode" Type="String" />
                            <asp:QueryStringParameter Name="type" QueryStringField="type" Type="String" />
						</SelectParameters>
					</asp:ObjectDataSource>
					&nbsp;
				</td>
			</tr>
		</table>
	</td>
	<td width="20" valign="top">&nbsp;</td>
</tr>
</table>
	
</asp:Content>

