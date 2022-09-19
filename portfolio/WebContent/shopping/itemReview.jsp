<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String mb_id = request.getParameter("mb_id");
		String itemCode = request.getParameter("itemCode");
		String rate = request.getParameter("reRate");
		String reText = request.getParameter("reText");
		String rePhoto1 = request.getParameter("rePhoto1");
		String rePhoto2 = request.getParameter("rePhoto2");
		String rePhoto3 = request.getParameter("rePhoto3");
		
		
		int reRate = Integer.parseInt(rate);
		
		
		
		Connection conn = null;
		Statement stmt = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio","root","233895");
			stmt = conn.createStatement();
			
			String command = String.format
					("insert into itemReview (mb_id, itemCode, reRate, reText, rePhoto1, rePhoto2, rePhoto3, reDate) "
							+ "values ('%s','%s','%d','%s','%s','%s','%s',now());",mb_id,itemCode,reRate,reText,rePhoto1,rePhoto2,rePhoto3);
			int rowNum = stmt.executeUpdate(command); 
		}finally{
			try{
				stmt.close();
			}
			catch(Exception e){
			}
			try{
				conn.close();
			}
			catch(Exception e){
			}
			/* RequestDispatcher dispatcher = request.getRequestDispatcher("Board.jsp");
			dispatcher.forward(request, response); */
		} 
	%>

</body>
</html>