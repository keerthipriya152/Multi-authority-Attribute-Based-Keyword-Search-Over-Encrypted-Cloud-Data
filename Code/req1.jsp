
<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<%								

Connection con=databasecon.getconnection();
Statement st1 = con.createStatement();
String keywords = request.getParameter("keywords");

Statement st=con.createStatement();
st1.executeUpdate("delete from trapdoor");
int i = st.executeUpdate("insert into trapdoor(doctuid,keywords,status)values('"+session.getAttribute("docid")+"','"+keywords+"','request')");

response.sendRedirect("req2.jsp?docid="+session.getAttribute("docid")+"");

%>
