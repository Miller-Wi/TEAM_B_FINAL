<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- Ajax�� �ܺ� ���̺귯�� ��� -->
<script src="resources/js/httpRequest.js"></script>
 
</script>
<!-- ��й�ȣ ã�� (���) -->
<body>
<div class="container" style="margin-top: 150px;">
	<form action="findPWDProcess" method="post">
		<div class="findBox">
			<div class="findTop">
				<div class="findImg">
					<div class="imgWrap"></div>
				</div>

				<div class="titWrap">
					<h4>
						<span class="em">��й�ȣ</span>�� �ؾ�����̳���?
					</h4>
					<span class="exp">
						<p>�Ʒ� ������ �Է��Ͻþ� ��й�ȣ�� ã�ƺ�����.</p>
					</span>
				</div>
			</div>

			<div class="find">
				<div class="titWrap">
					<h5>��й�ȣ ã��</h5>
				</div>
				<div class="inputWrap">
					<label for="userEmail">���̵�</label> <input type="text" required
						placeholder="���̵�" id="m_id" name=m_id>
				</div>
				<div class="inputWrap">
					<label for="userEmail">�̸�</label> <input type="text" required
						placeholder="�̸�" id="m_name" name=m_name>
				</div>

				<div class="inputWrap">
					<label for="m_tel">��ȭ��ȣ</label> <input type="text" required
						placeholder="��ȭ��ȣ" id="m_tel" name="m_tel">
				</div>
				<div class="inputWrap">
					<input type="text" name="jumin1" id="jumin1" maxlength="6" required
						placeholder="�ֹε�Ϲ�ȣ" style="width: 50%;"> - <input
						type="password" name="jumin2" id="jumin2" maxlength="1" required
						style="width: 45%;">
				</div>

				<div class="btnWrap">
					<button class="findBtn" type="submit">Ȯ��</button>
					<button class="findBtn" type="button" onclick="history.back()">�ڷΰ���</button>
				</div>
			</div>

			<p>
				<span style="width: 30px;" id="target"></span>
			</p>


		</div>
		<!-- ��й�ȣ ã�� (�ϴ�) -->


	</form>
</div>
</body>