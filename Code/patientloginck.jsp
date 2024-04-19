<%@ page import="java.sql.*,databaseconnection.*"%>
<%	
		try{
		String uid=request.getParameter("uid");
		String pwd=request.getParameter("pwd");
		HttpSession ses=request.getSession();
	            Connection con=databasecon.getconnection();
				Statement st=con.createStatement();
				ResultSet rst=st.executeQuery("select *from patient  where uid='"+uid+"' and pwd='"+pwd+"' ");
				if(rst.next()){
					ses.setAttribute("pid",uid);
					response.sendRedirect("patienthome.jsp");	
				}
				else{
				response.sendRedirect("patient.jsp?msg2=failed");
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
			
			
%>