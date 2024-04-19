<%@ page import="java.sql.*,databaseconnection.*"%>
<%	
		try{
		String unm=request.getParameter("uid");
		String pwd=request.getParameter("pwd");
		
				if(unm.equals("CS")&&pwd.equals("CS")){
					response.sendRedirect("cshome.jsp");	
				}
				else{
				response.sendRedirect("cs.jsp?msg=failed");
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
			
			
%>