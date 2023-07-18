<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  


<head>
<link href="${pageContext.request.contextPath}/resources/css/item.css?v=<%System.currentTimeMillis(); %>" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="packagemain" name="title" />
</jsp:include>  

<div class="item-logo">
    <div class="item-logo-text">
        <p id="text1">베지팜은 파트너 농가와 함께 합니다.</p>
    </div>
</div>
<div class="item-container"> 
    <jsp:include page="/WEB-INF/views/item/sidebar.jsp">
        <jsp:param value="packagemain" name="title" />
    </jsp:include>  
    <main class="itemList-main">    
        <c:if test="${loginMember.admin =='1'}">
             <button class="ListInsert-btn" onclick="location.href='${pageContext.request.contextPath}/item/insertList.bo?itemType=item'">상품 추가하기</button>
        </c:if>
        <c:forEach items="${itemlist}" var="item">
        
            <a data-target="#myModal" data-toggle="modal" data-no="${item.itemNo}" data-name="${item.itemName}" data-price="${item.itemPrice}" data-local="${item.itemLocal}" data-count="${item.itemCount}" data-logo="${item.itemLogo}">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/resources/images/itemlogo/${item.itemLogo}" alt="logo">
                    <span class="itemName">${item.itemName}</span>
                    <p>${item.itemLocal}</p>
                    <p><fmt:formatNumber value="${item.itemPrice}" pattern="#,###"/>원</p>
                </div>
            </a>
        </c:forEach>
    </main>

        <div class="modal" id="myModal" tabindex="-1">
            <div class="modal-dialog" style="max-width: 850px; max-height: 500px;">
                <div class="modal-content" style="max-height: 500px;">
                    <div class="modal-header">
                        <span class="modal-title">일반 상품 </span>
                        <button class="close" data-dismiss="modal">x</button>
                    </div>
                    <div class="modal-body">
                        <main class="item-main">
                            <div id="item-select">
                                <div id="itemSelect-img">
                                    <img id="modalItemLogo" src="" alt="logo">
                                </div>
                                <div class="info-area">
                                    <div class="info-area_name">
                                        <span id="modalItemName"></span>
                                    </div>
                                    <div class="info-area_price">
                                        <span id="modalItemPrice"></span> <span class="won">원</span>
                                    </div>
                                    <div class="info-area_itemCount">
                                       <span class="won">총 수량</span> <span id="modalitemCount"></span>
                                    </div>
                                    <div class="info-area_farmBox">
	                                    <div class="info-area_title">
                                            <span >생산지</span>
	                                    </div>
                                        <div class="info-area_farm">
                                            <span id="modalItemLocal"></span>
                                        </div>
                                    </div>
                                    <div class="item-sulyangBox">
                                        <div class="info-area_title">
                                            <span>구매 수량</span>
                                        </div>
                                        <div class="info-area_number">                      
                                    	    <form name="cart">
           										<input  type="hidden" name="memId" value="${loginMember.memId}">					
												<input id="itemNo" type="hidden" name="itemNo" value="">			
									            <input type="number" name="cartCount" min="1" max="" value="1" onchange="updateTotalPrice(this)">
											</form>
                                         </div>
                                    </div>
                                    <div class="info-area_priceBox">
                                        <div class="info-area_title">
                                            <span>총 상품 금액</span>
                                        </div>
                                        <div class="total_price">
                                       		<span id="total_price"></span><span>원</span>
                                        </div>
                                    </div>  
                                    <div class="info-area_btn">
                                        <button id="info-area_btn" onclick="insertCart()">장바구니</button>
                                    </div>
                                </div>
                                <c:if test="${ loginMember.admin =='1'}">
                                    <form action="${pageContext.request.contextPath}/item/deleteItem.bo" method="post">
                                        <input type="hidden" name="itemNo" value="${item.itemNo}">
                                        <button class="remove-button" type="submit">삭제하기</button>
                                    </form>    
                                    <button class="Update-button" onclick="Updata(${item.itemNo})">수정하기</button>
                                </c:if>
                            </div>
                        </main>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script>
$("a[data-target='#myModal']").click(function() {
	var itemNo = $(this).data('no');
    var itemName = $(this).data('name');
    var itemLocal = $(this).data('local');
    var itemPrice = $(this).data('price');
    var itemLogo = $(this).data('logo');
    var itemCount = $(this).data('count');
    var count = parseInt($("input[name='cartCount']").val());
    var total_price = itemPrice * count;
    
    $("#modalitemCount").text(itemCount);
    $('input[name="itemNo"]').val(itemNo);
    $('input[name="cartCount"]').attr('max', itemCount);
    $("#modalItemName").text(itemName);
    $("#modalItemLocal").text(itemLocal);
    $("#modalItemPrice").text(itemPrice.toLocaleString());
    $("#modalItemLogo").attr('src', '${pageContext.request.contextPath}/resources/images/itemlogo/' + itemLogo);
    $("#total_price").text(total_price.toLocaleString());
    $("#itemNo").val(itemNo);
});
function updateTotalPrice(input) {
    var itemPrice = parseFloat($("#modalItemPrice").text().replace(/,/g, ''));
    var count = parseInt(input.value);
    var total_price = itemPrice * count;
    $("#total_price").text(total_price.toLocaleString());
}
    
const insertCart = () => {
    cart.method = 'post';
    cart.action = '${pageContext.request.contextPath}/cart/insertCart.ca';
    cart.submit();
}
</script>