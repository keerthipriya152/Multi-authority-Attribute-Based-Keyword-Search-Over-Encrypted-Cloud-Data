

<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>
<%


String kwrd=request.getParameter("kwrd");
String docuid=request.getParameter("docuid");

Connection con1 = databasecon.getconnection();

try
{
	Statement st1 = con1.createStatement();
	Statement st2 = con1.createStatement();
	Statement st3 = con1.createStatement();
    Statement st4 = con1.createStatement();
	String qids="";

	
ResultSet rst=st3.executeQuery("select *from cloud"); 

while(rst.next()){

ResultSet r=st4.executeQuery("select aeskey from cloud where qid='"+rst.getString("qid")+"' ");
if(r.next()){

ResultSet rst2=st2.executeQuery("select *from cloud where AES_DECRYPT(kwrds,'"+r.getString("aeskey")+"') like '%"+kwrd+"%' and qid='"+rst.getString("qid")+"'");

while(rst2.next()){

qids=qids+rst2.getString("qid")+",";

}
	}

}
qids=qids.substring(0,qids.length()-1);

st1.executeUpdate("delete from results");

st1.executeUpdate("update trapdoor set status='finish' where doctuid='"+docuid+"' ");

PreparedStatement p=con1.prepareStatement("insert into results values('"+qids+"','"+docuid+"') ");
p.executeUpdate();

}
	
catch(Exception e){System.out.println(e);
e.printStackTrace();}


response.sendRedirect("trapdoor.jsp?msg=sent");%>






