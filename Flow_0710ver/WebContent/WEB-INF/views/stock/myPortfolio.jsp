<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>myPortfolio</title>

</head>
<body>
<body>
	<div class="container" style="margin-top: 150px;">
		<div id="contentsWrap">
			<div id="contents">
			
			<!-- ���������� ���� ���� -->
  <div class="head_tit"><h3>�������� ����Ʈ</h3></div>
			 
				<!-- ����Ʈ -->
				<div class="list_area">
					<table class="tb01" style="width:130%;" >
						<caption>�������� ����Ʈ</caption>
		 		 	<colgroup>
							<col width="20%" />
							<col width="50%" />
							<col width="30%" />
						</colgroup>
						<thead>
							<tr align="center">
								<th scope="col"><label>���� �ڵ�</label></th>
								<th scope="col"><label>ȸ���</label></th>
								<th scope="col"><label>���簡</label></th>
							</tr>
						</thead>
						
						<tbody> 
						<c:forEach var="c" items="${slist}">
							<tr>
								 <td>${c.c_code}</td>
								 <td><a href="companyDetail?c_code=${c.c_code}&slike_id=${sessionScope.sessionID}">${c.c_name}</a></td>
								 <td>�߰� ����</td>
							 
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