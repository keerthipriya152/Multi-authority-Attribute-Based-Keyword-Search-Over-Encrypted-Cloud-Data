<%@include file="pheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>

<%! String qid;byte[] ct,data;String docnm;%>
<%
	
	String qid=request.getParameter("qid");
	
	String kw=request.getParameter("kw");
      try{

              Connection con=databasecon.getconnection();
				
				Statement stt=con.createStatement();
				
						




Connection con1=databasecon.getconnection();
Statement st1=con1.createStatement();
ResultSet r11=st1.executeQuery("select data from cloud where qid="+qid+" ");
if(r11.next())
	{
ct=r11.getBytes(1);

	}}
	catch(Exception e){e.printStackTrace();}


	Random r=new Random();
	int aeskey=r.nextInt(1000000);
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
    </section><section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				
				<h3 class="w3ls-title text-uppercase text-dark font-weight-bold">Upload Reports</h3>
			</div>
			<div class="login px-sm-4 mx-auto mw-100 login-wrapper">
					     <form  action="encryptionkw.jsp"  class="login-wrapper"  method="post" >
							
					    <div class="right_form">
								<div>
								<span><label>CipherText( CT )</label></span>
						    	<span><textarea name="ct" class="form-control"type="text"  class="textbox" required="" readonly><%=ct%></textarea><input type="hidden" name="qid" value=<%=qid%>></span>
						    	</div>

								<div>
								<span><label>Keywords</label></span>
						    	<span> <input type="text" class="form-control" name="kw" value=<%=kw%> required></span>
						    	</div>

								<div>
								<span><label>SymmetricKey</label></span>
						    	<span> <input type="text" class="form-control" value=<%=aeskey%> name="aeskey"  required></span>
						    	</div>

							<br>
									  <div class="form-group">
                <input type="submit" value="EncryptionKW" class="btn btn-primary py-3 px-5">
              </div>
							 
					    </div>
					    <div class="clearfix"></div>
						</form>
				</div>
		</div>
	</section>
		

		

	<!-- footer --><br><br><br>
	
<%@include file="footer.jsp"%>



    
