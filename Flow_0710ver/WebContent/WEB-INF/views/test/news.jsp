<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.boxwrap {
    display:table;
    width:100%;
    table-layout: fixed;
}
 
.boxwrap .box {
    display:table-cell;
    vertical-align: middle;
}
</style>
<!-- //���� ���� -->
<div class="container" style="margin-top: 150px;">
	<div id="contentsWrap">
		<div id="contents">

			<!-- ���������� ���� ���� -->
			<div class="head_tit">
				<h3>
				</h3>
			</div>

			<!-- ����Ʈ -->
			<div class="mainBoardWarp">
				<div class="mainBoard" style="width:40rem">
					<h4>
						�ǽð� ����</h4>
					<ul>
					<c:forEach var="e" items="${list}">
					<li>
					<a href=${e.href }>${e.title }</a>
					</li>
					
					</c:forEach>
					
					</ul>
				</div>
			</div>

			<!-- //����Ʈ -->



			<div></div>
			<!-- ���������� ���� �� -->

		</div>
	</div>
</div>