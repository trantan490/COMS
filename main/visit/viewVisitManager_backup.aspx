<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewVisitManager_backup.aspx.cs" Inherits="main_visit_viewVisit" Title="�� ����" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script id="approveLine"></script>
<script language="javascript">

// ���� ���� ����
var approveServerPath='<%=ConfigurationManager.AppSettings["elecApproveServerPath"]%>'; // ���ڰ��� ���� PATH
var approveServerPort='<%=ConfigurationManager.AppSettings["elecApproveServerPort"]%>'; // ���ڰ��� ���� PORT
var formCode='<%=ConfigurationManager.AppSettings["elecApproveFormCode"]%>'; // ���ڰ��� form code

if(approveServerPort) approveServerURL=approveServerPath + ":" + approveServerPort;
else approveServerURL=approveServerPath;

// ������ ���� ���� �����ֱ�
// hananet �� ���ڰ����� �ܺ�Interface Javascript �� Ȱ���Ѵ�.
// <label id="strDeci"></label>
// <label id="strRef"></label>
// �� �ʼ��� �����ؾ� �ϸ� doc_code �� �Ѱ��־�� �Ѵ�.
function showApproveLine(){
	var url=approveServerURL+"/Elec_Legacy/Elec_line_ajax.asp?doc_code="+document.forms[0].elecApproveCode.value;
	
	//alert(url);
	document.getElementById("approveLine").src=url;
}

// ���� ���� ����
function showApproveStatus(strDoc_code) {
	//strDoc_code �� doc_code  �Դϴ�.
	var strOpt = 'dialogHeight:260px; dialogWidth:608px; leftmargin:30px; marginwidth:30px; dialogTop:'+(screen.height-250)/2+'px; dialogLeft:'+(screen.width-620)/2+'px;   center: yes; help: no; resizable: no; scroll: auto; status: no;';   
	var url = approveServerURL + '/Elec_legacy/Elec_status/Elec_status.asp?doc_code='+strDoc_code;
	strReturn = window.showModalDialog(url, 'Elec_status', strOpt);   
	return;  
}

// ������� ���� ��â���� 
function approveSelect(){
	var f=document.forms[0];
	
	var approveServerURL; // ���� URL
	var approveDocCode=f.elecApproveCode.value; // ���� �ڵ�
	
	// ���ڰ��� ���
	if(approveServerPort) approveServerURL=approveServerPath + ":" + approveServerPort;
	else approveServerURL=approveServerPath;
	
	var url=approveServerURL+"/Elec_Legacy/Elec_line/Elec_line_main.asp?doc_code="+approveDocCode+"&form_code="+formCode+"&act_type=new&Legacy_id=<%=loginEmployeeUpnid%>&Legacy_name=<%=Request["visitDataCode"]%>&Legacy_title=<%=loginEmployeeTitle%>&Legacy_depart=<%=elecApproveCode%>";
	//var url="modalTest.aspx";
	var strOpt = 'dialogHeight:410px;dialogWidth:710px;leftmargin:30px;marginwidth:30px;dialogTop:'+(screen.height-420)/2+'px; dialogLeft:'+(screen.width-675)/2+'px; center: yes; help: no; resizable: no; scroll: no; status: no;';  // ModalDialog â ũ�� �� Ư¡ ����
	
	window.showModalDialog(url, 'line_asign', strOpt);
	showApproveLine();
}

function confirmSave(){
	if(document.getElementById("strDeci").innerHTML.length < 1){
		alert('[�˸�]���������� ����Ͽ� �ֽʽÿ�');
		return false;
	}
	if(confirm('[�˸�]�ѹ� ��ŵ� ����� �ǵ��� �� �����ϴ�.\n�����ϰ� �����Ͽ� �ֽʽÿ�\n\n[���縦 ����Ͻðڽ��ϱ�?]')){
		document.forms[0].action='../../elecApprove/visitDataSend.aspx';
		document.forms[0].submit();
	}else return false;
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td><!--################################ Ÿ��Ʋ, ������ġ ���� ################################-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="4" colspan="3"></td>
		</tr>
		<tr>
			<td width="26" height="35"><img
				src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td class="contents_title">��û ���� �󼼺���</td>
			<td align="right" class="location">HOME &gt; ��û ���� �󼼺���</td>
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
	<table width="100%" cellpadding="6" cellspacing="1" style="background-color:#CCCCCC">
		<tr>
			<td colspan="6" class="contents_title" style="background-color:#FFFFFF">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle"> ��û������
			</td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5" width="150">
				�μ���
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblDepartment" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				�� ��
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblUpnid" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				�����
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblOfficeName" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				�� ��
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblDisplayName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				�� ��
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblTitle" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				����ó
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblPhone" runat="server"></asp:Label></td>
		</tr>
	</table>
	<br />
	<table width="100%" cellpadding="6" cellspacing="1" border="0" style="background-color:#CCCCCC">
		<tr>
			<td colspan="6" class="contents_title" style="background-color:#FFFFFF">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle"> ��������
			</td>
		</tr>
		
		<tr>
			<td style="background-color:#F5F5F5" width="150">
				�������
			</td>
			<td style="background-color:#FFFFFF">
				[�����û]<%=loginEmploeeDisplayName%> <!--<%=elecApproveCode%>-->
			</td>
			<td style="background-color:#F5F5F5">
				���ȵ��(��������)
			</td>
			<td style="background-color:#FFFFFF">
				�볻��(1��)</td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5" width="15%">
				���缱
			</td>
			<td style="background-color:#FFFFFF" width="35%">
				<label id="strDeci"></label>
			</td>
			<td style="background-color:#F5F5F5" width="15%">
				�뺸��
			</td>
			<td style="background-color:#FFFFFF" width="35%">
				<label id="strRef"></label>
			</td>
		</tr>
		<tr>
			<td colspan="6" bgcolor="#FFFFFF" align="center">
				<input type="button" value="������� ����" style="cursor:hand" onclick="showApproveStatus(document.forms[0].elecApproveCode.value)" align="absmiddle" />
				<input type="button" value="��������" style="cursor:hand" onclick="approveSelect()" align="absmiddle" runat="server" id="btnElecApproveLine"/>
				<asp:Button ID="btnApproveStart" runat="server" Text="�� �� �� ��" OnClick="btnApproveStart_Click" OnClientClick="confirmSave()" UseSubmitBehavior="False" EnableViewState="False" />
				<input type="button" value="���ư���" onclick="history.go(-1)" /></td>
		</tr>
	</table>
	<input type="hidden" name="elecApproveCode" value="<%=elecApproveCode%>" />
	<input type="hidden" name="visitDataCode" value="<%=Request["visitDataCode"]%>" />
	<br />
	<table width="100%" cellpadding="6" cellspacing="1" style="background-color:#CCCCCC">
		<tr>
			<td colspan="6" class="contents_title" style="background-color:#FFFFFF">
				<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle"> ���� ����
			</td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5" width="150">
				�湮 ����
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblVisitObjectName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				���� ����
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblVisitObjectContents" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				������
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblInterviewUserName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				�������
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblOfficeNameDetail" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				���� ��ȣ
			</td>
			<td style="background-color:#FFFFFF" colspan="3">
				<asp:Label ID="lblCarNumber" runat="server"></asp:Label></td>
		</tr>
		<asp:Panel ID="pnlSecurity" runat="server">
		<tr>
			<td style="background-color:#F5F5F5">
				�Թ��ð�
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblInTime" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5">
				�⹮�ð�
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblOutTime" runat="server"></asp:Label></td>
		</tr>
		</asp:Panel>
	</table>
	<br />
	
	<table width="100%" cellpadding="6" cellspacing="1" style="background-color:#CCCCCC">
	<tr>
		<td colspan="6" class="contents_title" style="background-color:#FFFFFF">
			<img src="../../images/basic/icon_02.gif" alt="icon" style="vertical-align:middle"> ÷�� ����
		</td>
	</tr>
	<tr>
		<td style="background-color:#F5F5F5" width="150">
			����1
		</td>
		<td style="background-color:#FFFFFF">
			<asp:Label ID="lblUserFile1" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td style="background-color:#F5F5F5">
			����2
		</td>
		<td style="background-color:#FFFFFF">
			<asp:Label ID="lblUserFile2" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td style="background-color:#F5F5F5">
			����3
		</td>
		<td style="background-color:#FFFFFF">
			<asp:Label ID="lblUserFile3" runat="server"></asp:Label></td>
	</tr>
	</table>
	
	<br />
	<br />
	<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
		BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
		CellPadding="4" DataSourceID="ObjectDataSource1" OnRowDataBound="GridView1_RowDataBound" Width="100%">
		<FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
		<Columns>
			<asp:BoundField HeaderText="����" SortExpression="VisitorName">
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField HeaderText="�������" SortExpression="VisitorRegNumber1">
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
<%--			<asp:BoundField HeaderText="���ǹ�ȣ" SortExpression="VisitorPassportNumber">
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>--%>
			<asp:BoundField HeaderText="��ü��" SortExpression="CompanyName">
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField HeaderText="����ó" SortExpression="VisitorPhone1">
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
		</Columns>
		<RowStyle BackColor="White" ForeColor="#003399" />
		<SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
		<PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
		<HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
	</asp:GridView>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectVisitorDataList"
		TypeName="HanaMicron.COMS.BLL.VisitorData">
		<SelectParameters>
			<asp:QueryStringParameter Name="visitDataCode" QueryStringField="visitDataCode" Type="String" />
		</SelectParameters>
	</asp:ObjectDataSource>
	<br />
	<br />
	
	

	<table width="100%" cellpadding="6" cellspacing="1" id="approveBtnTable" style="display:block">
		<tr>
			<td align="center">
                &nbsp;</td>
		</tr>
	</table>
	</td>
	<td width="20" valign="top">&nbsp;</td>
</tr>
</table>
</asp:Content>

