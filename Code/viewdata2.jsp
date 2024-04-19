<%@include file="docheader.jsp"%>
<%! String pk,sk,filenm;
byte[] ct;
%>
<%Connection con2 = databasecon.getconnection();
	Statement st1 = con2.createStatement();	
	String sss1 = "select * from setup";
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next())
		{
			pk=rs.getString(1);
		}%>
<%@ page  import="java.sql.*" import="databaseconnection.*" %>

<%
String qid=request.getParameter("qid");
String docid= (String)session.getAttribute("docid");
String pid = request.getParameter("pid");

	Connection con1 = databasecon.getconnection();
	
	Statement st2 = con1.createStatement();
	
Statement st=con1.createStatement();
ResultSet r11=st.executeQuery("select data,docnm from cloud where qid="+qid+" ");
if(r11.next())
	{
ct=r11.getBytes(1);
filenm=r11.getString(2);
	}
ResultSet r2=st2.executeQuery("select sk from doctor where doctuid='"+docid+"' ");
if(r2.next())
	{
sk=r2.getString(1);
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
					     <form  action="Decrypt.jsp"  class="login-wrapper"  method="post" >
							
							<div class="right_form">
								<div>
								<span><label>File Name</label></span>
						    	<span><input type="text" name="docnm" class="form-control"   required="" value=<%=filenm%> readonly></span>
								<input name="sk" type="text" hidden value="<%=pk%>">
								<input type="hidden" name="qid" value=<%=qid%>>
								<input type="hidden" name="pid" value=<%=pid%>>
						    	</div>



					    <div class="right_form">
								<div>
								<span><label>CipherText( CT )</label></span>
						    	<span><textarea name="ct" class="form-control"type="text"  class="textbox" required="" readonly><%=ct%></textarea></span>
						    	</div>
								
							<div>
								<span><label>Secret key ( SK )</label></span>
						    	<span><input type="text"  class="form-control"   required="" value=<%=sk%> readonly></span>
						    	</div>

							
							 <div class="form-group">
                <input type="submit" value="Decrypt" class="btn btn-primary py-3 px-5">
              </div>
								
							 
					    </div>
					    <div class="clearfix"></div>
						</form>
				</div>
		</div>
	</section>
		

	

	<!-- footer --><br><br><br>
	
<%@include file="footer.jsp"%>