<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ��� ���� ���� -->
   <!-- �� ��� ���� ���� -->
    <div id="header">
        <div class="headerWrap">
         <div class="headerTop">
            <h1><a href="index"><img src="resources/images/logo.svg" style="width: 120px; padding-top: 5px"/></a></h1>
            <div class="util_menu">
            <form name="selectOne" method="post">
               <ul>
               <c:choose>
                 <c:when test="${sessionScope.sessionID == null}">
                  <li><a href='signup'>JOIN</a></li>
                  <li><a href='loginForm'>LOGIN</a></li>
               </c:when>
               <c:when test="${sessionScope.sessionID != null}">
                  <li>${sessionScope.sessionName}�� �ݰ����ϴ�</li>
                  <li><a href='selectUserInfoView'>MY PAGE</a></li>
                  <li><a href='logout'>LOGOUT</a></li>
               </c:when>
               </c:choose>   
                  <li><a href="/sitemap/main.do">SITE MAP</a></li>
               </ul>
               </form>
            </div>
         </div>
            <ul class="gnb">
                <li>
                    <a href="#">Flow �Ұ�</a>
                    <ul class="first">
                        <li><a href="/intro/main.do">����API �Ұ�</a></li>
                        <li><a href="/intro/infoApiList.do">����API ���� �Ұ�</a></li>
                  <li><a href="/intro/terms.do">�̿���</a></li>
                  <li><a href="/intro/confirm.do">�������� �����̿뵿��</a></li>
                    </ul>
                </li>
                <li>
                     <a href="#">���� �繫/�ڻ�</a>
                    <ul>
                  <li><a href="/uss/umt/EgovMberInsertView.do">����Ű ��û</a></li>
                  <li><a href="/mng/userApiKeyListView.do">����Ű ����</a></li>
                        <li><a href="/mng/apiUsageStatusView.do">����API �̿���Ȳ</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">�ֽ� �� �������</a>
                    <ul>
                        <li><a href="companyList">���� ��� ����</a></li>
                 
                  <li><a href="/guide/main.do?apiGrpCd=DS003">���� �м�</a></li>
                  <li><a href="/guide/main.do?apiGrpCd=DS004">�ǽð� ����</a></li>
                  <li><a href="economicIndication">���� ��ǥ</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">My Flow (ȸ������)</a>
                    <ul>
                    <li><a href="#">���� ��Ʈ������</a></li>
                   <li><a href="myStock?slike_id=${sessionScope.sessionID}">��������</a></li>
                  <li><a href="/disclosureinfo/biz/main.do">�м��ڷ����ָ޴�</a></li>
                  <li><a href="/disclosureinfo/fnltt/singl/main.do">�繫������ȸ</a></li>
                  <li><a href="/disclosureinfo/fnltt/dwld/main.do">�繫�����ϰ��ٿ�ε�</a></li>
                 
                    </ul>
                </li>
                <li>
                    <a href="/cop/bbs/selectArticleList.do?bbsId=B0000000000000000001">����â��</a>
                    <ul>
                        <li><a href="/cop/bbs/selectArticleList.do?bbsId=B0000000000000000001">��������</a></li>
                  <li><a href="/cop/bbs/selectArticleList.do?bbsId=B0000000000000000002">FAQ </a></li>
                  <li><a href="/cop/bbs/selectArticleList.do?bbsId=B0000000000000000003">Q&A</a></li>
                  <li><a href="/cop/bbs/selectArticleList.do?bbsId=B0000000000000000004">���������˸�</a></li>
                    </ul>
                </li> 
            </ul>
        </div>
        <div class="bg01"></div>
    </div>
   <!-- �� ��� ���� �� -->
   <!-- ��� ���� �� --> 