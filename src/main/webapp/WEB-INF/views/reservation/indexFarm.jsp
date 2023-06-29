<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>     




<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="vegform" name="title"/>
</jsp:include> 

       <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	   <script src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
		<!-- <script type="text/javascript">
		    $(document).ready(function() {
		        $('map[name="image-map"] area').mouseover(function() {
		            $(this).addClass('highlight');
		        }).mouseout(function() {
		            $(this).removeClass('highlight');
		        });
		    });
		</script> -->
		<!-- <script>
		$(document).ready(function(e) {
			$('img[usemap] area').mouseover(function() {
		            $(this).addClass('highlight');
		        }).mouseout(function() {
		            $(this).removeClass('highlight');
		});
		</script> -->
		<script>
	        $(document).ready(function() {
	            $('#highlight').hover(
	                function() {
	                    $(this).css('background-color', 'yellow');
	                },
	                function() {
	                    $(this).css('background-color', 'initial');
		                }
		            );
		        });
	    </script>
		<style>

.area-wrapper {
  display: inline-block;
  padding: 10px;
  background-color: #f2f2f2;
  border: 1px solid #ccc;
}

.area-wrapper area {
  opacity: 0.8;
  transition: opacity 0.3s ease;
}

.area-wrapper area:hover {
  opacity: 1;
  background-color: #eaeaea;
}
.image-map-wrapper {
  position: relative;
}

.image-map-wrapper::after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  opacity: 0;
  transition: opacity 0.3s ease;
  pointer-events: none;
}

.image-map-wrapper:hover::after {
  opacity: 1;
}

.image-map-wrapper area {
  /* 원하는 스타일을 적용하세요 */
}

		</style>
		<div class="area-wrapper">
		<div class="imgF">
		<img src="${pageContext.request.contextPath}/resources/images/imgmap.jpg" usemap="#image-map">
		    <map name="image-map">
		        <area  alt="군포" title="군포" href="Gunpo.jsp" coords="141,313,130,322,123,333,134,335,145,332,150,321" shape="poly" id="highlight" >
		    	<area target="_blank" alt="양주" title="양주" href="Yangju.jsp" coords="159,211,146,211,137,208,140,190,141,177,133,172,131,158,142,151,147,137,153,124,162,127,165,139,172,146,187,151,190,171,185,178,173,183,161,182,159,190,163,198,163,205" shape="poly" class="highlight">
		    	<area target="_blank" alt="시흥" title="시흥" href="Siheung.jsp" coords="82,336,88,330,95,325,105,320,114,317,126,319,129,311,121,306,117,298,112,288,101,281,94,296,84,311,89,315,75,324,76,330" shape="poly" class="highlight">
		    	<area target="_blank" alt="남양주" title="남양주" href="Namyangju.jsp" coords="237,267,243,254,249,244,250,234,256,224,253,206,242,180,217,184,197,187,182,208,184,222,197,222,200,236,204,245,210,241,222,249,224,258" shape="poly" class="highlight">		    	
		    </map>
		</div>
		</div>
        <div class="footer">
         
        </div>
    
    
    <div>
    	<a href="${pageContext.request.contextPath}/reservation/reserForm.do">예약확인페이지~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</a>
    </div>
   
    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />