<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/restaurant/res_header.jsp"%>
<%@ include file="/restaurant/res_subhead.jsp"%>

<!-- RestaurantVO, FoodmenuList, ReviewList-->

        <div id="res_tab">
            <div class="res_infotab" style="color:white;" >정보</div>
            <div class="res_infotab" onclick="location.href='fooba.do?command=res_editForm'">정보수정</div>
        </div>

			<div id="res_menuall">
           		 <div id="info_rev">
            	
	       	    	<div id="rest_info">
                
                    <div id="res_cont">
                    	<br>
                        <h3>사장님 알림</h3><hr>
                        ${RestaurantVO.content}
                    </div>
                    
                    <br>
                    
                    <div id="res_num">
                        <h3>업체 정보</h3><hr><br>
                        <a class="basic">사업자 번호</a>&nbsp; ${RestaurantVO.rbiznum}<br>
                        <a class="basic">전화 번호</a>&nbsp; ${RestaurantVO.rphone}<br>
                        <a class="basic">가게 주소</a>&nbsp; ${RestaurantVO.raddress}<br><br>
                        <hr>
                    </div>
                    
                </div>
                
               
                
            </div>
            
        </div>
        
    </div>




<%@ include file="/restaurant/res_footer.jsp"%>