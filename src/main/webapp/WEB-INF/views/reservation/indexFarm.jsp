<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="vegform" name="title" />
</jsp:include>

   <!-- swpier 슬라이드 -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
   <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 <style>
         .reservation-info{display: flex; justify-content: space-between; margin: 70px 0}
         .reservation-info > div {width: 46%}
         .reservation-info .map-area {text-align: center}
         .reservation-info .info-area ul {background: #f3f3f3; overflow-y: auto; height: 370px; padding: 20px}
         .reservation-info .info-area li+li {margin-top: 15px}
         .reservation-info .info-area .title {margin-bottom: 3px; font-weight: bold}
         .reservation-info .btn-area {margin-top: 20px; text-align: center}
         .reservation-info .btn-area button {width: 100px; padding:10px 0; border: 0; cursor: pointer}
         .reservation-info .btn-area button+button {margin-left: 5px}
         .reservation-info .btn-area .btn-reservation {background: #73a839; color: #fff}
         .reservation-info .map-area area {cursor: pointer}
         .photo-area {margin-bottom: 70px}
         .photo-area .title {display: block; margin-bottom: 15px; position: relative; padding-left: 10px}
         .photo-area .title:before {content: ""; position: absolute; top: 2px; left: 0; width: 3px; height: 18px; background: #333}
         .photo-area img {width: 100%; vertical-align: top}
         .photo-area .swiper-button-next, .photo-area .swiper-button-prev{color: #73a839}
      </style>
      <div class="container">   
         <div class="reservation-info">
            <!-- 지도영역 -->
            <div class="map-area">
               <img
                  src="${pageContext.request.contextPath}/resources/images/imgmap.png"
                  usemap="#image-map" class="mapImg" >
                  
               <map name="image-map">
               
                  <area target="_blank" alt="군포" title="군포주말농장" onblur="this.focus()" nohref
                     coords="141,313,130,322,123,333,134,335,145,332,150,321"
                     shape="poly"
                      id="idx1">
                  <area target="_blank" alt="양주" title="양주" nohref
                     coords="159,211,146,211,137,208,140,190,141,177,133,172,131,158,142,151,147,137,153,124,162,127,165,139,172,146,187,151,190,171,185,178,173,183,161,182,159,190,163,198,163,205"
                     shape="poly" onclick="openInfo('idx2')" id="idx2">
                  <area target="_blank" alt="시흥" title="시흥" nohref
                     coords="82,336,88,330,95,325,105,320,114,317,126,319,129,311,121,306,117,298,112,288,101,281,94,296,84,311,89,315,75,324,76,330"
                     shape="poly" onclick="openInfo('idx3')" id="idx3">
                  <area target="_blank" alt="남양주" title="남양주" nohref
                     coords="237,267,243,254,249,244,250,234,256,224,253,206,242,180,217,184,197,187,182,208,184,222,197,222,200,236,204,245,210,241,222,249,224,258"
                     shape="poly"onclick="openInfo('idx4')" id="idx4">
               </map>
            </div>
            
            <!-- 정보영역 -->
            <div class="info-area">
               <ul>
                  <li>
                     <div class="title">농장지역</div>
                     <div class="txt">군포시</div>
                  </li>
                  <li>
                     <div class="title">농장이름</div>
                     <div class="txt">군포 XX농장</div>
                  </li>
                  <li>
                     <div class="title">금액</div>
                     <div class="txt">?</div>
                  </li>
                  <li>
                     <div class="title">재배가능작물</div>
                     <div class="txt">감자마켓</div>
                  </li>
                  <li>
                     <div class="title">정보</div>
                     <div class="txt"></div>
                  </li>
                  <li>
                     <div class="title">기간</div>
                     <div class="txt">
                     <input type="radio" name="a"> 3~5월 
                     <input type="radio" name="a"> 6~8월
                     <input type="radio" name="a"> 9~11월
                     
                     <select>
                        <option>0:3~5월</option>
                        <option>1:6~8월</option>
                        <option>2:9~11월</option>
                     </select>
                     </div>
                  </li>
               </ul>
               
               <div class="btn-area">
                  <button type="submit" class="btn-reservation" onclick="location.href='${pageContext.request.contextPath}/reservation/reserForm.do'">예약하기</button>
                  <button type="reset" class="btn-reset">초기화</button>
               </div>
               
            </div>
         </div>
         
         <div class="photo-area">
            <strong class="title">군포 XX농장</strong>
            <div class="swiper">
              <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/soilhands.jpg"></div>
                <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/v1_76.png"></div>
                <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/v1_93.png"></div>
                <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/v16_560.png"></div>
                <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/v16_558.png"></div>
                <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/soilhands.jpg"></div>
              </div>

              <!-- <div class="swiper-button-prev"></div>
              <div class="swiper-button-next"></div> -->

            </div>
         </div>
      </div>
      
     <div>
     <table>
     <tr>
     	<td></td>
     	<td>A구역</td>
     	<td>B구역</td>
     	<td>C구역</td>
     	<td>D구역</td>
     </tr>
     	
     <%-- <c:forEach  items=""  var="sector"  > --%>
     	<tr>
     		<td><input type="checkbox"></input></td>
     		<td></td>
     		<td></td>
     		<td></td>
     		<td></td>
     	</tr>
     
    <%--  </c:forEach> --%>
     
     
     
     
     
     </table>
     
     
     
     </div>
     
     
     
     
     
      <script type="text/javascript">
      
         $(document).ready(function(){
             $('area').click( function(){
                var areaId = $(this).attr("id");
                
                if(areaId == "idx1"){
                   $(".mapImg").attr("src", "${pageContext.request.contextPath}/resources/images/imgmap1.png");
                }
                else if(areaId == "idx2"){
                   $(".mapImg").attr("src", "${pageContext.request.contextPath}/resources/images/imgmap2.png");
                }
                else if(areaId == "idx3"){
                   $(".mapImg").attr("src", "${pageContext.request.contextPath}/resources/images/imgmap3.png");
                } 
                else if(areaId == "idx4"){
                   $(".mapImg").attr("src", "${pageContext.request.contextPath}/resources/images/imgmap4.png");
                }
             });
             // 포토 슬라이드
             const swiper = new Swiper('.swiper', {
                  autoplay: true,
                  loop: true,
                  speed: 1000,
                   slidesPerView: 3,
                   spaceBetween: 30
                  /* navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                  }, */
   
                });
         });
      
         
      </script>
      
   































<jsp:include page="/WEB-INF/views/common/footer.jsp" />