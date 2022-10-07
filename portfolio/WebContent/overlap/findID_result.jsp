<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.Member_info"%>    
<%
	Member_info list = (Member_info)request.getAttribute("list");
	if(list !=null){
%>

	<div class="modalheader">아이디 찾기 </div>
 <div class="modalsection">"<%= list.getMb_name()%>"님의 아이디</div>
       <div class="findid">
         <div><%=list.getMb_id()%></div>
       </div>
       <div class="buttonbox">
       <input type="button" value="비밀번호 찾기" onclick="aa()" class="button1">
       <input type="button" value="로그인" onclick="bb()" class="button2">
       </div>
<%}else{%>
<div class="modalheader">아이디 찾기 </div>
       <div class="findid" style="background-color: white">
         <div>찾으시는 정보가 없습니다.</div>
       </div>
       <div class="buttonbox">
       <input type="button" value="취소" onclick="cc()" class="button3">
       </div>
       <%}%>