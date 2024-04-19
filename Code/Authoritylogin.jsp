<%@include file="header.jsp"%>
<% if(request.getParameter("msg1")!=null){
	  out.println("<script>alert('Invalid Credentials')</script>");
}%>
<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Trusted Authority</h1>
            
          </div>
        </div>
      </div>
    </section>	<section class="logins py-5">
		<div class="container py-xl-5 py-lg-3">
			<div class="title-section mb-md-5 mb-4">
				<h3 class="w3ls-title text-uppercase text-dark font-weight-bold">TA Login </h3>
			</div>
			<div class="login px-sm-4 mx-auto mw-100 login-wrapper">
				<form class="login-wrapper" action="taloginchk.jsp" method="post">
					<div class="form-group">
						<label>User ID</label>
						<input type="text" class="form-control" name="uid" placeholder="" required="">
						
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" class="form-control" name="pwd" placeholder="" required="">
					</div>
					<div class="form-group">
                <input type="submit" value="Login" class="btn btn-primary py-3 px-4">
              </div>
						
					</p>
				</form>
			</div>
		</div>
	</section>
	<!-- //login -->

	
<%@include file="footer.jsp"%>