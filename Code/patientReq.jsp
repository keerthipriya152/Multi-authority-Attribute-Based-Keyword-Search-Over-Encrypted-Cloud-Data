<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%@ include file="docheader.jsp"%>
<%
if(request.getParameter("msg")!=null){

out.println("<script>alert('You can not access this one')</script>");
}

if(request.getParameter("msg1")!=null){

out.println("<script>alert('Responsed Successfully..!')</script>");
}

if(request.getParameter("msg2")!=null){

out.println("<script>alert('Re-encrypted Ciphertext shared to Specialist')</script>");
}



%>
<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Patient Request</h1>
            
          </div>
        </div>
      </div>
    </section>
<center><br>
<div class="page-header">
				<h3 class="bars"></h3>
			</div><br>
<div class="bs-docs-example">
				<table class="table">
					<thead>
						<tr>
							<th>RequestId</th>
							<th>PatientID</th>
							<th>Access Policy</th>
							<th>Reports</th>
						</tr>
					</thead>
					
			
<tbody>
<%
	
		try{

			
		
		Connection con=databasecon.getconnection();
				Statement st=con.createStatement();
				Statement st2=con.createStatement();
				System.out.println(session.getAttribute("docid"));

	ResultSet rs=st.executeQuery("select qids from results where docuid='"+session.getAttribute("docid")+"' ");

	if(rs.next()){
			System.out.println(rs.getString(1));

	ResultSet rs2=st2.executeQuery("select * from cloud where qid='"+rs.getString(1)+"' ");
		
		while(rs2.next())
		{
		%>
		<tr><td><%=rs2.getString("qid")%></td><td><%=rs2.getString("puid")%></td><td><%=rs2.getString("aces")%></td><td> <a href="viewdata.jsp?qid=<%=rs2.getString("qid")%>&puid=<%=rs2.getString("puid")%>"><span class="badge badge-primary">View</span></a>
		</td></tr>
		<%
		}
	}
		}catch(Exception e){
		System.out.println(e);
		}

		


%>
</tbody>
</table>
</div>
			
<br><br><br><br>


<%@ include file="footer.jsp"%>