<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		String mb_name = request.getParameter("mb_name");
		String mb_firstname = request.getParameter("mb_firstname");
		String mb_lastname = request.getParameter("mb_lastname");
		String mb_passnum = request.getParameter("mb_passnum");
		String mb_exdate1 = request.getParameter("mb_exdate1");
		String mb_exdate2 = request.getParameter("mb_exdate2");
		String mb_email1 = request.getParameter("mb_email1");
		String mb_email2 = request.getParameter("mb_email2");
		String mb_address = request.getParameter("mb_address");
		String mb_detailaddress = request.getParameter("mb_detailaddress");
		String mb_phonenum1 = request.getParameter("mb_phonenum1");
		String mb_phonenum2 = request.getParameter("mb_phonenum2");
		String mb_gender = request.getParameter("mb_gender");
		String mb_birth1 = request.getParameter("mb_birth1");
		String mb_birth2 = request.getParameter("mb_birth2");
		String mb_birth3 = request.getParameter("mb_birth3");
		String mb_agree1 = request.getParameter("mb_agree1");
		String mb_agree2 = request.getParameter("mb_agree2");

		Connection conn = null;
		Statement stmt = null;
		System.out.println("회원가입 결과창");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=utf8", "root", "1645");
			stmt = conn.createStatement();

				String command = String.format("insert into member_info (mb_id, mb_pw, mb_name, mb_firstname, mb_lastname, mb_passnum, mb_exdate, mb_email, mb_address, mb_detailaddress, mb_phonenum, mb_gender, mb_birth, mb_agree1, mb_agree2) values('%s','%s','%s','%s','%s','%s','%s/%s','%s@%s','%s','%s','%s%s','%s','%s%s%s','%s','%s');",
						mb_id, mb_pw, mb_name, mb_firstname, mb_lastname, mb_passnum, mb_exdate1, mb_exdate2, mb_email1, mb_email2, mb_address, mb_detailaddress, mb_phonenum1, mb_phonenum2, mb_gender, mb_birth1, mb_birth2, mb_birth3, mb_agree1, mb_agree2);
			int rowNum = stmt.executeUpdate(command);

		} finally {
			try {
				stmt.close();
			} catch (Exception e) {
			}
			try {
				conn.close();
			} catch (Exception e) {
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("indexpage.jsp");
			dispatcher.forward(request, response);
			
		}
	%>
</body>
</html>