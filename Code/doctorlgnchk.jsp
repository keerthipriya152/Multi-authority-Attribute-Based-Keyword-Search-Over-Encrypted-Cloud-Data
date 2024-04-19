<%@ page import="java.sql.*,databaseconnection.*"%>
<%	
		try{
		String uid=request.getParameter("uid");
		String pwd=request.getParameter("pwd");
		HttpSession ses=request.getSession();
	            Connection con=databasecon.getconnection();
				Statement st=con.createStatement();
				ResultSet rst=st.executeQuery("select *from doctor  where doctuid='"+uid+"' and doctpwd='"+pwd+"' and status='active' ");
				if(rst.next()){
					ses.setAttribute("docid",uid);
				
					response.sendRedirect("doctorhome.jsp");	
				}
				else{
				response.sendRedirect("doctor.jsp?msg2=failed");
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
			
			
%>