<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<fmt:setLocale value="ko_KR"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fooba</title>
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>

<script type="text/javascript">

function resCheck(){

	  if(document.res_loginForm.resid.value==""){
	      	alert("아이디를 입력하세요.");
	  }else if(document.res_loginForm.respw.value==""){
	     	alert("비밀번호를 입력하세요.");
	  }else{document.res_loginForm.submit();} 

}

var menunumm=0;

function menumove(x){
    if(x==-1&&menunumm==0)return;
    if(x==1&&menunumm==1)return;

    if(x==-1)menunumm--;
    if(x==1)menunumm++;
    var dist=menunumm*700*-1;
    document.getElementById("res_menuall").style.left=dist+'px';
}


</script>
<script src = "../script/jquery-3.6.1.js"></script>
<script src="/script/res.js"></script>
<style type="text/css">
body {margin:0}

/* 레스토랑 css  */

.headback {width: 100%; height: 100px; background-color: rgb(255,204,0); margin: 0;}
#mainlogo {position: relative; text-align: center; width: 150px; height: 100px; margin: auto auto;}
#mainlogo img {width: 100px; height: 100px;}

.headbuttons {position:absolute; width: 380px; top:23px; left:calc(50% + 300px); }
.headbutton {width: 70px; height: 50px;border-radius: 5px; text-decoration: none; font-weight: bold; font-size: 90%; font-family: Verdana, Geneva, Tahoma, sans-serif; background-color: #fff; line-height: 50px; color:#fff; background-color: transparent; border: 2px solid white; }
.headbutton:hover {background-color: white; color: rgb(255,204,0); cursor: pointer;}

.footerbox{position:relative; height: 100px; width: 100%; background-color: white;}
.footerbox #copy{position:absolute; top: 50px; text-align: center; right:20px; font-size: 15px; opacity: 80%; color: rgb(255,204,0);}
.footerbox  #logo{position:absolute; width:80px; height: 90px;  left: 15px; opacity: 60%; }
.footerbox #logotextbox{position:absolute; top:10px; left: 110px; line-height:25px; width: 500px; }
.footerbox #logotext{font-family: Verdana; font-weight: bold; color: rgb(255,204,0); }
.footerbox .linemenubox{width: 150px; height: 20px; cursor: pointer; float: right; margin:10px; font-weight: bold; color: rgb(255,204,0); text-align: center;}

.login_form {position: relative; width:100%; height:745px;}
#logspace {width: 100%; height: 100px;}
#loginmessage {width: 100%; height: 20px; margin-top: 30px; color: red; text-align: center; }
#Login_form_space {width:100%; height:150px;}
#loginmain_logo{position: relative; text-align: center; width: 150px; height: 100px; margin: 0 auto; border-radius:50%; width: calc(5.5em / 0.7); height: calc(5em / 0.7); background-color: rgb(255,204,0); opacity:90%;}
#loginmain_logo img{width: 100px; height: 100px;}
#login_box{position: relative; height:300px; width:500px; border:2px solid rgb(224, 133, 80); margin: 0 auto; border-radius: 20px; margin-top:50px; }
#text_button_box{position:relative; width: 500px;height: 190px; margin-top: 50px; margin-left:0 auto;}
#login_idpw_box{position:relative; height:75px; width:310px; margin-top:0 auto; margin-left:90px;}
#login_id{position: relative; width:300px;height:36px; border:1px solid #616161; padding-left:10px;}
#login_pw{position: relative; width:300px; height:36px; bottom:1px; border:1px solid #616161; padding-left:10px; margin-top:10px;}
#log_buttonbox{position: relative; width: 310px; height:40px; margin-top: 40px;margin-left:90px;}
#log_button{position: relative; width: 310px; height:40px; background-color:rgb(255,204,0); opacity:80%;border-color:rgb(255,204,0); border-radius:10px; cursor: pointer;}
#log_button span{position: relative;font-size: 20px; font-weight:bold;color: white; } 
#login_idpw_box input:enabled{background:white;}
#login_idpw_box input:focus{background: rgb(255, 209, 182); outline: none;}
#loginform_linetextbox{height:25px; width:450px; margin:0 auto;}
.loginform_linetext span{ position: relative; float: left; cursor: pointer; width:100px; margin-left: 45px; }

#logspace {font-size: 30px; font-weight:bold; text-align:center;}

/* #dummy{height:745px; width:100%;  } */

#res_main{position: relative; width:700px; height: 100%; border: 1px solid black; margin:0 auto; overflow: hidden;}
#res_name{ height:50px ; font: gray; border-bottom: 1px solid black;font-size: 120%; font-weight: bold;
text-align: center;line-height: 50px;}
#res_info{height: 140px; border-bottom: 1px solid black; margin:0 auto;}
.res_logo{height: 120px; width: 120px; position: relative; float: left;margin: 10px;}
#res_basic{font-size: 100%; position: absolute; left: 150px;line-height: 33px;}
.basic{color: gray; font-weight: normal; font-size: 100%; }
#res_tab{height: 50px; }
.res_infotab{background-color: rgb(255,204,0); height:50px; width:348px ;position: relative; float:left ;
border :1px solid lightyellow; line-height: 50px; text-align: center; font-weight: bold;font-size: 110%;}
.res_infotab:hover{cursor: pointer;}
#res_menuall{ width: 1400px; float: left; position: relative;}
#res_menuinfo{ width: 700px; border:1px solid green;}
#res_menu_icon{width:20px; height:20px; }
#res_menu_icon:hover{cursor: pointer; opacity:0.6;}
#res_menu{height: 140px; border-bottom: 1px solid rgb(231, 231, 231); padding-left:20px; font-weight: bold; line-height: 30px; position: relative;}
.res_meima{height: 120px;width: 120px; position: absolute; right: 10px;top: 0px;}
#info_rev{width:700px; position:absolute; top:0px; right: 0px;}
#rest_info{padding-left: 15px; padding-right: 15px; line-height: 25px;border-bottom: 1px solid black; position: relative;}

#res_num{position: relative; margin:0 auto;}

#res_revbogi{text-align: center; position: relative;  }
.res_total{color: orange; font-weight: bold;}
#res_star h2{font-weight: bold; }
#res_star{border-bottom: 1px solid black;}

.res_review_nae{position: relative;border-bottom: 1px solid rgb(231, 231, 231); height: 210px;}
.res_revcon{margin: 0 auto; position: absolute;left: 5px; top: 5px; text-align: left;}
.res_revnick{font-size: 150%; margin-left:5px ; margin-right: 8px; font-weight: bold;}
.res_star{color: orange; margin-left: 7px; }
.rev_image{margin: 0 auto; position: absolute;right: 5px; top: 5px;}
.reviewimage{ height: 200px;  }
#res_star h1{color: orange;}


</style>
</head>


<body>

    <div class="headback" id="resheadback">
        <div id="mainlogo">
            <a href="fooba.do?command=index"><img src="images/mainlogo1.png"></a>
        </div>
    </div>
    
    <div class="headbuttons" id="resheadbuttons">
    	<c:choose>
    		<c:when test="${empty loginRes}">
	    		<input type="button" value="가입신청" class="headbutton" name="userLogin" onclick="location.href='fooba.do?command=res_joinForm'">
	    		<input type="button" value="Home" class="headbutton" name="userJoin" onclick="location.href='fooba.do?command=index'">
    		</c:when>
    		<c:otherwise>
    			<input type="button" value="로그아웃" class="headbutton" onclick="location.href='fooba.do?command=res_logout'">
	    		<input type="button" value="주문관리" class="headbutton" onclick="location.href='fooba.do?command=res_order'">
	    		<input type="button" value="리뷰관리" class="headbutton" onclick="location.href='fooba.do?command=res_review'">
	    		<input type="button" value="메뉴관리" class="headbutton" onclick="location.href='fooba.do?command=res_foodmenu'">
	    		    		
	    	</c:otherwise>
    	</c:choose>
    </div>