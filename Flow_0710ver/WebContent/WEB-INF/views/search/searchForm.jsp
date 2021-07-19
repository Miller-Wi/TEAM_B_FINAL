<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- //���� ���� -->
<div class="container" style="margin-top: 150px;">
	<div id="contentsWrap">
		<div id="contents">

			<!-- ���������� ���� ���� -->
			<div class="head_tit">
				<h3></h3>
			</div>

			<!-- ����Ʈ -->
			<form name="f"  autocomplete="off">
				<input type="text" style="width: 300px;" name="word" id="word"
					onkeydown="startSuggest();" /> <input type="submit" value="�˻�" />
				<div id="view"></div>
			</form>

			<!-- //����Ʈ -->



			<div></div>
			<!-- ���������� ���� �� -->

		</div>
	</div>
</div>

<script src="resources/js/httpRequest.js"></script>
<script src="resources/js/json2.js"></script>
<script>
	var lastkey = ''; // ����Ű
	var check = false; // �˻� üũ ����
	var loopkey = false; // ���� ����

	function startSuggest() {
		console.log("key push!");
		// ���� �˻��� ��� 0.5 ��� �� sendKeyword()ȣ��
		if (check === false) {
			setTimeout("sendKeyword();", 500);
			loopkey = true;
		}
		check = true;
	}

	function sendKeyword() {
		// Ű���带 �޾Ƽ� �Ķ���͸� AJAX�� �����ϴ� �Լ�
		if (loopkey === false) {
			return;
		}
		var key = f.word.value; // document.getElementById()�� ��ü ����
		// ���� ���ų� �����϶�
		if (key === '' || key === ' ') {
			lastkey = '';
			document.getElementById("view").style.display = 'none';
		} else if (key !== lastkey) {
			// �˻��� �ٸ� ��� ������ ����
			lastkey = key;
			console.log("param : " + key);
			sendRequest("search?key=" + key, null, res, "get");
		} else if (key === lastkey) {
			console.log("key ===lastkey")
		}
		setTimeout("sendKeyword();", 500);
	}
	var jsonObj = null;
	function res() {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				var response = xhr.responseText;
				jsonObj = JSON.parse(response);
				console.log("-----------------");
				console.log(jsonObj);
				viewTable();
			} else {
				document.getElementById("view").style.display = 'none';
			}
		}
	}

	function viewTable() { //callback ���� json �����͸� ui�� ǥ��
		var vD = document.getElementById("view");
		var htmlTxt = "<table width='300' border='0' cellspacing='0'>";

		for (var i = 0; i < jsonObj.length; i++) {
			htmlTxt += "<tr>";
			htmlTxt += "<td style='cursor:pointer;' ";
			htmlTxt += "onmouseover='this.style.background=\"silver\"' ";
			htmlTxt += "onmouseout='this.style.background=\"white\"' ";
// 			htmlTxt += "onclick='select(" + i + ")'>" + jsonObj[i];
            htmlTxt += "onclick='search(" + parseInt(jsonObj[i]['c_code'], 10) + ")'>" ;
            htmlTxt += jsonObj[i]['c_code'] +" : " + jsonObj[i]['c_name'];
			htmlTxt += "</td></tr>"
		}
		htmlTxt += "</table>";
		vD.innerHTML = htmlTxt;
		vD.style.display = "block";
	}
	function select(i) {
		f.word.value = jsonObj[i];
		document.getElementById("view").style.display = 'none';
		check = false;
		loopkey = false;
	}
	function search(code) {
		code = String(code).padStart(6, '0');
		location.href="companyDetail?c_code="+code+"&slike_id="
	}
</script>