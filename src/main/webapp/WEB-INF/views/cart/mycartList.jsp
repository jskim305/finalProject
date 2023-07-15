<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<link href="${pageContext.request.contextPath}/resources/css/cart.css?v=<%System.currentTimeMillis(); %>" rel="stylesheet" />
</head>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="packagemain" name="title" />
</jsp:include>  


<main class="cartList-main">      
   <div class="cart-logo">
      <div class="cart-logo-text">
         <h2>${loginMember.memName}님</h2><h4>의 장바구니</h4>
      </div>
   </div>
   <div class="cart-container">
   <!-- <form name="frm"> -->
      <table class="cart-table">
         <tr>
            <td colspan="5" class="no-padding"  height="40px"><span id="selectAllBtn" onclick="toggleSelectAll()">전체 선택</span></td>
         </tr>
         
         <tr>
            <td colspan="5">
                <h1>일반 상품</h1>
            </td>
         </tr>
         <c:set var = "total" value = "0" />
         <c:choose>
            <c:when test="${empty cartItemList}">
               <tr>
                  <td colspan="5" height="40px">장바구니가 비어있습니다.</td>
               </tr>
            </c:when>
         <c:otherwise>
         <c:forEach items="${cartItemList}" var="Item">
            <tr>
               <td>
                  <input type="checkbox" value="{Item.cartNo}">
                  <input type="hidden" value="{Item.cartNo}">
                  <!-- 상품 수량과 상품 가격을 올바르게 입력하기 위한 로직 -->
                  <input type="hidden" class="itemPrice" value="${Item.itemPrice}">
                  <input type="hidden" class="cartCount" value="${Item.cartCount}">
                  <input type="hidden" class="cartNo" value="${Item.cartNo}">
               </td>
               <td>
                  <a class="cart-go-" href="${pageContext.request.contextPath}/item/itemForm.bo?itemNo=${Item.itemNo}" >
                       <img src="${pageContext.request.contextPath}/resources/images/itemlogo/${Item.itemLogo}" alt="logo"> 
                  </a>
               </td>
               <td>
                  <a href="${pageContext.request.contextPath}/item/itemForm.bo?itemNo=${Item.itemNo}" >
                     <h5 class="itemLocal">${Item.itemLocal}</h5>
                     <h5 class="itemname">${Item.itemName}</h5>
                     <h5 class="itemPrice">상품가격 <fmt:formatNumber value="${Item.itemPrice}" pattern="#,###"/>원</h5>
                     <h5 class="itemCount">재고량${Item.itemCount}</h5>
                  </a>
               </td>
               <td class="count-td">
                   <h4>
                     <c:set var="total" value="${Item.itemPrice * Item.cartCount}"/>
                     <fmt:formatNumber value="${total}" pattern="#,###"/>원
                   </h4>
                 <form action="${pageContext.request.contextPath}/cart/updateCart.ca" method="post">
                   <div class="quantity-control">
                     <button type="button" class="decrement-btn">-</button>
                     <input type="number" class="quantity-input" name="cartCount" value="${Item.cartCount}" min="1" max="${Item.itemCount}" readonly>
                     <button type="button" class="increment-btn">+</button>
                   </div>
                   <input type="hidden" name="cartNo" value="${Item.cartNo}">
                   <input type="hidden" name="memId" value="${loginMember.memId}">
                   <button type="submit" name="CountUpDate" class="CountUpDate-btn">수량변경</button>
                 </form>
               </td>
   
            <%--       <td>
                       <form action="${pageContext.request.contextPath}/cart/updateCart.ca" method="post">
                         <h4 class="cartCount">주문수량  </h4>
                         <select class="select-Count" name="cartCount">
                             <c:forEach var="i" begin="1" end="${Item.itemCount}">
                                 <option value="${i}" ${i == Item.cartCount ? 'selected' : ''}>${i}</option>
                             </c:forEach>
                         </select>   
                         <input type="hidden" name="cartNo" value="${Item.cartNo}">
                         <input type="hidden" name="memId" value="${loginMember.memId}">
                         <button type="submit" name="CountUpDate" class="CountUpDate-btn">수량변경</button>
                            <h4>
                               <c:set var="total" value="${Item.itemPrice * Item.cartCount}"/>
                            <fmt:formatNumber value="${total}" pattern="#,###"/>원
                        </h4>
                     </form>
                  </td> --%>
                  <td>               
                      <button class="buy-button">구매하기</button>
                     <form action="${pageContext.request.contextPath}/cart/deleteCart.ca" method="post">
                          <input type="hidden" name="cartNo" value="${Item.cartNo}">
                          <input type="hidden" name="memId" value="${loginMember.memId}">
                          <button class="remove-button" type="submit">삭제하기</button>
                     </form>
                  </td>
               </tr>
               <tr>
                  <th class="sumitemMoney" colspan="5" bgcolor="#f9f9f9" height="40px">
                     <span>일반 상품 합계 = <fmt:formatNumber value="${sumitemMoney}" pattern="#,###"/>원</span>
                  </th>
               </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>
      <tr>
         <td colspan="5">
             <h1>패키지 상품</h1>
         </td>
      </tr>
      <c:set var="total" value="0" />
         <c:choose>
            <c:when test="${empty cartPacList}">
               <tr>
                  <td colspan="5" height="40px">장바구니가 비어있습니다.</td>
               </tr>
            </c:when>
            <c:otherwise>
               <c:forEach items="${cartPacList}" var="Pac">
                  <tr>
                     <td>
                        <input type="checkbox"  value="{Pac.cartNo}">
                        <!-- 상품 수량과 상품 가격을 올바르게 입력하기 위한 로직 -->
                        <input type="hidden" class="itemPrice" value="${Pac.itemPrice}">
                        <input type="hidden" class="cartCount" value="${Pac.cartCount}">
                        <input type="hidden" class="cartNo" value="${Pac.cartNo}">
                     </td>
                     <td>
                        <a href="${pageContext.request.contextPath}/item/itemForm.bo?itemNo=${Item.itemNo}" >
                             <img src="${pageContext.request.contextPath}/resources/images/itemlogo/${Pac.itemLogo}" alt="logo"> 
                        </a>
                     </td>
                     <td>
                        <a href="${pageContext.request.contextPath}/item/itemForm.bo?itemNo=${Pac.itemNo}" >
                           <h5 class="itemLocal">${Pac.itemLocal}</h5>
                           <h5 class="itemname">${Pac.itemName}</h5>
                           <h5 class="itemPrice">상품가격 <fmt:formatNumber value="${Pac.itemPrice}" pattern="#,###"/>원</h5>
                           <h5 class="itemCount">재고량${Pac.itemCount}</h5>
                        </a>
                     </td>   
                     <td class="count-td">
                        <h4>
                           <c:set var="total" value="${Pac.itemPrice * Pac.cartCount}"/>
                           <fmt:formatNumber value="${total}" pattern="#,###"/>원
                        </h4>
                        <form action="${pageContext.request.contextPath}/cart/updateCart.ca" method="post">
                           <div class="quantity-control">
                              <button type="button" class="decrement-btn">-</button>
                              <input type="number" class="quantity-input" name="cartCount" value="${Pac.cartCount}" min="1" max="${Pac.itemCount}" readonly>
                              <button type="button" class="increment-btn">+</button>
                           </div>
                           <input type="hidden" name="cartNo" value="${Pac.cartNo}">
                           <input type="hidden" name="memId" value="${loginMember.memId}">
                           <button type="submit" name="CountUpDate" class="CountUpDate-btn">수량변경</button>
                        </form>
                     </td>
                     <td>               
                         <button class="buy-button">구매하기</button>
                        <form action="${pageContext.request.contextPath}/cart/deleteCart.ca" method="post">
                             <input type="hidden" name="cartNo" value="${Pac.cartNo}">
                             <input type="hidden" name="memId" value="${loginMember.memId}">
                             <button class="remove-button" type="submit">삭제하기</button>
                        </form>
                     </td>
                  </tr>
             </c:forEach>
         </c:otherwise>
      </c:choose>
      <tr>
         <th class="sumitemMoney" colspan="5" >
            <span>패키지 상품 합계 = <fmt:formatNumber value="${sumpacMoney}" pattern="#,###"/>원</span>
         </th>
      </tr>
      <tr>
         <td colspan="5" class="sumMoney">
            <h4>
               장바구니 금액 [
               <span>일반 상품 <fmt:formatNumber value="${sumitemMoney}" pattern="#,###"/>원</span> +
               <span>패키지 상품 <fmt:formatNumber value="${sumpacMoney}" pattern="#,###"/>원</span>] =
               <fmt:formatNumber value="${sumMoney}" pattern="#,###"/>원
            </h4>
         </td>
      </tr>
      <tr>
         <td colspan="5" class="no-padding"  style="height: 20px">
            <form action="${pageContext.request.contextPath}/cart/allDeleteCart.ca" method="POST">
               <input type="hidden" name="memId" value="${loginMember.memId}">
                <button type="submit" class="all-remove-button">장바구니 비우기</button>
            </form>
         </td>
      </tr>      
   </table>
</div>
<div class="cart-bar-box">
   <table class="cart-bar">
      <tr>
         <td colspan="3">${loginMember.memName}</td>
      </tr>
      <tr>
         <td colspan="3">
            <h4>기본 배송지</h4>
         </td>
      </tr>
      <tr>
         <td colspan="3">
            <h4>${loginMember.memAddr}</h4>
         </td>
      </tr>
      <tr>
         <td colspan="3">
            <hr class="underline">
            </td>
        </tr>   
      <tr>
            <td><h4>배송비</h4></td>
            <td>3,000</td>
            <td width="10px">원</td>
         </tr>
         <tr>
            <td colspan="3">
               <hr class="underline">
               </td>
            </tr>   
         <tr>
            <td><h4 class="red-text">결제예정 금액</h4></td>
             <td>
               <h2 class="red-text" id="payment-amount">
                  <fmt:formatNumber value="0" pattern="#,###"/>
               </h2>
             </td>
             <td><h2 class="red-text">원</h2></td>
             
         </tr>
         <tr>
             <td colspan="3" class="no-border">
                <button class="all-cart-buy-btn" onclick="placeOrder()">주문하기</button>
             </td>
         </tr>
      </table>
   </div>
</main>
<script type="text/javascript">

function updatePaymentAmount() {
   const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
   let totalAmount = 0;
   checkboxes.forEach(function(checkbox) {
      const cartCount = parseInt(checkbox.closest('tr').querySelector('.cartCount').value);
      const itemPrice = parseInt(checkbox.closest('tr').querySelector('.itemPrice').value);
      const amount = itemPrice * cartCount;
      totalAmount += amount;
   });
   
   document.getElementById('payment-amount').innerText = new Intl.NumberFormat('ko-KR').format(totalAmount);
}

// 체크박스 클릭 시, 결제예정 금액 업데이트
const checkboxes = document.querySelectorAll('input[type="checkbox"]');
checkboxes.forEach(function(checkbox) {
   checkbox.addEventListener('click', updatePaymentAmount);
});

function placeOrder() {
     const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
     const cartNos = [];
     
     checkboxes.forEach(function(checkbox) {
       const cartNo = checkbox.closest('tr').querySelector('.cartNo').value;
       cartNos.push(cartNo);
     });
     if (checkboxes.length === 0) {
          alert('결제할 상품이 없습니다.'); // 선택된 상품이 없을 때 알림창 띄우기
          return;
        }
     const form = document.createElement('form');
     form.method = 'POST';
     form.action = '${pageContext.request.contextPath}/cart/ordersForm'; // 결제 페이지 URL로 대체
     
     // cartNos를 hidden input 필드로 추가하여 데이터를 전송
     cartNos.forEach(function(cartNo) {
       const input = document.createElement('input');
       input.type = 'hidden';
       input.name = 'cartNos';
       input.value = cartNo;
       form.appendChild(input);
     });
     
     document.body.appendChild(form);
     form.submit();
   }
function toggleSelectAll() {
     const checkboxes = document.querySelectorAll('input[type="checkbox"]');
     const selectAllBtn = document.getElementById('selectAllBtn');
     const isAllChecked = checkboxes[0].checked;

     checkboxes.forEach(function(checkbox) {
       checkbox.checked = !isAllChecked;
     });

     selectAllBtn.textContent = isAllChecked ? '전체 선택' : '전체 해제';

     // 전체 선택 상태 변경 후 결제 예정 금액 업데이트
     updatePaymentAmount();
   }
//수량 감소 버튼 클릭 이벤트 처리
document.querySelectorAll('.decrement-btn').forEach(function(button) {
  button.addEventListener('click', function() {
    var quantityInput = this.parentElement.querySelector('.quantity-input');
    var currentValue = parseInt(quantityInput.value);
    var minValue = parseInt(quantityInput.getAttribute('min'));
    if (currentValue > minValue) {
      quantityInput.value = currentValue - 1;
    }
  });
});

// 수량 증가 버튼 클릭 이벤트 처리
document.querySelectorAll('.increment-btn').forEach(function(button) {
  button.addEventListener('click', function() {
    var quantityInput = this.parentElement.querySelector('.quantity-input');
    var currentValue = parseInt(quantityInput.value);
    var maxValue = parseInt(quantityInput.getAttribute('max'));
    if (currentValue < maxValue) {
      quantityInput.value = currentValue + 1;
    }
  });
});
</script>