<%@ Page Language="C#" AutoEventWireup="true" CodeFile="printTakeOut.aspx.cs" Inherits="main_takeOut_printTakeOut" Title="������" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>������</title>
    <%--<link rel="stylesheet" href="../../include/css/StyleSheet.css" />--%>
</head>
<body >
    <form id="form1" runat="server">
    <div>
    <br />
<table width="650" border="0" cellspacing="0" cellpadding="0" align="center" style="font-size:8pt;font-family:Tahoma;font-weight:bold;table-layout:fixed">
<tr>
    <td width="40%"><img src="/COMS/images/hanamicron.JPG"></td>
    <td rowspan="2"><h1>�� �� ��</h1></td>
</tr>
<tr>
    <td height="30">
        �����ȣ : <asp:Label ID="lblTakeOutDataCode" runat="server"></asp:Label> 
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
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle"> ��û������
			</td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">�μ���</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">�� ��</td>			
            <td style="background-color:#F5F5F5;border-color:Black;border-style:solid">�� ��</td>			
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">�� ��</td>			
            <td style="background-color:#F5F5F5;border-color:Black;border-style:solid">�系��ȭ</td>			
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
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle"> ��������
			</td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="7%">��/��</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="17%">�� ��/�� ��</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="16%">�� ��</td>			
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">����(����) �ǰ�</td>
		</tr>
        <%=elecApporveHtml%>
	</table>
	<br />
	<table width="100%" border="1" cellpadding="3" cellspacing="0" style="border-color:Black">
		<tr>
			<td colspan="4" class="contents_title" style="border-color:Black;border-style:solid">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle">
				��������
			</td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="20%">���� ������</td>
			<td style="border-color:Black;border-style:solid" width="30%"><asp:Label ID="lblScheduleOutDate" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" width="20%">���� ������</td>
			<td style="border-color:Black;border-style:solid" width="30%"><asp:Label ID="lblScheduleDate" runat="server"></asp:Label></td>	
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">�������</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblTakeOutObject" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">���⼼�θ���</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblTakeOutObjectContents" runat="server"></asp:Label></td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">���Կ���</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblRequireIN" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">�Ұ�����</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblDisApproveName" runat="server"></asp:Label></td>
		</tr>
		<tr align="center">
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">����ȸ��</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblCompanyName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid">������</td>
			<td style="border-color:Black;border-style:solid"><asp:Label ID="lblReceiveName" runat="server"></asp:Label></td>
		</tr>
		<tr align="center">
		    <td style="background-color:#F5F5F5;border-color:Black;border-style:solid">���</td>
		    <td colspan="3" align="left" style="border-color:Black;border-style:solid"><asp:Label ID="lblNote" runat="server"></asp:Label></td>
		</tr>
	</table>
	<br />
	<table width="100%" border="1" cellpadding="3" cellspacing="0" style="border-color:Black">
        <tr>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center" width="6%">�� ��</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">��з�</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">�Һз�</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">ǰ ��</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">�԰�/Serial</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">�� ��</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">�� ��</td>
			<td style="background-color:#F5F5F5;border-color:Black;border-style:solid" align="center">�� ��</td>
		</tr>
		<%=takeOutItemListHtml%>
		<tr>
		    <td colspan="8" style="border-color:Black;border-style:solid; height: 40px;">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		        <tr><td height="15">&nbsp;</td></tr>
		        <tr><td> * ����</td></tr>
		        <tr><td> 1. ������ 2�θ� ����Ͽ�, ���� ���Ƚ��� Ȯ���� ���� �� ����(������ ������ 1��, ���μ� ������ 1��)</td></tr>
		        <tr><td style="height: 14px"> 2. ���Կ��ΰ� �������� ��� �ݵ�� ���� ���Ƚ��� Ȯ���� ���� �� ����</td></tr>
		    </table>
		    </td>
		</tr>
		
	</table>
	<br />
	
	<table width="100%" border="1" cellpadding="3" cellspacing="0" style="border-color:Black">
		<tr>
			<td colspan="2" class="contents_title" style="border-color:Black;border-style:solid">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle">
				���Ƚ� Ȯ��
			</td>
		</tr>
		<tr>
			<td style="border-color:Black;border-style:solid" align="center">
				����Ȯ��
			</td>
			<td style="border-color:Black;border-style:solid" align="center">
				����Ȯ��
			</td>
		</tr>
		<tr>
			<td style="border-color:Black;border-style:solid">
				����Ȯ���� : 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(��)
			</td>
			<td style="border-color:Black;border-style:solid">
				����Ȯ���� : 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(��)
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


