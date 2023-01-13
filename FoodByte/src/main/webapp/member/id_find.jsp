<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/fooba.css" rel="stylesheet"> 
<script type="text/javascript">

</script>
</head>
<body>
<form name="id_find_check" method = "post">
        <div class = "if_find_title">
            <h3>아이디 찾기</h3>
        </div>
    <section class = "form-search">
        <div class = "find-name">
            <label>이름</label>
            <input type="text" name="member_name" class = "btn-name" placeholder ="등록한 이름">
        <br>
        </div>
        <div class = "find-phone">
            <label>번호</label>
            <input type="text"  name="member_phone" class = "btn-phone" placeholder = "휴대폰 번호 입력" maxlength="13"> 
        </div>
        <br>
</section>
<div class ="id_find_btn">
    <input type="button" name="find" value="찾기" onclick="member_id_find">
    <input type="button" name="cancle" value="취소" onclick="member_id_cancle">
 </div>
</form>
</body>
</html>