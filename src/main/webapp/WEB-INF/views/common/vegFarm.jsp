<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>베지팜 - 야채 판매 및 농장 체험</title>
    <style>
        /* CSS 스타일링 */
        .body {
            width: 900px;
            font-family: Arial, sans-serif;
            margin: 0 auto;
            padding: 0;
            background-color: #F6F6F6;
        }

        .vegfarm {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
            text-align: center;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .vegfarm>h1 {
            font-size: 32px;
            color: #333333;
        }

        .vegfarm>p {
            font-size: 18px;
            line-height: 1.5;
            color: #666666;
        }

       

        .vegfarm>.button:hover {
            background-color: #45a049;
        }
         .green-button {
        background-color: #45a049;
        color: #ffffff;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .green-button:hover {
        background-color: #2e7d31;
    }
        
    </style>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<br><br><br><br>
<body class="body">
<div class="vegfarm">
    <h1>베지팜이란</h1>
      <p>
	       베지팜 (VEGFARM)은 야채(vegetable)와 농장(farm)을 합친 단어로, 농장에서 바로 기른 신선한 야채를 소비자에게 제공하는 서비스입니다.<br>
	
			여러분은 베지팜을 통해 야채를 구매할 뿐만 아니라 직접 농지에서의 체험을 즐길 수 있습니다.<br>
			 도시 생활에서 답답함을 느꼈던 여러분께서 이제는 농지에서 직접 작물을 기르고 수확하는 즐거움을 누릴 수 있습니다.<br>
			
			베지팜은 여러분의 유기농 친환경 라이프를 응원합니다.<br> 
			우리는 최고의 품질을 위해 철저한 품질 관리를 실시하며, 농약이나 합성 비료를 사용하지 않는 100% 유기농 방식으로 작물을 재배합니다.<br>
			 이로써 여러분과 가족들에게 건강과 안전을 제공할 수 있습니다.<br><br>
			
			베지팜은 다양한 야채를 제공하며 계절에 따라 신선한 작물을 공급합니다.<br>
			 여러분은 편리하게 선택한 야채를 주문하고 집으로 배송받을 수 있습니다.<br>
			  또한 농장 방문을 통해 직접 작물을 선택하고 수확하는 즐거움도 느껴보세요.<br>
			  이는 특별한 추억으로 남을 것입니다.<br><br>
			
			베지팜은 지속 가능한 농업과 환경 보호를 추구합니다.<br>
			 지구와 자연을 위해 지속 가능한 재료 사용과 자원 관리, 친환경적인 생산 방법을 최대한 적용하고 있습니다.<br>
			  여러분의 지원과 참여는 우리의 이상을 실현하는 데 큰 도움이 됩니다.<br>
			
			지금 바로 베지팜과 함께 유기농 친환경 라이프를 시작해보세요! 여러분의 건강과 지구의 미래를 위한 소중한 선택입니다.
	  </p>
	  <br><br>
    <button class="green-button" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">베지팜즐기기</button>
</div>
<br><br><br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>

