<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">


<jsp:include page="/WEB-INF/views/common/header.jsp"/>







<head>
  <title>무통장 입금 안내</title>
</head>
<body>
  <h1>무통장 입금 안내</h1>
  <p>아래는 무통장 입금을 위한 계좌 정보입니다. 입금 시 아래 계좌로 송금해주시기 바랍니다.</p>
  <table>
    <tr>
      <th>베지은행</th>
      <th>352-1234-1234-12</th>
      <th>예금주:베지팜</th>
    </tr>
    <tr>
      <th>팜팜은행</th>
      <th>352-1234-1234-12</th>
      <th>예금주:베지팜</th>
    </tr>
  </table>
  <p>입금 완료 후 아래 연락처로 연락하여 입금 확인을 안내해주시기 바랍니다.</p>
  <p>베지팜 고객센터: 010-1234-5678</p>
  <p>이메일: vegefarm@example.com</p>
</body>


<div>
<img alt="" src="${pageContext.request.contextPath}/resources/images/money.jpg">
</div>
</html>







<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>



