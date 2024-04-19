
<%@page import="databaseconnection.*,java.sql.*"%>
<%!
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
String uname = request.getParameter("uid");
String password = request.getParameter("pwd");

con = databasecon.getconnection();

stmt = con.createStatement();

if(uname.equals("TA")&& (password.equals("TA"))){
response.sendRedirect("TAhome.jsp?msg=succ");
}else{
response.sendRedirect("Authoritylogin.jsp?msg1=unsucc");
}
%>