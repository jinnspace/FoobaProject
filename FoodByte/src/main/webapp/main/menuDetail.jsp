<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	<!-- RestaurantVO, FoodmenuList, ReviewList, clist-->
	<div id="realjenche">
        <div id="jenche">
        <div id="gageirm">${RestaurantVO.rname}</div>
        <div id="gagemain">
           		<img class="smlogo"src="images/title/${RestaurantVO.rimage}" ></img>
         
            <div id="gibon">
            <a class="redd">★★★★☆</a> 4.4<br>
            <a class="grayy">배달팁</a>&nbsp;&nbsp;  ${RestaurantVO.rtip} 원<br>
            <a class="grayy">결제</a>&nbsp;&nbsp; 신용카드, 현금<br>            
            <a class="grayy">해시태그</a>&nbsp;&nbsp; #${RestaurantVO.hash}<br>
            </div>
        </div>
        <br>
        <div id="menujengbo">
            <div class="menujengbotab" onclick="menumove(-1);" id="menutabb">메뉴</div>
            <div class="menujengbotab" onclick="menumove(1);" id="jengbotabb">가게 정보/리뷰</div>
        </div>
        
        <div id="tul">
            <div id="menudel">
            	<c:forEach items="${FoodmenuList}" var="FoodmenuVO">
	                <div id="gagemenu" onclick="menupopup(${FoodmenuVO.fseq});">
	                    <h3>${FoodmenuVO.fname }</h3>
	                    <div class="grayyy">${FoodmenuVO.fcontent }</div><br>
	                    <div class="menugaguk">${FoodmenuVO.fprice}원</div>
	                    <img class="smmenu" src="images/foodmenu/${FoodmenuVO.fimage}">
	                </div>
                </c:forEach>
            </div>

            <div id="jengboreview">
                <div id="gagejengbo">
                    <div id="gagesoge">
                        <h3>사장님 알림</h3><hr>
                        ${RestaurantVO.content}
                    </div>
                    <br>
                    <div id="gagebunho">
                        <h3>업체 정보</h3><hr>
                        <a class="grayy">사업자 번호</a>&nbsp; ${RestaurantVO.rbiznum}<br>
                        <a class="grayy">전화 번호</a>&nbsp; ${RestaurantVO.rphone}<br>
                        <a class="grayy">가게 주소</a>&nbsp; ${RestaurantVO.raddress}<br><br>
                    </div>
                </div>
                <div id="reviewbogi">
                    <div id="reviewww">
                        <h2 id="cleanreview">클린리뷰</h2>
                        <h1 id="bigstarr">★★★★☆ 4.4</h1>
                    </div>
                    <c:forEach items="${ReviewList}" var="ReviewVO">
	                    <div class="reviewdel">
	                        <div class="rvnaeyong">
	                        <a class="rvnick">${ReviewVO.id }</a>님 &nbsp; 
	                        <a class="grayy"><fmt:formatDate value="${orderVO.indate }" type="date"/></a><br>
	                        <a class="starr">
								<c:choose>
			                    	<c:when test="${ReviewVO.star==1}">★ 1.0</c:when>
			                    	<c:when test="${ReviewVO.star==2}">★★ 2.0</c:when>
			                    	<c:when test="${ReviewVO.star==3}">★★★ 3.0</c:when>
			                    	<c:when test="${ReviewVO.star==4}">★★★★ 4.0</c:when>
			                    	<c:otherwise>★★★★★ 5.0</c:otherwise>
			                    </c:choose>
							</a><br><br>
	                        <br>
								&nbsp;${ReviewVO.content }
	                        </div>
	                        <c:choose>
		                        <c:when test="${ReviewVO.image==null}"></c:when>
		                        <c:otherwise>
			                        <div class="rvsajin">
			                            <img class="reviewimage" src="/images/${ReviewVO.image}">
			                        </div>
		                        </c:otherwise>
	                        </c:choose>
	                    </div>
	                </c:forEach>
                 </div>
            </div>
        </div>
    </div>
    
    <div id="jangbagunitul">
        <div id="jbtitle">주문표</div>
          
        <c:forEach items="${clist }" var="CartVO">
        	<div class="jbitem" id="jb${CartVO.cseq}">
            <a class="jbitemname">${CartVO.cfname} x ${CartVO.quantity }&nbsp;&nbsp;&nbsp;</a><a class="jbitemsub">${CartVO.sideyn1}&nbsp;&nbsp; ${CartVO.sideyn2} &nbsp;&nbsp;${CartVO.sideyn3}</a><br>
            <div class="jbitemprice">
                ${CartVO.cprice} 원&nbsp;
                <input type="button" class="jbcancel" value="X" onclick="deleteejb(${CartVO.cseq});">
            </div>
        </div>
        </c:forEach>
 
        <div class="baedaltip">배달요금 : ${RestaurantVO.rtip}원 별도&nbsp;&nbsp;&nbsp;</div>
        <div class="jbtotal">합계 : <input type="text" value="${carttotalprice }" id="jbtotalprice" name="totalprice">원&nbsp;&nbsp;</div>
        <form method="post" name="frm">
        <input type="hidden" value="${RestaurantVO.rseq }" name="rseq"> 
        <input type="hidden" value="${carttotalprice }" name="carttotalprice">
        <input type="button" value="주문하기" class="jbwanryo" onclick="goPay();">
        </form>
    </div>
  </div>  

<%@ include file="../footer.jsp"%>