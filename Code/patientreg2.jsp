<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>


<%
    String name = request.getParameter("name");
	String uid = request.getParameter("uid");	
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");

	String mno = request.getParameter("mno");
    String gen = request.getParameter("gender");
	String age = request.getParameter("age");
	
	





      try{

 Connection con=databasecon.getconnection();
Statement st=con.createStatement();

ResultSet rst=st.executeQuery("select *from patient  where uid='"+uid+"'  ");
				if(!rst.next()){
PreparedStatement ps=con.prepareStatement("INSERT INTO patient (pname,uid,pwd,email,mno,gender,age,status)VALUES(?,?,?,?,?,?,?,?)");

ps.setString(1,name);
ps.setString(2,uid);
ps.setString(3,pwd);
ps.setString(4,email);
ps.setString(5,mno);
ps.setString(6,gen);
ps.setString(7,age);
ps.setString(8,"non");
int s = ps.executeUpdate();


if(s>0)
response.sendRedirect("patient.jsp?msg=done");


}else{
response.sendRedirect("patientreg.jsp?msg=available");	
				}
	  }

catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>



    
