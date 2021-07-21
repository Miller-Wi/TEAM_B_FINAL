<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
</head>
<body>
<body>
	<div class="container" style="margin-top: 150px;">
		<div id="contentsWrap">
			<div id="contents">
			
			<!-- ���������� ���� ���� -->
  <div class="head_tit"><h3>�� ���� �����غ���!</h3></div>
			 
				
				<h3>����ø��� �� ��Ʈ�������� ��ġ�� �ٲ�� ������ ���� �����ؾ���</h3>
				<div id="graph"></div>
				<!-- ���������� ���� �� -->

			</div>
		</div>
	</div>
</body>
<script>
$(function(){

        $.ajax({
            url:'http://192.168.0.5:8099/shop/myPortfolio?callback',
            type:'GET',
            dataType:'jsonp',
            success:function(data){
                console.log(data);
                Plotly.plot('graph', data, {});
            }
        });
});
</script>
</html>