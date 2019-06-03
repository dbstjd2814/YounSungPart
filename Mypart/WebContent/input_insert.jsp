<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
        <script src="https://code.jquery.com/jquery-3.4.0.min.js">
        </script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
            #div{
                margin-top: 12%;
                overflow: hidden;
                text-align: center;
                width: 430px;
                height: 800px;
            }
            #header{
                width: 108.5%;
                height: 25%;
            }
            #img{
                margin-top: 1%; 
                float: left;
                width: 100%;
                height: 100%;
            }
            loge{
                float: left;
                height: 100%;
            }
            .text_label{
                text-align: left;
 				width: 100%;
                height: 100%;
            }
            select{
            padding: 10%;
            padding-right: 20px;
            } 
            .ui-datepicker{
            margin: 5px;
            
            }
        </style>
        <style>
			.ui-datepicker-trigger{cursor: pointer;}
			.hasDatepicker{cursor: pointer;}
		</style>
		
		<!-- 		날자 달력 이벤트 (동현)				 -->
		
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script>
        $(function() {
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' 
                ,showOtherMonths: true 
                ,showMonthAfterYear:true 
                ,changeYear: true 
                ,changeMonth: true             
                ,showOn: "both" 
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" 
                ,buttonImageOnly: true 
                ,buttonText: "날짜 선택"                
                ,yearSuffix: "년" 
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
                ,dayNamesMin: ['일','월','화','수','목','금','토'] 
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
                ,minDate: "-100y" 
				,yearRange: 'c-100:c+1'
				
            });
 
            
            
            $("#datepicker").datepicker();    
            $('#datepicker').datepicker('setDate', 'today'); 
			
		
        });
    </script>
    
    <!-- 		날자 달력 이벤트 (동현)				 -->
	<script>
		$(function(){
$("#idtext").on("focusout",function(){// ajax 가입된 아이디가 있는지 체크 이벤트
				
				$.ajax({
					url:"idchck.ajax",
					type:"post",
					data : {
						id : $("#idtext").val()
					}
				}).done(function(resp){
					console.log(resp);
					console.log(JSON.stringify(resp));
					var idtext =  $("#idtext").val();
                    var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/g
                    if(regex.exec(idtext) != null){
					 if(resp == "1"){
						 $("#idcheckin").text("이미 가입된 아이디 입니다.");
	                     $("#idcheckin").css("color","red");
	                     $("#idcheckvar").val("");
					}else if(resp == 0){
	                     $("#idcheckin").text("사용 가능한 아이디 입니다.");
	                     $("#idcheckin").css("color","green");
	                     $("#idcheckvar").val("사용 가능한 아이디 입니다.");
					}else if(resp == 3){
						 $("#idcheckin").text("아이디를 입력해 주세요.");
	                     $("#idcheckin").css("color","red");
	                     $("#idcheckvar").val("");
					}
				}else{
						$("#idcheckin").text("옳바른 형식으로 입력하세요.");
                    	$("#idcheckin").css("color","red");
                    	$("#idcheckvar").val("");
				}
				})
			})
		})
	</script>
        <script>
            $(function()
            {
                $("#pwtext2").on("focusout",function()
                { // 패스워드 랑 패스워드 확인 의 값이 같은지 구별
                    var regex = /^[A-Za-z0-9]{6,12}$/g
                    var pw = $("#pwtext").val();
                    var pw2 = $("#pwtext2").val();
                    if(regex.exec(pw2) != null)
                    {
                    	if(pw == pw2)
                    	{
                            $("#pwcheckin").text("사용가능 합니다.");
                            $("#pwcheckin").css("color","green");
                            $("#pwcheckvar").val("사용가능 합니다.");
                        }
                    	else
                        {
                        	 $("#pwcheckin").text("비밀번호가 일치하지 않습니다.");
                             $("#pwcheckin").css("color","red");
                             $("#pwcheckin").css("font-size","15px");
                             $("#pwtext2").val("");
                             $("#pwcheckvar").val("");
                        }
                    }
                    else
                    {
                    	 	$("#pwcheckin").text("사용불가능 합니다.");
                         	$("#pwcheckin").css("color","red");
                         	$("#pwtext2").val("");
                         	$("#pwcheckvar").val("");
                    }
                    
                })
                
          /*       $("#idtext").on("input",function()
                {// 아이디 이메일 형식이 맞는지 구별 regex
                    var idtext =  $("#idtext").val();
                    var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/g
                    if(regex.exec(idtext) != null)
                    {
                        $("#idcheckin").text("올바른 양식 입니다.");
                        $("#idcheckin").css("color","blue");
                    }
                    else
                    {
                        $("#idcheckin").text("양식이 옳바르지  않습니다.");
                        $("#idcheckin").css("color","red");
                    }
                })
                 */
                
                $("#phonetext").on("focusout",function()
                {// 핸드폰 형식이 맞는지 구별 regex
                	 var phonetext =  $("#phonetext").val();
                     var regex = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/g
                    if(regex.exec(phonetext) != null)
                    {
                        $("#phonecheckin").text("올바른 양식 입니다.");
                        $("#phonecheckin").css("color","blue");
                        $("#phonecheckvar").val("올바른 양식 입니다.");
                    }
                    else
                    {
                        $("#phonecheckin").text("양식이 옳바르지  않습니다.");
                        $("#phonecheckin").css("color","red");
                        $("#phonetext").val("");
                        $("#phonecheckvar").val("");
                    }
                })
                
                
                $("#pwtext").on("input",function()
                {// 패스워드 형식이 맞는지 구별 regex
                    var pwtext = $("#pwtext").val();
                    var regex = /^[A-Za-z0-9]{6,12}$/g
                    if(regex.exec(pwtext) != null)
                    {
                        $("#pwcheckin").text("올바른 양식 입니다.");
                        $("#pwcheckin").css("color","blue");
                    }
                    else
                    {
                        $("#pwcheckin").text("양식이 옳바르지  않습니다.");
                        $("#pwcheckin").css("color","red");
                    }
                })
                
                
                $("#nicknametext").on("focusout",function()
                {// 닉네임 형식이 맞는지 구별 regex
                    var nicknametext = $("#nicknametext").val();
                    var regex = /^.{1,6}$/g
                    if(regex.exec(nicknametext) != null)
                    {
                        $("#nicknamecheckin").text("올바른 양식 입니다.");
                        $("#nicknamecheckin").css("color","blue");
                        $("#nicknamecheckvar").val("올바른 양식 입니다.");
                    }
                    else
                    { 
                        $("#nicknamecheckin").text("양식이 옳바르지  않습니다.");
                        $("#nicknamecheckin").css("color","red");
                        $("#nicknametext").val("");
                        $("#nicknamecheckvar").val("");
                    }
                })
                $("#delete").on("click",function()
                { // 취소 버튼 누를시 모든값 초기화 이벤트
                	$("#idtext").val("");
                	$("#pwtext").val("");
                	$("#pwtext2").val("");
                	$("#nicknametext").val("");
                	$("#birthtext1").val("");
                	$("#birthtext2").val("");
                	$("#birthtext3").val("");
                	$("#phonetext").val("");
                	$("#idcheckin").text("");
                	$("#pwcheckin").text("");
                	$("#nicknamecheckin").text("");
                	$("#birthcheckin").text("ex) 1997년 02월 03일");
                	$("#birthcheckin").css("color","black");
                	$("#phonecheckin").text("");
                })
               /* $("#ok").on("click",function() {
                	if(($("#idcheckvar").val() == "사용 가능한 아이디 입니다." && $("#pwcheckvar").val() == "사용가능 합니다.") && ($("#nicknamecheckvar").val() == "올바른 양식 입니다." && $("#phonecheckvar").val() == "올바른 양식 입니다.")){
                		if(!$("input[name=gender]")){
                			alert($("input[name=gender]").val());
                			alert("가입란에 정확히 입력해주세요.");
                			return false;
						}else{
							alert($("input[name=gender]").val());
							$("#login").submit();
							return true;
						}
                	}else{
                		lert($("input[name=gender]").val());
                		alert("가입란에 정확히 입력해주세요.");
                		return false;
                	}
               })*/
                /* submit(function(){
                	if($("#idtext").val() == ""){
                		alert("값을 입력해 주세요.");
                		return false;
                	}else if($("#pwtext").val() == ""){
                		alert("값을 입력해 주세요.");
                		return false;
                	}else if($("#nicknametext").val() == ""){
                		
                	}else if()
                }) */
                $("#ok").on("click",function()
                {
                	if(
                			(
       						($("#idcheckvar").val() == "사용 가능한 아이디 입니다." && $("#pwcheckvar").val() == "사용가능 합니다.") 
                			&&
                			($("#nicknamecheckvar").val() == "올바른 양식 입니다." && ($("input:radio[name='gender']").is(":checked") == true)) 
                			&& 
                			$("#phonecheckvar").val() == "올바른 양식 입니다." )
                	)
                	{
                		alert("로그인 성공!");
                		$("#login").submit();
                	}
                	else
                	{	
                		alert("로그인 실패!");

                		return false;
                	}
             })
            })
            

        </script>
    </head>
    <body>
        <form id="login" action="Input.insert" method="post">
            <div class="container col-md-5 mt-5" id="div">
                <div class="row" id="header">
                    <div class="col-1"></div>
                    <loge class="col-10">
                        <img src="%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1.png" alt="" id="img">
                    </loge>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label ">
                        <label for="" class="mt-3 mb-1 mr-3">아이디 </label><span id="idcheckin"></span><input type="hidden" id="idcheckvar" namd="idcheck">
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label">
                        <input type="text" class="form-control"  placeholder="ex)moonblack_@naver.com" name="id" id="idtext" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label ">
                        <label for="" class="mt-2 mb-1 mr-3">비밀번호 </label><span id="pwcheckin"></span><input type="hidden" id="pwcheckvar" namd="pwcheck">
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label">
                        <input type="password" class="form-control"  placeholder="영문&숫자 6자리  ~ 12자리" name="pw" id="pwtext" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label ">
                        <label for="" class="mt-2 mb-1">비밀번호 확인 </label>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label">
                        <input type="password" class="form-control"  placeholder="비밀번호를 입력하세요." name="pw2" id="pwtext2" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label ">
                        <label for="" class="mt-2 mb-1 mr-3">닉네임</label><span id="nicknamecheckin"></span><input type="hidden" id="nicknamecheckvar" namd="nicknamecheck">
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label">
                        <input type="text" class="form-control"  placeholder="6자 이내" name="nickname" id="nicknametext" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label">
                        <label for="" class="mt-2 mb-1 mr-5">성 별</label>
                        <input type="radio" class="gender ml-4 mr-3" name="gender" value="M" required><span class="mr-3"> 남</span>
                        <input type="radio" class="gender ml-4 mr-3" name="gender" value="F" required><span> 여</span>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label">
                    </div>
                    <div class="col-1"></div>
                </div>  
                <div class="row" id="main">
            			<div class="col-1"></div>                    
                    <div class="col-10 text_label ">
                        <label for="" class="mt-2 mb-1 mr-4">생년월일</label>
						<input type="text" id="datepicker" name="birth">
                  <div class="col-1"></div> 
                </div> </div>
                
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label">
                        <label for="" class="mt-2 mb-1 mr-3">휴대폰</label><span id="phonecheckin" required></span><input type="hidden" id="phonecheckvar" namd="phonecheck">
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 text_label">
                        <input type="text" class="form-control"  placeholder="ex)010-9890-2814" name="phone" id="phonetext" required>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row pt-1 mt-2" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 input_text">
                        <button type="button" class="btn btn-primary" id="ok" name="ok">확인</button>
                        <button type="button" class="btn btn-primary ml-4" id="delete">취소</button>


                    </div>
                    <div class="col-1"></div>
                </div>
            </div>
        </form>
	<script>
		function noSpaceForm(obj) { // 공백사용못하게
			var str_space = /\s/; // 공백체크
			if (str_space.exec(obj.value)) { //공백 체크
				alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
				obj.focus();
				obj.value = obj.value.replace(' ', ''); // 공백제거
				return false;
			}
			// onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
		} 
		if(${result == "성공"}){
        	alert("회원가입 성공");
        	location.href="insert_login.jsp";
        }else if(${result == "실패"}){
        	alert("회원가입 실패");
        }
		</script>
</body>
</html>