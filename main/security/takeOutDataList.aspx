<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="takeOutDataList.aspx.cs" Inherits="main_visit_listVisit" Title="신청 내역" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript">
function confirmDelete(url){
    if(confirm('한번 삭제된 데이터는 복구가 불가능합니다.\n\n정말로 삭제하시겠습니까?')){
        window.location=url;
    }else{
        return;
    }
}

// 2019-01-17-임종우 : 엔터키면 검색 되도록 수정
function enterkey() {
    if (window.event.keyCode == 13) { // 엔터:13        
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
	<td><!--################################ 타이틀, 현재위치 시작 ################################-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>                                                                                                                                                                                 
			<td height="4" colspan="3"></td>
		</tr>
		<tr>
			<td width="26" height="35"><img src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td class="contents_title">보안실 > 반출입</td>
			<td align="right" class="location">HOME &gt; 보안실 > 반출입 <asp:Button ID="Button9" runat="server" Text="" BackColor="White" 
                    BorderColor="White" ForeColor="White" Height="16px" Width="0px"  /> <%-- 엔터버튼 클릭시 다음 버튼으로 이동하는 문제로 가짜버튼 만듬.(text 태그와 asp 컨트롤러 동시 사용으로 인해..)--%></td>
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
			<td align="right">
                <%--<asp:CheckBox ID="ckTakeOut" runat="server" Text="미반입" />--%>
			    <%--<asp:DropDownList ID="dateType" runat="server">
                    <asp:ListItem>-</asp:ListItem>
                    <asp:ListItem Value="d.takeOutTime">반출일</asp:ListItem>
                    <asp:ListItem Value="d.takeInTime">반입일</asp:ListItem>
                    <asp:ListItem Value="a.scheduleOutDate">반출예정일</asp:ListItem>
                    <asp:ListItem Value="a.scheduleInDate">반입예정일</asp:ListItem>
                    <asp:ListItem Value="a.regDate">등록일</asp:ListItem>
                </asp:DropDownList>--%>
                <input id="ckTakeOut" type="checkbox" />
                미반입<select name="dateType" align="absmiddle">
                    <option >-</option>
                    <option value="d.takeOutTime">반출일</option>
                    <option value="d.takeInTime">반입일</option>
                    <option value="a.scheduleOutDate">반출예정일</option>
                    <option value="a.scheduleInDate">반입예정일</option>
                    <option value="a.regDate">등록일</option>
                </select>
				<input type="text" size="8" name="searchStartDate" value="<%=Request["startDate"]%>" /> 
				<img src="../../images/icon/calendar.gif" alt="날짜선택" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].searchStartDate,'yyyy-mm-dd',-1,-1);" />
				<input type="text" size="8" name="searchEndDate" value="<%=Request["endDate"]%>" /> 
				<img src="../../images/icon/calendar.gif" alt="날짜선택" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].searchEndDate,'yyyy-mm-dd',-1,-1);" />
<%--					<asp:DropDownList id="keyWord" runat="server" >
                        <asp:ListItem Value="a.takeOutDataCode">반출번호</asp:ListItem>
                        <asp:ListItem Value="i.dep_name">신청부서</asp:ListItem>
                        <asp:ListItem Value="b.displayName">신청자</asp:ListItem>
                        <asp:ListItem Value="h.companyName">반출처</asp:ListItem>
                    </asp:DropDownList>--%>
                <select name="keyWord" align="absmiddle">
                    <option value="a.takeOutDataCode">반출번호</option>
                    <option value="i.dep_name">신청부서</option>
                    <option value="b.displayName">신청자</option>
                    <option value="h.companyName">반출처</option>
                </select>

                <input type="text" name="key" size="80px" value="<%=Request["key"]%>" />
                <%--<asp:TextBox id="key" runat="server" Width="80px"></asp:TextBox>--%>
                <input id="Button3" type="button" value="검  색" onclick="searchStart()" />
				<%--<asp:Button ID="Button2" runat="server" Text="검   색" /> --%>                  
                    <asp:Button ID="Button1" runat="server" Text="다운로드" OnClick="Button1_Click" TabIndex="1"/>
					<input type="button" value="인  쇄" onclick="window.print()" />
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
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="반출번호" SortExpression="TakeOutDataCode" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="반출일" >
			    <HeaderStyle HorizontalAlign="Center" />
			    <ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="신청자" >
			    <HeaderStyle HorizontalAlign="Center" />
			    <ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="CompanyName" HeaderText="반출처" SortExpression="CompanyName" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="RecieveName" HeaderText="수령자" >
			    <HeaderStyle HorizontalAlign="Center" />
			    <ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="RequireIN" HeaderText="반입여부" SortExpression="RequireIN" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="반출항목" >
			    <HeaderStyle HorizontalAlign="Center" />
			    <ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutObjectName" HeaderText="반출목적" SortExpression="TakeOutObjectName" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="ScheduleOutDate" HeaderText="반출 예정일" Visible="False" >
			    <HeaderStyle HorizontalAlign="Center" />
			    <ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="ScheduleInDate" HeaderText="반입 예정일" SortExpression="ScheduleInDate" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="TakeOutDataCode" HeaderText="반입일" >
			    <HeaderStyle HorizontalAlign="Center" />
			    <ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
            <asp:BoundField DataField="ApprovalState" HeaderText="상태" SortExpression="ApprovalState">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TakeOutDataCode" HeaderText="반출입 처리" SortExpression="TakeOutDataCode">
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

