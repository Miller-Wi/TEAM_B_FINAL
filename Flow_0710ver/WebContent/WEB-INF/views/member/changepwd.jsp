<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!doctype html>
<script>
//-----------��� Ȯ��------------------------
function check_pw(){
 
            var pw = document.getElementById('pwd').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 6 || pw.length>16){
                window.alert('��й�ȣ�� 6���� �̻�, 16���� ���ϸ� �̿� �����մϴ�.');
                document.getElementById('pwd').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% �� Ư�����ڰ� �� ���� �ʽ��ϴ�.')
                document.getElementById('pwd').value='';
            }
            if(document.getElementById('pwd').value !='' && document.getElementById('pwd-repeat').value!=''){
                if(document.getElementById('pwd').value==document.getElementById('pwd-repeat').value){
                    document.getElementById('check').innerHTML='��й�ȣ�� ��ġ�մϴ�.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='��й�ȣ�� ��ġ���� �ʽ��ϴ�.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
</script>


<div class="container" style="margin-top: 150px;">

		<!-- ��й�ȣ ���� (���) -->
		<div class="findBox">
			<div class="findTop">
				<div class="findImg">
					<div class="imgWrap"></div>
				</div>

				<div class="titWrap">
					<h4>
						<span class="em">��й�ȣ </span>�����ϱ�
					</h4>
					<span class="exp">
						<p>���ο� ��й�ȣ�� �Է� �� �ּ���</p>
					</span>
				</div>
			</div>

			<div class="find">
				<div class="titWrap">
					<h5>�� ��й�ȣ</h5>

				</div>
				<div class="inputWrap">
				<form action="pwdsuccess" method="post" nctype="multipart/form-data">
					<input type="hidden" id="m_name" name="m_name" value="${vo.m_name }">
					<input type="hidden" id="m_id" name="m_id" value="${vo.m_id }">
				
					 <input type="password"
						placeholder="�� ��й�ȣ �Է�" id="m_pwd" name=m_pwd onchange="check_pw()">
				</div>

				<div class="inputWrap">
					 <input type="password"
						placeholder="�� �� �� �Է�" id="pwd-repeat" name="pwd-repeat" onchange="check_pw()">
				</div>
				<div class="btnWrap">
				<button class="findBtn" type="submit" value="��й�ȣ ����" class="submit" class="findBtn" > �����ϱ� </button>
			 
					 		 </form>
				</div>
			</div>
		</div>
		<!-- ��й�ȣ ���� (�ϴ�) -->
