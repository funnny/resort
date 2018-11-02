<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	table{
		border-collapse: collapse;
		margin-left: 20px;
	}
	th{
		background-color: #f6f6f6;
		height: 30px;
		text-align: center;
		border: 1px solid #ddd;
	}
	td{
		height: 30px;
		text-align: center;
		border: 1px solid #ddd;
	}
	.mt10{
		margin-top: 10px;
	}
	#paging{
		text-align: center;
	}
	#cnt{
		float: right;
		margin-right: 100px;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	settingYear($("#prevYear"));
	settingMonth($("#prevMonth"));
	settingYear($("#nextYear"));
	settingMonth($("#nextMonth"));
});
	
function settingYear(year){
	var date = new Date();
	var y = date.getFullYear();
	
	for(var i=1900; i<=y; i++){
		year.prepend("<option value='"+i+"'>"+i+"</option>")
	}
	year.prepend("<option value=''>---</option>");
	year.find("option:eq(0)").prop("selected",true);
	
}
function settingMonth(month){
	month.append("<option value=''>---</option>");
	for(var i=1; i<=12; i++){
		month.append("<option value='"+i+"'>"+i+"</option>");
	}
}
function changeDay(yearId, monthId, dayId){
	var year = $("#"+yearId).val().trim();
	var month = $("#"+monthId).val().trim();
	var day= $("#"+dayId);
	
	if(year!="" && month!=""){
		if(month==4 || month==6 || month==9 || month==11){
			settingDay(day,30);
		}else if(month==2){
			if(year % 4 ==0 && (year % 400 ==0 || year % 100 !=0)){
				settingDay(day,29);
			}else{
				settingDay(day,28);
			}
		}else{
			settingDay(day,31);
		}
	}
}
function settingDay(day, d){
	day.empty();
	day.append("<option value=''>---</option>");
	for(var i=1; i<=d; i++){
		day.append("<option value='"+i+"'>"+i+"</option>");
	}
}
function doSearch(val){
	switch(val){
		case "search" :
		checkDay();
		break;
		
		default:
		break;
		
	}
}
function checkDay(){
	var prevYear = $("#prevYear").val();
	var prevMonth = $("#prevMonth").val();
	var prevDay = $("#prevDay").val();
	var nextYear = $("#nextYear").val();
	var nextMonth = $("#nextMonth").val();
	var nextDay = $("#nextDay").val();
	
	if(prevYear!='' && prevMonth!='' && prevDay!='' && nextYear!='' && nextMonth !='' && nextDay !=''){
		var prev = ''+prevYear+prevMonth+prevDay;
		var next = ''+nextYear+nextMonth+nextDay;
		if(prev > next){
			alert("�������� �ּҳ�¥�� �ִ볯¥���� Ů�ϴ�.");
			return false;
		}
	}else{
		alert("�������� ������ �������ּ���.");
		return false;
	}
}
</script>
</head>
<body>
<form action="jeon.do" method="post" name="frm">
	<table cellpadding="0" cellspacing="0" class="mt10">
		<colgroup>
			<col width="100">
			<col width="250">
			<col width="100">
			<col width="200">
			<col width="100">
			<col width="200">
		</colgroup>
		<tr>
			<th colspan="6">��� ���� �˻�</th>
		</tr>
		<tr>
			<th>�̸�</th>
			<td><input type="text" name="name" id="name"></td>
			<th>����</th>
			<td>
				<label><input type="checkbox" name="sex" value="male">��</label>
				<label><input type="checkbox" name="sex" value="female">��</label>
			</td>
			<th>����</th>
			<td>
				<select name="religion">
					<option value="">
						---
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>�з�</th>
			<td>
				<label><input type="checkbox" name="level" value="highschool">����</label>
				<label><input type="checkbox" name="level" value="college">��������</label>
				<label><input type="checkbox" name="level" value="university">����</label>
			</td>
			<th>���</th>
			<td colspan="3">
				<label><input type="checkbox" name="skill" value="Java">Java</label>
				<label><input type="checkbox" name="skill" value="JSP">JSP</label>
				<label><input type="checkbox" name="skill" value="ASP">ASP</label>
				<label><input type="checkbox" name="skill" value="PHP">PHP</label>
				<label><input type="checkbox" name="skill" value="Delphi">Delphi</label>
			</td>
		</tr>
		<tr>
			<th>������</th>
			<td colspan="5">
				<select name="prevYear" id="prevYear" onchange="changeDay('prevYear','prevMonth','prevDay')">
				</select>��
				<select name="prevMonth" id="prevMonth" onchange="changeDay('prevYear','prevMonth','prevDay')">
				</select>��
				<select name="prevDay" id="prevDay">
				</select>�� ~
				
				<select name="nextYear" id="nextYear" onchange="changeDay('nextYear','nextMonth','nextDay')">
				</select>��
				<select name="nextMonth" id="nextMonth" onchange="changeDay('nextYear','nextMonth','nextDay')">
				</select>��
				<select name="nextDay" id="nextDay">
				</select>��
			</td>
		</tr>
	</table>
	<div class="mt10">
		<input type="button" onclick="doSearch('search');" value="�˻�" style="margin-left: 360px; width: 200px;">
		<input type="button" value="���ΰ˻�" style="margin-left: 200px;">
		<input type="button" value="�ʱ�ȭ" style="margin-left: 5px;">
		<input type="button" value="���" style="margin-left: 5px;">		
	</div>
	<div id="cnt" class="mt10">�˻��Ǽ� --> 18��</div>
	<p style="clear: both;"></p>
	<table class="mt10">
		<colgroup>
			<col width="100">
			<col width="200">
			<col width="100">
			<col width="200">
			<col width="200">
			<col width="150">
		</colgroup>
		<tr>
			<th>��ȣ</th>
			<th>�̸�</th>
			<th>����</th>
			<th>����</th>
			<th>������</th>
			<th></th>
		</tr>
		<tr>
			<td>1</td>
			<td>���Ȱ�</td>
			<td>��</td>
			<td>õ�ֱ�</td>
			<td>1963-12-25</td>
			<td><input type="button" value="����/����"></td>
		</tr>
	</table>
	<div id="paging" class="mt10"> [1] 2 3 4</div>
</form>
</body>
</html>