<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>
<%
String pass=null,uid=null;



String prof=null,hosp=null,test2=null;

String qid = request.getParameter("qid");
String pid = request.getParameter("puid");
try
{
	Connection con1 = databasecon.getconnection();

	Statement st1 = con1.createStatement();
	
	String sss1 = "select docprof,dochosp from doctor where doctuid='"+session.getAttribute("docid")+"' ";
System.out.println("ss="+sss1);
	ResultSet rs1=st1.executeQuery(sss1);

	if(rs1.next()){
		prof=rs1.getString("docprof");	
		hosp=rs1.getString("dochosp");	
		
    }
	String docid=(String)session.getAttribute("docid");
	String aces=prof+"&&"+hosp+"&&"+docid;

	PreparedStatement p=con1.prepareStatement("select *from cloud where qid=? and aces=?");
	p.setString(1,qid);
	p.setString(2,aces);
	ResultSet rs=p.executeQuery();
	if(rs.next()){
	response.sendRedirect("viewdata2.jsp?qid="+qid+"&pid="+pid);

	}else{
		response.sendRedirect("patientReq.jsp?msg=NotAccess");
	
	}
	
}

catch(Exception e1)
{
out.println(e1);
}

%>