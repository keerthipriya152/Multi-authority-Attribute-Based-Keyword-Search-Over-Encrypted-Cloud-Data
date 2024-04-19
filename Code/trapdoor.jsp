<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%@ include file="csheader.jsp"%>
	                  <%

				String message=request.getParameter("msg");
                                                       if(message!=null)
                                                       {
                                                              out.println("<script>alert('Results are sent to Doctor')</script>");
                                                       }




                                               %>

<center><br><br>
<div class="page-header">
				<h3 class="bars">Trapdoor</h3>
			</div>
<div class="bs-docs-example">
				<table class="table">
					<thead>
						<tr>
							<th>DoctorId</th>
						
							<th>Keywords</th>

							<th>Action</th>
						
				
						</tr>
					</thead>
					
			
<tbody>																																																					<%
	
		try{

			
		
		Connection con=databasecon.getconnection();
				Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from trapdoor where status='request' ");
		
		while(rs.next())
		{
		%>
		<tr><td><%=rs.getString("doctuid")%><td><%=rs.getString("keywords")%><td><a href="trapdoor2.jsp?docuid=<%=rs.getString("doctuid")%>&kwrd=<%=rs.getString("keywords")%>"><h4>Search</a>
		<%
		}
		}catch(Exception e){
		System.out.println(e);
		}

		


%>
</tbody>
</table>
</div>


<br><br><br><br><br><br><br><br>


<%@ include file="footer.jsp"%>