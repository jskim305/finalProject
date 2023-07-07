/**
 * 이 내용들을 memberEnroll에 다 넣어버리고 이 파일은 사용을 안함
 */

 // name, id, pw 정규표현식 검사
 function inputCheck(){

	 if(!checkName(form.name.value)){
		alert("이름을 잘못 넣었습니다.");
		return false;
	 }
	 
	 if(!checkBirth(form.birth.value)){
		 alert("생년월일을 잘못 넣었습니다.");
		 return false;
	 }
	 
	 if(!checkUserId(form.user_id.value)){
		 alert("ID를 잘못 넣었습니다.");
		 return false;
	 }
	 
	 if(!checkPW(form.pw.value)){
		 alert("패스워드을 잘못 넣었습니다.");
		 return false;
	 }
	 
	 if(!equalPW(form.pw.value, form.rePw.value)){
		 alert("비밀번호 확인란의 값이 패스워드와 같지 않습니다.");
		 return false;
	 }
	 
	 else
	 	return true;
 }
 
 function checkName(){
	 var nameExp = /^[가-힣]{2,6}$/;
	 
	 if(!nameExp.test(form.memName.value)){
		form.memName.value = "";
		form.memName.focus();
		
		return false;
	 }
	 
	 return true;
 }
 
function checkBirth(memBirth){
	
	var birthExp = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	
	if(birthExp.test(memBirth)){
		form.ckBirth.value="사용가능";
		form.ckBirth.style.color="green";
	}
	
	if(!birthExp.test(memBirth)){
		form.ckBirth.value="사용불가";
		form.memBirth.value="";
		form.memBirth.focus();
		
		return false;
	}

	return true;
}
 
 function checkUserId(inputId){
	 var idExp = /^[a-z][a-z0-9]{3,19}$/i;
	 
	 if(!idExp.test(inputId)){
		form.user_id.value = "";
		form.user_id.focus();
		
		return false;
	}

	return true;
 }
 
 function checkPW(inputPW){
	 var pwExp = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/;
	 
	 if(!pwExp.test(inputPW)){
		form.pw.value = "";
		form.pw.focus();
		
		return false;
	}

	return true;
 }
 
 function equalPW(pw, rePw){
	 if(pw != rePw){
		form.rePw.value = "";
		form.rePw.focus();
		
		return false;
	 }

	 return true;
 }

 
 