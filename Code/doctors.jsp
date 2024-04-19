<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%@ include file="taheader.jsp"%>
	                  <%

				String message=request.getParameter("msg");
                                                       if(message!=null)
                                                       {
                                                              out.println("<script>alert('Private Key SK  Generated Successfully')</script>");
                                                       }




                                               %>

<center><br><br>
<div class="page-header">
				<h3 class="bars">New Doctors</h3>
			</div>
<div class="bs-docs-example">
				<table class="table">
					<thead>
						<tr>
							<th>DoctorName</th>
							<th>UserId</th>
							<th>Profession</th>
							<th>Hospital</th>
							<th>KeyGen</th>
						
				
						</tr>
					</thead>
					
			
<tbody>																																																					<%
	
		try{

			
		
		Connection con=databasecon.getconnection();
				Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from doctor where sk='non' or status='non' ");
		
		while(rs.next())
		{
		%>
		<tr><td><%=rs.getString("doctname")%><td><%=rs.getString("doctuid")%><td><%=rs.getString("docprof")%>
		<td><%=rs.getString("dochosp")%><td><a href="doctaccept.jsp?uid=<%=rs.getString("doctuid")%>"><h3>GenSK</a>
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