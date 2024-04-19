<%@include file="docheader.jsp"%>
<%
if(request.getParameter("msg")!=null){

out.println("<script>alert('Encrypted documents and Encrypted index shared successfully..!')</script>");
}

%>
<head>
<script>  
function f1Submit() {  

var search=document.f1.keywords.value;

//alert("sear="+search.length());
if(search=="")
	{
alert('Please Enter Keyword for Searching..!'); 
}else{
alert('keyword is Sent to CS');  
alert('Wait until get Results');  
document.f1.action="req1.jsp";  
document.f1.submit(); 
}

}
</script>
</head>
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
<section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				

			</div>
			<div class="login px-sm-4 mx-auto mw-100 login-wrapper">
					     <form class="login-wrapper" name="f1" method="post">
							
					   <div class="form-group">
                <input type="text" class="form-control"  name="keywords" placeholder="Search Here." required>
              </div>

							

							
			  <div class="form-group">
                <input type="submit" value="Search" onclick="f1Submit()" class="btn btn-primary py-3 px-5">
              </div>
								
							 
					    </div>
					    <div class="clearfix"></div>
						</form>
			</div>
		</div>
	</section>
		

	<!-- footer --><br><br><br>
	
<%@include file="footer.jsp"%>