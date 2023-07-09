<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>베지팜 - 야채 판매 및 농장 체험</title>
    <style>
        /* CSS 스타일링 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
            text-align: center;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 32px;
            color: #333333;
        }

        p {
            font-size: 18px;
            line-height: 1.5;
            color: #666666;
        }

        .button {
            display: inline-block;
            padding: 12px 24px;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            color: #ffffff;
            background-color: #4caf50;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container">
    <h1>베지팜이란</h1>
    <p>
        베지팜(VEGIFARM)은 vegetable즉 야채의의 약자 veg와 농장의 약자 farm를 합친 단어로, 농장에서 기른 야채를
        관리자를 통해 즉시 소비자로 판매되며, 중간 유통과정을 생략하여 신선한 야채를 바로 받아보실 수 있습니다.
    </p>
    <p>
        야채를 구매하는 것뿐만 아니라 직접 농지 체험도 할 수 있습니다. 답답한 도시에서 숨막혔던 당신, 이제는 농지에서 직접
        작물을 기르며 직접 기르고 채취까지 할 수 있습니다.
    </p>
    <p>베지팜에서 당신의 유기농 친환경 라이프를 즐기세요.</p>
    <a class="button" href="/WEB-INF/index.jsp">지금 시작하기</a>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
