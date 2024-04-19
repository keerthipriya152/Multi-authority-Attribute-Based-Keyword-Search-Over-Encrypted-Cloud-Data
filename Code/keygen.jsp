
<%@ page  import="java.sql.*,abe.CPABE" import="databaseconnection.*,it.unisa.dia.gas.jpbc.Element"%>

<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>

<%! String name,uid,pwd,hosp,prof,email,mno,sk,sts;
	int i=0,exp=0,q=0;
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();

String pk=request.getParameter("pk");
String msk=request.getParameter("msk");
String atrbt=request.getParameter("atrbt");
String atrbts[]=atrbt.split(",");
CPABE e=new CPABE();
Element SK=e.keygen(pk,msk,atrbts);
%>
<%
Statement st1=con.createStatement();
int i =st1.executeUpdate("update doctor set sk='"+SK.toString()+"' where doctuid='"+request.getParameter("unm")+"' ");

if(i>0){
st.executeUpdate("update doctor set status='active' where doctuid='"+request.getParameter("unm")+"' ");

	response.sendRedirect("doctors.jsp?msg=done");
}
}
catch(Exception e)
{
e.printStackTrace();
	}
%>
