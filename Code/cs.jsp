<%@ include file="header.jsp"%>
<%
if(request.getParameter("msg")!=null){

out.println("<script>alert('Invalid Credentials')</script>");
}

%>

 <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Cloud Server</h1>
            
          </div>
        </div>
      </div>
    </section>
	<br><br><br><br>
	<div class="row block-9 justify-content-center mb-5">
          <div class="col-md-10 mb-md-5">
          	<h2 class="text-center">CloudServer Login </h2>
            <form action="cslgnchk.jsp" >
              <div class="form-group">
                <input type="text" name="uid" class="form-control" required placeholder="User ID">
              </div>
              <div class="form-group">
                <input type="password" name="pwd" class="form-control"  required placeholder="Password">
              </div>
              <div class="form-group">
                <input type="submit" value="Login" class="btn btn-primary py-3 px-4">
              </div>
            </form><br>
          </div>
        </div>
      </div>

<%@ include file="footer.jsp"%>