<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp"%>
    
<div class="res_join">
    <div class="res_join_title">QnA</div>
    <div style="border-top: 2px solid rgb(23,55,94); margin-top:15px;"></div>
        <table class="member_join_table"><br>
            <div class="qna_subject">
                제목 : ${qnaVO.subject}           
            </div> 
            <div class="qna_content">
                내용 : ${qnaVO.content} 
            </div>

        </table>
         	<input type="hidden" value="${qnaVO.qseq }" name="qseq">
            <div id="join_btn" style="margin: auto; width: 470px;">
            	<input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="button" value="수정" onclick="location.href='fooba.do?command=memberQnaUpdateForm&qseq=${qnaVO.qseq}'">
                <input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="button" value="목록" onclick="location.href='fooba.do?command=memberQnalist'">
                <input style="margin:auto; background-color:rgb(23,55,94)" class="join_btn1" type="button" value="삭제" onclick="location.href='fooba.do?command=memberQnaDelete&qseq=${qnaVO.qseq}'">
            </div>
    </form>
</div>
<br><br><br><br><br><br><br><br><br><br>
<%@ include file="../footer.jsp"%>