<%@include file="pheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*" %>
<%
String reqto=request.getParameter("prof");
String hosp=request.getParameter("hosp");
String pid= (String)session.getAttribute("pid");

String ap=reqto+"&&"+hosp;

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
					     <form class="login-wrapper" method="post" action="newreq2.jsp">
							
					    <div class="right_form">
								<div>
								<span><label>Proffession && Hospital</label></span>
						    	<input name="ap" class="form-control" type="text" value="<%=ap%>" required="">
						    	</div>
								<%
	Connection con1 = databasecon.getconnection();
	Statement st1 = con1.createStatement();
	String sss1 = "select doctuid from doctor where docprof='"+reqto+"' and dochosp='"+hosp+"' ";
	ResultSet rs2=st1.executeQuery(sss1);%>
							<div>
						    	<span><label>Select physician</label></span>
							 <select name="doceid"  class="form-control">
	<%while(rs2.next()){%>
								<option value="<%=rs2.getString(1)%>" ><%=rs2.getString(1)%></option>
								<%}%></td>
							</select>
							</div>
									<br>		
			  <div class="form-group">
                <input type="submit" value="Next" class="btn btn-primary py-3 px-5">
              </div>
							 
					    </div>
					    <div class="clearfix"></div>
						</form>
				</div>
		</div>
	</section>
		

	<!-- footer --><br><br><br>
	
<%@include file="footer.jsp"%>