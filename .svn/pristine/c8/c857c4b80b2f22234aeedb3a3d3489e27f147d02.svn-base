<%@ Page Language="C#" AutoEventWireup="true" CodeFile="printTakeOut.aspx.cs" Inherits="main_takeOut_printTakeOut" Title="반출증" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>반출증</title>
    <%--<link rel="stylesheet" href="../../include/css/StyleSheet.css" />--%>
</head>
<body >
    <form id="form1" runat="server">
    <div>
    <br />
<table width="650" border="0" cellspacing="0" cellpadding="0" align="center" style="font-size:8pt;font-family:Tahoma;font-weight:bold;table-layout:fixed">
<tr>
    <td width="40%"><img src="/COMS/images/hanamicron.JPG"></td>
    <td rowspan="2"><h1>반 출 증</h1></td>
</tr>
<tr>
    <td height="30">
        반출번호 : <asp:Label ID="lblTakeOutDataCode" runat="server"></asp:Label> 
    </td>
</tr>
<tr>
	<td height="5" colspan="2"></td>
</tr>
<tr>
    <td valign="top" colspan="2">
	<table width="100%" border="1" cellpadding="3" cellspacing="0" style="border-color:Black">
		<tr>
			<td colspan="5" class="contents_title" style="border-color:Black;border-style:solid">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle"> 신청자정보
			</td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">부서명</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">성 명</td>			
            <td style="background-color:#F5F5F5;border-color:Black;border-style:solid">직 급</td>			
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">사 번</td>			
            <td style="background-color:#F5F5F5;border-color:Black;border-style:solid">사내전화</td>			
		</tr>		    
		<tr align="center">
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblDepartment" runat="server"></asp:Label></td>
		    <td style="border-color:Black;border-style:solid"><asp:Label ID="lblDisplayName" runat="server"></asp:Label></td>
		    <td style="border-color:Black;border-style:solid"><asp:Label ID="lblTitle" runat="server"></asp:Label></td>
		    <td style="border-color:Black;border-style:solid"><asp:Label ID="lblUpnid" runat="server"></asp:Label></td>
		    <td style="border-color:Black;border-style:solid"><asp:Label ID="lblPhone" runat="server"></asp:Label></td>
		</tr>
	</table>
	<br />
		<table width="100%" border="1" cellpadding="3" cellspacing="0" style="border-color:Black">
		<tr>
			<td colspan="4" class="contents_title" style="border-color:Black;border-style:solid">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle"> 결재정보
			</td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="7%">결/합</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="17%">성 명/직 급</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="16%">부 서</td>			
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">결재(합의) 의견</td>
		</tr>
        <%=elecApporveHtml%>
	</table>
	<br />
	<table width="100%" border="1" cellpadding="3" cellspacing="0" style="border-color:Black">
		<tr>
			<td colspan="4" class="contents_title" style="border-color:Black;border-style:solid">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle">
				반출정보
			</td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="20%">반출 예정일</td>
			<td style="border-color:Black;border-style:solid" width="30%"><asp:Label ID="lblScheduleOutDate" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="20%">반입 예정일</td>
			<td style="border-color:Black;border-style:solid" width="30%"><asp:Label ID="lblScheduleDate" runat="server"></asp:Label></td>	
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">반출목적</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblTakeOutObject" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">반출세부목적</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblTakeOutObjectContents" runat="server"></asp:Label></td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">반입여부</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblRequireIN" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">불가사유</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblDisApproveName" runat="server"></asp:Label></td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">수령회사</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblCompanyName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">수령자</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblReceiveName" runat="server"></asp:Label></td>
		</tr>
		<tr align="center">
		    <td style="background-color:#F5F5F5;border-color:Black;border-style:solid">비고</td>
		    <td colspan="3" align="left" style="border-color:Black;border-style:solid"><asp:Label ID="lblNote" runat="server"></asp:Label></td>
		</tr>
	</table>
	<br />
	<table width="100%" border="1" cellpadding="3" cellspacing="0" style="border-color:Black">
        <tr>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center" width="6%">순 번</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">대분류</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">소분류</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">품 명</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">규격/Serial</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">단 위</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">수 량</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">비 고</td>
		</tr>
		<%=takeOutItemListHtml%>
		<tr>
		    <td colspan="8" style="border-color:Black;border-style:solid; height: 40px;">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		        <tr><td height="15">&nbsp;</td></tr>
		        <tr><td> * 주의</td></tr>
		        <tr><td> 1. 반출증 2부를 출력하여, 정문 보안실의 확인을 받은 후 반출(보관실 보관용 1부, 담당부서 보관용 1부)</td></tr>
		        <tr><td style="height: 14px"> 2. 반입여부가 반입필의 경우 반드시 정문 보안실의 확인을 받은 후 반입</td></tr>
		    </table>
		    </td>
		</tr>
		
	</table>
	<br />
	
	<table width="100%" border="1" cellpadding="3" cellspacing="0" style="border-color:Black">
		<tr>
			<td colspan="2" class="contents_title" style="border-color:Black;border-style:solid">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle">
				보안실 확인
			</td>
		</tr>
		<tr>
			<td style="border-color:Black;border-style:solid" align="center">
				반출확인
			</td>
			<td style="border-color:Black;border-style:solid" align="center">
				반입확인
			</td>
		</tr>
		<tr>
			<td style="border-color:Black;border-style:solid">
				반출확인자 : 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)
			</td>
			<td style="border-color:Black;border-style:solid">
				반입확인자 : 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)
			</td>
		</tr>
		<tr>
			<td height="50" style="border-color:Black;border-style:solid">
				&nbsp;
			</td>
			<td style="border-color:Black;border-style:solid">
				&nbsp;
			</td>
		</tr>
	</table>
	<br />
	<br />    
		</td>
<%--	<td width="20" valign="top">&nbsp;</td>--%>
</tr>
</table>
</div>
</form>
<script language="javascript">
    window.print();
</script>
</body>
</html>


