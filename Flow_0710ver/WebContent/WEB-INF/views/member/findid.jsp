<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<div class="container" style="margin-top: 150px;">
 
		<!-- ���������� ���� ���� -->

		<!-- ���̵� ã�� (���) -->
		<div class="findBox">
			<div class="findTop">
				<div class="findImg">
					<div class="imgWrap"></div>
				</div>

				<div class="titWrap">
					<h4>
						<span class="em">���̵�</span>�� �ؾ�����̳���?
					</h4>
					<span class="exp">
						<p>�Ʒ� ������ �Է��Ͻþ� ���̵� ã�ƺ�����.</p>
					</span>
				</div>
			</div>

			<div class="find">
				<div class="titWrap">
					<h5>���̵� ã��</h5>

				</div>
				<div class="inputWrap">
					<label for="userEmail">�̸�</label> <input type="text"
						placeholder="�̸�" id="m_name" name=m_name>
				</div>

				<div class="inputWrap">
					<label for="m_tel">��ȭ��ȣ</label> <input type="text"
						placeholder="��ȭ��ȣ" id="m_tel" name="m_tel">
				</div>
				<div class="btnWrap">
					<button class="findBtn" type="button" onclick="findid()">Ȯ��</button>
					<button class="findBtn" type="button" onclick="history.back()">�ڷΰ���</button>
				</div>
			</div>

			<p>
				<span style="width: 30px;" id="target"></span>
			</p>


		</div>
		<!-- ���̵� ã�� (�ϴ�) -->


	</div>
	<script>
		function findid() {
			var m_name = $('#m_name').val();
			var m_tel = $('#m_tel').val();

			console.log('m_tel ::: ' + m_tel)

			$.ajaxSetup({
				cache : false
			});
			$.ajax({
				type : "GET",
				url : "findIDProcess?m_name=" + m_name + "&m_tel=" + m_tel,
				success : function(res) {
					console.log("result : " + res);
					if (res == 'null') {
						$('#target').html('������ �ش��ϴ� ���̵� �����ϴ�.');
					} else {
						$('#target').html(res);
					}
				},
				error : function(e) {
					console.log("error : " + e);
				}
			});

		}
	</script>