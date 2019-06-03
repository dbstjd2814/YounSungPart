<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>로그인</title>
        <style>
            #div{
                margin-top: 12%;
                overflow: hidden;
                text-align: center;
                border: 1px solid black;
                width: 400px;
                height: 500px;
            }
            *{

            }
            #header{
                width: 108.1%;
                height: 40%;
            }
            logo{
                width: 100%;
                height: 100%;
            }
            #log{
                float: left;
                width: 100%;
                height: 100%;
            }
            .form-control{
                float: left;
                width: 100%;
                height: 100%;
            }
            .input_text{
                text-align: right;
            }
            main>div>input{
                margin-left: 50px;
            }
            main>div{
                padding-top: 100%;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.4.0.min.js">
        </script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script>
        	$(function(){
        		$("#delete").on("click",function(){
        			$("#id").val("");
        			$("#pw").val("");
        		})
        	})
        	
        </script>
    </head>
    <body>
        <form action="Login.insert" method="post">
            <div class="container col-md-6" id="div">
                <div class="row" id="header">
                    <header class="col-log-2 col-md-2 col-sm-2">
                    </header>
                    <logo class="col-log-8 col-md-8 col-sm-8 pt-4">
                        <img src="카카오톡.png" alt="" id="log">
                    </logo>
                    <header class="col-log-2 col-md-2 col-sm-2">
                    </header>
                </div>
                <div class="row pt-4" id="main">
                   <div class="col-1" ></div>
                    <div class="col-3 input_text pt-2">
                        <label>아이디 :</label>   
                    </div>
                    <div class="col-7">
                        <input type="text" class="form-control" placeholder="아이디 입력" name="id" id="id" required>
                    </div>
                    <div class="col-1"></div> 
                </div>
                <div class="row pt-1 mt-1" id="main">
                    <div class=" col-4 input_text pt-2">
                        <label>비밀번호 :</label>   
                    </div>
                    <div class="col-7">
                        <input class="form-control" type="password" placeholder="비밀번호 입력" name="pw" id="pw" required>
                    </div>
                    <div class="col-1" ></div>
                </div>
                <div class="row pt-1 mt-2" id="main">
                    <div class="col-1"></div>
                    <div class="col-10 input_text">
                        <a href="#">아이디 비밀번호 찾기</a>
                        <span>/</span>
                        <a href="input_insert.jsp">회원가입</a>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row pt-1 mt-2" id="main">
                    <div class="col-2"></div>     
                    <div class="col-9 input_text">
                        <button type="submit" class="btn btn-primary">확인</button>
                        <button type="button" class="btn btn-primary" id="delete">취소</button>
                    </div>
                    <div class="col-1"></div>
                </div>
            </div>
        </form>
        
    </body>
</html>