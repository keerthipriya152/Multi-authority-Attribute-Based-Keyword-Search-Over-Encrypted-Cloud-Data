<%@include file="pheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*" %>
<%! String pk;%>
<%
String ap=request.getParameter("ap");
String pid= (String)session.getAttribute("pid");
String doceid= request.getParameter("doceid");
String acesp=ap+"&&"+doceid;

	Connection con1 = databasecon.getconnection();
	Statement st1 = con1.createStatement();
	String sss1 = "select * from setup";
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next())
		{
			pk=rs.getString(1);
		}
session.setAttribute("pk",pk);
session.setAttribute("acesp",acesp);
	%>
<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Upload Reports</h1>
            
          </div>
        </div>
      </div>
    </section>
	<section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				
				<h3 class="w3ls-title text-uppercase text-dark font-weight-bold">Upload Reports</h3>
			</div>
			<div class="login px-sm-4 mx-auto mw-100 login-wrapper">
					     <form  action="UpdateAnyFiles"  class="login-wrapper" ENCTYPE="multipart/form-data" method="post" >
							
					    <div class="right_form">
								<div>
								<span><label>Public key ( PK )</label></span>
						    	<span><input name="pk" class="form-control"type="text" value="<%=pk%>" class="textbox" required="" readonly></span>
						    	</div>
								<div>
								<span><label>Access Policy ( T )</label></span>
						    	<span><input name="acesp" class="form-control"type="text" value="<%=acesp%>" class="textbox" required="" readonly></span>
						    	</div>
								
							<div>
						    	<span><label>Data( M )</label></span>
							 <span>
						
						<input type="file" name="file" class="form-control" class="textbox" required>
						
						</span>
							</div>
							
							<br>
			  <div class="form-group">
                <input type="submit" value="Encryption" class="btn btn-primary py-3 px-5">
              </div>
								
							 
					    </div>
					    <div class="clearfix"></div>
						</form>
				</div>
		</div>
	</section>
		

	<!-- footer --><br><br><br>
	
<%@include file="footer.jsp"%>