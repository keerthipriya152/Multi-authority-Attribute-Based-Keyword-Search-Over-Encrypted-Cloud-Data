<%@include file="pheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*,KGC.*" import="javax.swing.JOptionPane"%>

<%! int qid;byte[] ct,data;String docnm;%>
<%
	String pk = (String)session.getAttribute("pk");	
	String acesp =(String)session.getAttribute("acesp");
	//String data = request.getParameter("query");
	String peid= (String)session.getAttribute("pid");
      try{

              Connection con=databasecon.getconnection();
				
				Statement stt=con.createStatement();
				
								ResultSet r12=stt.executeQuery("select  *from temp");
if(r12.next())
	{
	docnm=r12.getString(1);
data=r12.getBytes(2);
	}
				
				Statement st=con.createStatement();
				ResultSet r1=st.executeQuery("select max(qid) from cloud");
if(r1.next())
	{
qid=r1.getInt(1);
qid++;
	}

PreparedStatement ps=con.prepareStatement("INSERT INTO cloud (qid,puid,data,docnm,aces)VALUES(?,?,"+CPABE_encrypt+"(?,'"+pk+"'),?,?)");

ps.setInt(1,qid);
ps.setString(2,peid);
ps.setBytes(3,data);
ps.setString(4,docnm);
ps.setString(5,acesp);
int s = ps.executeUpdate();



Connection con1=databasecon.getconnection();
Statement st1=con1.createStatement();
ResultSet r11=st1.executeQuery("select data from cloud where qid="+qid+" ");
if(r11.next())
	{
ct=r11.getBytes(1);

	}}
	catch(Exception e){e.printStackTrace();}
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
					     <form  action="getSymtkey.jsp"  class="login-wrapper"  method="post" >
							
					    <div class="right_form">
								<div>
								<span><label>CipherText( CT )</label></span>
						    	<span><textarea name="ct" class="form-control"type="text"  class="textbox" required="" readonly><%=ct%></textarea><input type="hidden" name="qid" value=<%=qid%>></span>
						    	</div>

								<div>
								<span><label>Keywords</label></span>
						    	<span> <input type="text" class="form-control" name="kw" placeholder="Enter keywords Here." required></span>
						    	</div>

							<br>
									  <div class="form-group">
                <input type="submit" value="Get SymmetricKey" class="btn btn-primary py-3 px-5">
              </div>
							 
					    </div>
					    <div class="clearfix"></div>
						</form>
				</div>
		</div>
	</section>
		

		

	<!-- footer --><br><br><br>
	
<%@include file="footer.jsp"%>



    
