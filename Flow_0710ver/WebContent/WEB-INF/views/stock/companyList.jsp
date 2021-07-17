<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CompanyList</title>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div id="contentsWrap">
			<div id="contents">

				<!-- ���������� ���� ���� -->
  <div class="head_tit"><h3>���� �� ���� ��� ��� (���ͺ� ������ ���� �߰� ����, �ϴ� ��ü ��� ����Ʈ ���)</h3></div>
				<p>ȸ����� Ŭ���ϸ� �ڼ��� ������ Ȯ���� �� �ֽ��ϴ�.</p>
				<!-- ����Ʈ -->
				<div class="list_area">
					<table class="tb01" style="width:130%;" >
						<caption>�������� ���̺�</caption>
		 		 	<colgroup>
							<col width="8%" />
							<col width="10%" />
							<col width="15%" />
							<col width="20%" />
							<col width="10%" />
							<col width="8%" />
							<col width="8%" />
							<col width="15%" />
							<col width="8%" />
						</colgroup>
						<thead>
							<tr align="center">
								<th scope="col"><label>���� �ڵ�</label></th>
								<th scope="col"><label>ȸ���</label></th>
								<th scope="col"><label>����</label></th>
								<th scope="col"><label>�ֿ� ��ǰ</label></th>
								<th scope="col"><label>������</label></th>
								<th scope="col"><label>����</label></th>
								<th scope="col"><label>��ǥ�ڸ�</label></th>
								<th scope="col"><label>Ȩ������</label></th>
								<th scope="col"><label>����</label></th>
							</tr>
						</thead>
						
						<tbody> 
						<c:forEach var="c" items="${clist}">
							<tr>
								 <td>${c.c_code}</td>
								 <td><a href="companyDetail?c_code=${c.c_code}&slike_id=${sessionScope.sessionID}">
								 ${c.c_name}</a></td>
								 <td>${c.c_type}</td>
								 <td><font size=2>
								 ${c.c_product}</font></td>
								 <td>${c.c_ipo}</td>
								 <td>${c.c_closingmonth}</td>
								 <td>${c.c_ceo}</td>
								 <td><font size=2>
								 ${c.c_homepage}</font></td>
								 <td><font size=2>
								 ${c.c_location}</font></td>
							</tr>
							</c:forEach>
 

						</tbody>
					</table>
				</div>

				<!-- //����Ʈ -->
 

				<div></div>
				<!-- ���������� ���� �� -->

			</div>
		</div>
	</div>
</body>
</html>