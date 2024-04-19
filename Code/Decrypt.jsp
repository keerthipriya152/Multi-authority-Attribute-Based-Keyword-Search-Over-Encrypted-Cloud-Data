<%@include file="docheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*,KGC.*" %>
<%! String pk,sk,docnm;
byte[] data;
%>
<%
String qid=request.getParameter("qid");
String docid= (String)session.getAttribute("docid");
String sk=request.getParameter("sk");
String pid = request.getParameter("pid");
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();	
Statement st=con1.createStatement();

ResultSet r11=st.executeQuery("select "+CPABE_decrypt+"(data,'"+sk+"'),docnm from cloud where qid="+qid+" ");
if(r11.next())
	{
data=r11.getBytes(1);
docnm=r11.getString(2);
	}
	%>
	<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">View Reports</h1>
            
          </div>
        </div>
      </div>
    </section>
<section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				
				<h3 class="w3ls-title text-uppercase text-dark font-weight-bold">View Reports</h3>
			</div>
			<div class="login px-sm-4 mx-auto mw-100 login-wrapper">
					     <form  action="download.jsp"  class="login-wrapper"  method="post" >
							
							<div class="right_form">
								<div>
								<span><label>File Name</label></span>
						    	<span><input type="text" name="docnm" class="form-control"   required="" value=<%=docnm%> readonly></span>
								<input name="sk" type="text" hidden value="<%=sk%>">
								<input type="hidden" name="qid" value=<%=qid%>>
								<input type="hidden" name="pid" value=<%=pid%>>
						    	</div>



							<div class="right_form">
								<div>
								<span><label>File Data</label></span>
						    	<span><textarea name="ct" class="form-control"type="text"  class="textbox" required="" readonly><%=data%></textarea></span>
						    	</div>
							

							<br>

							 <div class="form-group">
                <input type="submit" value="Download" class="btn btn-primary py-3 px-5">
              </div>
		
								
							 
					    </div>
					    <div class="clearfix"></div>
						</form>
				</div>
		</div>
	</section>
		

	
	<!-- footer --><br><br><br>
	
<%@include file="footer.jsp"%>