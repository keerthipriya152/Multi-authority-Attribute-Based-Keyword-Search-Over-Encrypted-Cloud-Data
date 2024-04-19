<%@ page import="java.sql.*,databaseconnection.*"%>
<%	
		try{
	
String nm = request.getParameter("nm");
	String uid = request.getParameter("unm");
	String pwd = request.getParameter("pwd");
	String hosp = request.getParameter("hosp");
	String prof = request.getParameter("prof");
	String cn= request.getParameter("cn");
	String em = request.getParameter("em");	
   
      
		
		HttpSession ses=request.getSession();
					
				Connection con=databasecon.getconnection();
				Statement st=con.createStatement();

				ResultSet rst=st.executeQuery("select *from doctor  where doctuid='"+uid+"'  ");
				if(!rst.next()){
				PreparedStatement p=con.prepareStatement("insert into doctor(doctname,doctuid,doctpwd,dochosp,docprof,email,contact,status,sk) values(?,?,?,?,?,?,?,?,?)");
				p.setString(1,nm);
				p.setString(2,uid);
				p.setString(3,pwd);
				p.setString(4,hosp);
				p.setString(5,prof);
				p.setString(6,em);
				p.setString(7,cn);
				p.setString(8,"non");
				p.setString(9,"non");
				int i=p.executeUpdate();
				if(i>0){
			response.sendRedirect("doctor.jsp?msg=succes");		
				}
		}else{
				response.sendRedirect("doctorreg.jsp?msg2=available");	
				}
}
				catch(Exception e){
			e.printStackTrace();
		}
			
			
%>