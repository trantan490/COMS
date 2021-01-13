﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inputVisit.aspx.cs" Inherits="main_visit_inputVisit" Title="내방 신청" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript" src="../../include/js/calendar.js"></script>
<script language="javascript" type="text/javascript">
var no=1; // 표시 이름
var displayCellCount=<%=displayCellCount%>; // 표시 해야 할 내방객 목록 수 (수정 시 Database 의 정보)
var defaultCellCount=5; // 초기 내방객 목록 Default Count
var check=<%=check%>; //장기내방 체크 유무 확인


// 내방객 추가
function insertRow(){
	var target=document.getElementById("visitorList");
	
	var newRow = target.insertRow(target.rows.length);
	
	var newCell = newRow.insertCell(0);
	newCell.innerHTML=no;
	var cell=document.createElement("input");
	cell.setAttribute('name','visitorCode');
	cell.setAttribute('type','hidden');
	newCell.appendChild(cell);
	
	newCell = newRow.insertCell(1);
	var cell=document.createElement("input");
	cell.setAttribute('name','chk');
	cell.setAttribute('type','checkbox');
	newCell.appendChild(cell);
	
	newCell = newRow.insertCell(2);
	var cell=document.createElement("input");
	cell.setAttribute('name','regNumber');
	cell.setAttribute('type','text');
	cell.setAttribute('class','input');
	cell.setAttribute('readonly',true);
	cell.setAttribute('size','18');
	cell.setAttribute('onclick','searchVisitor(this)');
	newCell.appendChild(cell);
	newCell.innerHTML+="";
	
	newCell = newRow.insertCell(3);
	var cell=document.createElement("input");
	cell.setAttribute('name','visitorName');
	cell.setAttribute('type','text');
	cell.setAttribute('class','input');
	cell.setAttribute('onclick','searchVisitor(this)');
	cell.setAttribute('readonly',true);
	cell.setAttribute('size','8');
	newCell.appendChild(cell);
	newCell.innerHTML+=" <img src='../../images/icon/searchKor.gif' align='absmiddle' style='cursor:hand' onclick=\"searchVisitor(this)\">";
	
	
	newCell = newRow.insertCell(4);
	var cell=document.createElement("input");
	cell.setAttribute('name','company');
	cell.setAttribute('type','text');
	cell.setAttribute('class','input');
	cell.setAttribute('size','20');
	cell.setAttribute('onclick','searchVisitor(this)');
	cell.setAttribute('readonly',true);
	newCell.appendChild(cell);
	newCell.innerHTML+="";
	
	newCell = newRow.insertCell(5);
	var cell=document.createElement("input");
	cell.setAttribute('name','phone');
	cell.setAttribute('type','text');
	cell.setAttribute('class','input');
	cell.setAttribute('size','15');
	cell.setAttribute('onclick','searchVisitor(this)');
	cell.setAttribute('readonly',true);
	newCell.appendChild(cell);
	newCell.innerHTML+="";
//	
//	newCell = newRow.insertCell(6);
//	var cell=document.createElement("input");
//	cell.setAttribute('name','startDate');
//	cell.setAttribute('type','text');
//	cell.setAttribute('class','input');
//	cell.setAttribute('size','15');
//	cell.setAttribute('readonly',true);
//	newCell.appendChild(cell);
//	newCell.innerHTML+=" <img src='../../images/icon/calendar.gif' align='absmiddle' style='cursor:hand' onclick='popUpCalendar(this, this.parentElement.parentElement.cells[6].children[0], \"yyyy-mm-dd\",500,200,true);'>";
//	
//	newCell = newRow.insertCell(7);
//	var cell=document.createElement("input");
//	cell.setAttribute('name','endDate');
//	cell.setAttribute('type','text');
//	cell.setAttribute('class','input');
//	cell.setAttribute('size','15');
//	cell.setAttribute('readonly',true);
//	newCell.appendChild(cell);
//	newCell.innerHTML+=" <img src='../../images/icon/calendar.gif' align='absmiddle' style='cursor:hand' onclick='popUpCalendar(this, this.parentElement.parentElement.cells[7].children[0], \"yyyy-mm-dd\",500,200,true);'>";
	
	no++;
}

// checkbox control 을 통해서 visitDate 와 loginVisitDate 를 표시하는 2개의 TD 의 style.display 값을 조절한다
function change(chkobj){

    var visit1 = document.getElementById('visitDate1');
    var visit2 = document.getElementById('visitDate2');
    
    var longVisit1 = document.getElementById('longVisitDate1');
    var longVisit2 = document.getElementById('longVisitDate2');
    
    if(chkobj.checked==true){
        //alert("장기내방 신청 단위는 최소 보름, 최장 3개월입니다.\n또한 총무팀(송기면 과장)의 합의를 득해야 하며,\n신청 기간대비 출입한 실적이 1/3 이하인 경우\n다음 장기내방 신청시 불이익을 받을 수 있으니\n이점 유의하여 신청해 주시기 바랍니다.");
        alert("장기내방 신청 단위는 최소 1주, 최장 3개월입니다.\n또한 신청부서의 간부(과장 이상) 결재와\n총무그룹(이규형 차장)의 합의를 득해야 하며,\n신청 기간대비 출입한 실적이 1/3 이하인 경우\n다음 장기내방 신청시 불이익을 받을 수 있으니\n이점 유의하여 신청해 주시기 바랍니다.");
 
        displayChange(visit1,'none');
        displayChange(visit2,'none');
        
        displayChange(longVisit1,'block');
        displayChange(longVisit2,'block');
    }else{
        displayChange(visit1,'block');
        displayChange(visit2,'block');
        
        displayChange(longVisit1,'none');
        displayChange(longVisit2,'none');
    }
}

// 인자1 : DOM 객체
// 인자2 : value 값
// 인자 1로 받은 객체의 style.display 값을 인자2로 Setting 한다.
function displayChange(obj,val){
    obj.style.display=val;
}

//로딩시 chkValue 를 받아서 checkbox 를 checked 혹은 non checked 한다.
function loadCheck(obj,chkValue){
    var visit1 = document.getElementById('visitDate1');
    var visit2 = document.getElementById('visitDate2');
    var longVisit1 = document.getElementById('longVisitDate1');
    var longVisit2 = document.getElementById('longVisitDate2');
  
    obj.checked=chkValue;
    
    if(chkValue){
        displayChange(visit1,'none');
        displayChange(visit2,'none');
        
        displayChange(longVisit1,'block');
        displayChange(longVisit2,'block');
    }
    else{
        displayChange(visit1,'block');
        displayChange(visit2,'block');
        
        displayChange(longVisit1,'none');
        displayChange(longVisit2,'none');
    }
}

// 내방객 선택 삭제
function deleteRow(){
	var target=document.getElementById("visitorList");
	for(var io=target.rows.length-1;io > 0;io--){
		if(target.rows[io].cells[1].children[0].checked){
			target.deleteRow(io);	
		}
	}
	//alert(target.rows.cells[2])
}

// 내방객 검색 새창
function searchVisitor(obj){
	var target=document.getElementById("visitorList");
	var index;
	for(var io=target.rows.length-1;io > 0;io--){
		if(target.rows[io].cells[4].children[0].value==obj.parentElement.parentElement.cells[3].children[0].value){
			index=io;
		}
	}
	newWinByNameByScroll('../visitor/searchVisitor.aspx?index='+index+'&visitorName='+escape(obj.parentElement.parentElement.cells[3].children[0].value),'visitorSearch',700,600);
}

// 내방객 조회 완료
function endSearch(visitorCode,regNumber,passportNumber,visitorName,companyName,phone,index){
	var target=document.getElementById("visitorList");
	target.rows[index].cells[0].children[0].value=visitorCode;
	
	if(regNumber == "000000-0000***")
	{
	target.rows[index].cells[2].children[0].value=passportNumber;
	}
	else
	{
	target.rows[index].cells[2].children[0].value=regNumber;
	}
	target.rows[index].cells[3].children[0].value=visitorName;
	target.rows[index].cells[4].children[0].value=companyName;
	target.rows[index].cells[5].children[0].value=phone;
}

// 임직원 검색 완료
function endSearchEmployee(upnid,displayName){
	
	var f=document.forms[0];
	var txtDisplayNameBox=f.displayName;
	var hiddenUpnidBox=f.upnid;
	
	txtDisplayNameBox.value=displayName;
	hiddenUpnidBox.value=upnid;
}

// 차량 검색 완료
function endSearchCar(carCode,number){
	var f=document.forms[0];
	
	f.carCode.value=carCode;
	f.carNumber.value=number;
}

// save <-----------------------------------------------------------------------
function save(){	
	var f=document.forms[0];
	if(checkForm(document.forms[0])){
		f.submit();
	}
}

// 입력 검사
function checkForm(f){

    if(f.<%=DropDownList1.ClientID%>.selectedIndex == 0){
        alert('방문 목적을 선택하여 주십시오');
        return false;
    }
        
	if(!f.visitObjectContents.value){
		alert('방문 세부 목적을 입력하여 주십시오');
		f.visitObjectContents.focus();
		return false;
	}
	
	if(!f.displayName.value){
		alert('접견자를 선택하여 주십시오');
		//f.visitObjectContents.focus();
		return false;
	}
	
	if(!f.displayName.value){
		alert('접견자를 선택하여 주십시오');
		//f.visitObjectContents.focus();
		return false;
	}
	
	// 장기 내방관련 시작일 종료일 체크
	if(f.longVisit.checked){
	    if(!f.<%=txtStartDate.ClientID%>.value){
	        alert('시작일을 선택하여 주십시오');
	        return false;
	    }

	    if(!f.<%=txtEndDate.ClientID%>.value){
	        alert('종료일을 선택하여 주십시오');
	        return false;
	    }
	    
	    if(f.<%=txtStartDate.ClientID%>.value > f.<%=txtEndDate.ClientID%>.value){
	        alert('장기내방일 경우 종료일이 시작일 이전일 수 없습니다');
	        return false;
	    }
	    
	    if(f.<%=txtStartDate.ClientID%>.value == f.<%=txtEndDate.ClientID%>.value){
	        alert('장기내방일 경우 시작일과 종료일이 같을 수 없습니다.');
	        return false;
	    }
	    }else{
    	    if(!f.visitDate.value){
	        alert('방문일을 선택하여 주십시오');
		    return false;
	    }
	
	}
	// 사업장 선택 여부
	/*
	var ck=false;
	for(var i=0;i<f.officePlaceCode.length;i++){
		if(f.officePlaceCode[i].checked==true) ck=true;
	}
	
	if(!ck){
		alert('접견장소\(사업장\)을 선택하여 주십시오');
		//f.visitObjectContents.focus();
		return false;
	}
	*/
	// 내방객 선택 여부
	var tf=false;
	var target=document.getElementById("visitorList");
	for(var io=target.rows.length-1;io > 0;io--){
		if(target.rows[io].cells[0].children[0].value){
			tf=true;
		}
	}
	
	if(!tf){
		alert('내방객을 입력하여 주십시오');
		//f.visitObjectContents.focus();
		return false;
	}
	
	
	var companyCK=true;
	var target=document.getElementById("visitorList");
	for(var io=target.rows.length-1;io > 0;io--){
	    if(target.rows[io].cells[0].children[0].value && !target.rows[io].cells[4].children[0].value){
			companyCK=false;
		}
	}
	
	if(!companyCK){
		alert('내방객의 업체명이 미 등록 되어 있습니다.\n내방객 업체 등록하여 주십시요.\n문의 : 총무그룹 이규형 차장(내선 : 7074)');
		//f.visitObjectContents.focus();
		return false;
	}
	
//	// 내방 날짜 입력 여부
//	var calendarCK=true;
//	var target=document.getElementById("visitorList");
//	for(var io=target.rows.length-1;io > 0;io--){
//		if(target.rows[io].cells[0].children[0].value && !target.rows[io].cells[6].children[0].value){
//			calendarCK=false;
//		}
//		if(target.rows[io].cells[0].children[0].value && !target.rows[io].cells[7].children[0].value){
//			calendarCK=false;
//		}
//	}
//	
//	if(!calendarCK){
//		alert('방문기간을 입력하여 주십시오');
//		//f.visitObjectContents.focus();
//		return false;
//	}
	return true;
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td><!--################################ 타이틀, 현재위치 시작 ################################-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="4" colspan="3"></td>
		</tr>
		<tr>
			<td width="26" height="35"><img
				src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td class="contents_title">내방 신청</td>
			<td align="right" class="location">HOME &gt; 내방 신청</td>
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
	<table width="100%" cellpadding="6" cellspacing="1" style="background-color:#CCCCCC">
		<tr>
			<td colspan="6" class="title" style="background-color:#FFFFFF"><strong>신청자정보</strong></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5" width="120">
				부서명
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblDepartment" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5" width="120">
				사 번
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblUpnid" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5" width="120">
				사업장
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblOfficeName" runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5" width="120">
				성 명
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblDisplayName" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5" width="120">
				직 급
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblTitle" runat="server"></asp:Label></td>
			<td style="background-color:#F5F5F5" width="120">
				연락처
			</td>
			<td style="background-color:#FFFFFF">
				<asp:Label ID="lblPhone" runat="server"></asp:Label></td>
		</tr>
		<%=tableApprove%>
	</table>
	
	<br />
	<br />
	<table width="100%" cellpadding="6" cellspacing="1" border="0" style="background-color:#CCCCCC">
		<tr>
			<td colspan="6" class="title" style="background-color:#FFFFFF"><strong>내방 정보 등록</strong>&nbsp; (장기 내방 인 경우 체크 <input type="checkbox" name="longVisit" id="longVisit" value="1" onclick="javascript:change(this)" /> )</td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5" width="100">
				방문 목적
			</td>
			<td style="background-color:#FFFFFF">
				<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSourceVisitObject" DataTextField="VisitObjectName" DataValueField="VisitObjectCode" Width="223px">
				</asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSourceVisitObject" runat="server"
					SelectMethod="selectVisitObjectList" TypeName="HanaMicron.COMS.BLL.VisitObject">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="A" Name="a" Type="String" />
                    </SelectParameters>
				</asp:ObjectDataSource>
			</td>
			<td style="background-color:#F5F5F5" width="100">
				세부 목적
			</td>
			<td style="background-color:#FFFFFF">
                &nbsp;<input type="text" name="visitObjectContents" class="input" size="41" value="<%=visitObjectContents%>" /></td>
			<td style="background-color:#F5F5F5;display:block" width="100" id="visitDate1">
				방문일&nbsp;</td>
			<td style="background-color:#FFFFFF;display:block" id="visitDate2">
				<input type="text" name="visitDate" class="input" size="15" value="<%=reqVisitData%>" style='cursor:hand' onclick='popUpCalendar(this, visitDate, "yyyy.mm.dd",500,200,true);' readonly /></td>
			<td style="background-color:#F5F5F5;display:none" width="100" id="longVisitDate1">
				방문기간&nbsp;</td>
			<td style="background-color:#FFFFFF;display:none" id="longVisitDate2">
				<asp:TextBox ID="txtStartDate" runat="server" CssClass="input" Width="70px"></asp:TextBox>
				<img src= "../../images/icon/calendar.gif" alt="달력 선택" align="absmiddle" style="cursor:hand" onclick='popUpCalendar(this, <%=txtStartDate.ClientID%>, "yyyy-mm-dd",500,200,true);' /> ~
				<asp:TextBox ID="txtEndDate" runat="server" CssClass="input" Width="70px"></asp:TextBox>
				<img src= "../../images/icon/calendar.gif" alt="달력 선택" align="absmiddle" style="cursor:hand" onclick='popUpCalendar(this, <%=txtEndDate.ClientID%>, "yyyy-mm-dd",500,200,true);' /></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				접견자
			</td>
			<td style="background-color:#FFFFFF">
				<input type="text" name="displayName" value="<%=interviewUserName%>" class="input" size="24" readonly />
				<img src="../../images/icon/searchKor.gif" onclick="newWinByNameByScroll('../employee/searchEmployee.aspx','emplo',600,500)" style="cursor:hand;vertical-align:middle" alt="접견자 조회" />
				<input type="hidden" name="upnid" value="<%=interviewUserCode%>" />
			</td>
			<td style="background-color:#F5F5F5">
				접견장소
			</td>
			<td style="background-color:#FFFFFF">
				
				<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ObjectDataSource1"
					DataTextField="OfficeName" DataValueField="OfficeCode">
				</asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectOfficeList"
					TypeName="HanaMicron.COMS.BLL.Office">
					<SelectParameters>
						<asp:Parameter Name="keyWord" Type="String" />
						<asp:Parameter Name="key" Type="String" DefaultValue="A" />
					</SelectParameters>
				</asp:ObjectDataSource>
					</td>
			<td style="background-color:#F5F5F5">
				세부위치(10글자)
			</td>
			<td style="background-color:#FFFFFF">
				<asp:TextBox ID="txtOfficeContents" runat="server" CssClass="input" MaxLength="10"></asp:TextBox></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				차량번호
			</td>
			<td colspan="6" style="background-color:#FFFFFF">
				<input type="hidden" name="carCode" value="<%=carCode%>" />
				<input type="text" name="carNumber" value="<%=carNumber%>" size="24" class="input" readonly />
				<img src="../../images/icon/searchKor.gif" onclick="newWinByNameByScroll('../car/searchCar.aspx','car',600,500)" style="cursor:hand;vertical-align:middle" alt="차량 조회" />
				<img src="../../images/icon/write.gif" onclick="newWinByNameByScroll('../car/carEdit.aspx','car',600,500)" style="cursor:hand;vertical-align:middle" alt="차량 등록" />
				(고객사 임원 및 납품 차량에 한해 사내 출입이 가능합니다. Free Pass 요청 시 총무팀 합의 要)
				</td>
		</tr>
	</table>
	<br />
	<br />
	
	<table width="100%" style="background-color:#cccccc" cellpadding="6" cellspacing="1">
		<tr style="background-color:#FFFFFF">
			<td colspan="5" class="title"><strong>내방객 정보</strong></td>
			<td colspan="2" align="right">
				<input id="Button1" type="button" value="추가" onclick="insertRow()" />
				<input id="Button2" type="button" value="삭제" onclick="deleteRow()" /></td>
		</tr>
		<tr>
			<td colspan="8" style="background-color:#FFFFFF">
				<table id="visitorList" style="width: 100%" border="0">
				<tr>
					<td style="height: 21px">순번</td>
					<td style="height: 21px">선택</td>
					<td style="height: 21px">생년월일</td>
					<td style="height: 21px">성명</td>
					<td style="height: 21px">업체명</td>
					<td style="height: 21px">연락처</td>
				</tr>
				</table>
			</td>
		</tr>
	</table>
	<br />
	<br />
<%--	<table width="100%" cellpadding="6" cellspacing="1" border="0" style="background-color:#CCCCCC">
		<tr>
			<td colspan="2" class="title" style="background-color:#FFFFFF"><strong>첨부 파일</strong></td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				첨부파일 1
			</td>
			<td style="background-color:#FFFFFF">
				<asp:FileUpload ID="userFile1" runat="server" Width="400px" /> <asp:Label ID="lblUserFile1" runat="server" Text=""></asp:Label>
			</td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				첨부파일 2
			</td>
			<td style="background-color:#FFFFFF">
				<asp:FileUpload ID="userFile2" runat="server" Width="400px" /> <asp:Label ID="lblUserFile2" runat="server" Text=""></asp:Label>
			</td>
		</tr>
		<tr>
			<td style="background-color:#F5F5F5">
				첨부파일 3
			</td>
			<td style="background-color:#FFFFFF">
				<asp:FileUpload ID="userFile3" runat="server" Width="400px" /> <asp:Label ID="lblUserFile3" runat="server" Text=""></asp:Label>
			</td>
		</tr>
		
	</table>--%>
	<input type="hidden" name="approvalUserCode" />
	<input type="hidden" name="visitDataCode" value="<%=Request["visitDataCode"]%>"/>
	<input type="hidden" name="elecApproveCode" value="<%=approveDocCode%>" />
	<table width="100%">
		<tr><td align="center">
			<img src="../../images/icon/write.gif" style="cursor:hand" onclick="save()" alt="등록하기" />
			<img src="../../images/icon/cancel.gif" style="cursor:hand" onclick="history.go(-1)" alt="취소하기" /></td></tr>
	</table>
	</td>
	<td width="20" valign="top">&nbsp;</td>
</tr>
</table>

<!-- dummy -->
<iframe name="dummy" width="0" height="0"></iframe>

<script language="javascript" type="text/javascript">
var visitorCode=new Array();
var visitorRegNumber=new Array();
var visitorPassportNumber=new Array();
var visitorName=new Array();
var companyName=new Array();
var phone=new Array();
var startDate=new Array();
var endDate=new Array();
var check=<%=check%>;

<%=arrVisitorList%>
/*
visitorCode[0]='1070529';
visitorRegNumber[0]='760330-1663422';
visitorName[0]='김준용';
companyName[0]="하나마이크론(주)";
phone[0]='016-435-5094';
startDate[0]='2007-02-03';
endDate[0]='2007-02-03';
*/
//로딩하면서 초기 화면에 뿌리기
function display(displayCellCount){
	if(!displayCellCount) displayCellCount=defaultCellCount;
	for(var cellCount=0;cellCount<displayCellCount;cellCount++){
		insertRow();
	}
}

function dataBind(){
	var target=document.getElementById("visitorList");
	for(var i=0;i<visitorCode.length+1;i++){
		var rowCount=i+1;
		if(visitorCode[i]){
			target.rows[rowCount].cells[0].children[0].value=visitorCode[i];
			target.rows[rowCount].cells[2].children[0].value=visitorRegNumber[i];
			target.rows[rowCount].cells[3].children[0].value=visitorName[i];
			target.rows[rowCount].cells[4].children[0].value=companyName[i];
			target.rows[rowCount].cells[5].children[0].value=phone[i];
		}
	}
}

display(displayCellCount);
dataBind();

if(check == "1") check=true;
else check=false;

loadCheck(document.getElementById('longVisit'),check);

//var url="http://hananet:8899/LTM/noneAuth/crossDomainTest.aspx";
//document.getElementById("approveLine").src=url;
//getApproveLine();
</script>
</asp:Content>