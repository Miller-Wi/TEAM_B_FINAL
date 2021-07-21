<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
							<col width="10%" /> <!-- �����ڵ� -->
							<col width="20%" /> <!-- ȸ��� -->
							<col width="20%" /> <!-- ���簡 -->
							<col width="10%" /> <!-- ���ϰ� -->
							<col width="10%" /> <!-- �ð� -->
							<col width="15%" /> <!-- �� -->
							<col width="10%" /> <!-- ���� -->
							<col width="10%" /> <!-- �ŷ��� -->
						</colgroup>
						<thead>
							<tr align="center">
								<th scope="col"><label>���� �ڵ�</label></th>
								<th scope="col"><label>ȸ���</label></th>
								<th scope="col"><label>���簡 <br>
								<font size=2 style="font-weight:normal">( <fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" />  ���� )</font> </label></th>
							<th scope="col"><label>���ϰ�</label></th>
							<th scope="col"><label>�ð�</label></th>
							<th scope="col"><label>�� / ���Ѱ� </label></th>
							<th scope="col"><label>����</label></th>
							<th scope="col"><label>�ŷ���</label></th>
							</tr>
						</thead>
						
						<tbody> 
						<c:forEach var="c" items="${slist}" >
							<tr>
								 <td>${c.c_code}</td>
								 <td><a href="companyDetail?c_code=${c.c_code}&slike_id=${sessionScope.sessionID}">${c.c_name}</a></td>
								  <td>${c.price} �� <br>
				
                 				  <c:if test="${c.compare == '�϶� -'}">
								  <font size=2 color="blue">�� ${c.com_price} �� / ${c.com_percent} %</font></c:if>
				 				  <c:if test="${c.compare == '��� +'}">
								  <font size=2 color="red">�� ${c.com_price} �� / ${c.com_percent} %</font></c:if>
								  
								  </td> 
								  <td>${c.exday} </td>
								  <td>${c.open}</td>
								  <td>${c.high}</td>
								  <td>${c.low}</td>
								  <td>${c.volume} ��</td>
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