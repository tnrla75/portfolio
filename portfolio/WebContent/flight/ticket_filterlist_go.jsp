<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.FlightTicketBean"%>
	<%@page import="vo.PageInfo"%>
	<%@ page import="java.util.*"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <% 
    PageInfo pageInfo1 = (PageInfo)request.getAttribute("pageInfo1_filter");
	int listCount1=pageInfo1.getListCount();
	int nowPage1=pageInfo1.getPage();
	int maxPage1=pageInfo1.getMaxPage();
	int startPage1=pageInfo1.getStartPage();
	int endPage1=pageInfo1.getEndPage();
	ArrayList<FlightTicketBean> ticketBeanList1 = (ArrayList<FlightTicketBean>)request.getAttribute("ticketBeanList1_filter");
	String arr = request.getParameter("arr");
	
    %>
	<% 
	for(int i = 0; i< ticketBeanList1.size(); i++){
	%> 
	<div class="flightlistdiv">
		<table class="listtable">
			<tr class="tr1">
				<td class="td1">
				<% 
				String flightimg1 = "";
				if(ticketBeanList1.get(i).getFlight_name().equals("제주")){ 
					flightimg1 = "jejuair.png";
				}else if(ticketBeanList1.get(i).getFlight_name().equals("아시아나")){
					flightimg1 = "asiana.png";
				}else if(ticketBeanList1.get(i).getFlight_name().equals("대한")){
					flightimg1 = "koreanair.png";
				}else if(ticketBeanList1.get(i).getFlight_name().equals("")){
					
				}
				%>
				<input type="hidden" value="<%= ticketBeanList1.get(i).getFlight_Ticket_Num() %>" name="ticketNum1">
				
				<img src="../img/flight/<%= flightimg1 %>" class="flightimg"></td>
				<td class="td1" style="text-align: left;"><%= ticketBeanList1.get(i).getFlight_name() %></td>
				<td class="td1"><span class="time"><%= ticketBeanList1.get(i).getFlight_departureTime()%></span><br><span class="airport"><%= ticketBeanList1.get(i).getFlight_departure() %></span></td>
				<td class="td1"><span class="airport"><%= ticketBeanList1.get(i).getEstimated_time() %></span><br><img src="aaa.jpg"></td>
				<td class="td1"><span class="time"><%= ticketBeanList1.get(i).getFlight_arrivalTime() %></span><br><span class="airport"><%= ticketBeanList1.get(i).getFlight_arrival() %></span></td>
				<td class="td1" rowspan="2" style="border-right: #E6E6E6 2px solid; border-left: #E6E6E6 2px solid;">
							<label class="container">
							  <input type="radio" class="choicebtn" name="choicebtn">
							  <span class="checkmark">
							    <h4><fmt:formatNumber value="<%= ticketBeanList1.get(i).getFlight_Ticket_Price() %>" groupingUsed="true" /></h4>
							  </span>
							</label>
							</td>
			</tr>
		</table>					
	</div>
	<%} %>
	