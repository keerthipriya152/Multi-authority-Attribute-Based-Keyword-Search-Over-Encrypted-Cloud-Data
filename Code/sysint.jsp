<%@ include file="taheader.jsp"%><%@ page  import="java.sql.*,it.unisa.dia.gas.jpbc.Element" import="databaseconnection.*,abe.CPABE"%>
<div class="breadcrumb-agile py-1">
		<ol class="breadcrumb m-0">
			<li class="breadcrumb-item">
				<a href="">setup </a>
			</li>
			<li class="breadcrumb-item active" aria-current="page"></li>
		</ol>
	</div>

<br><br>


<%

CPABE abe = new CPABE();
abe.setUp();
Element pk=abe.getPublicKey();
//System.out.println("Pk"+pk);
Element mk=abe.getMasterKey();

Connection con1=databasecon.getconnection();
 Statement st=con1.createStatement();
 ResultSet rst=st.executeQuery("select *from setup");

if(!rst.next()){
 PreparedStatement p=con1.prepareStatement("insert into setup values(?,?)");
p.setString(1,pk.toString());
p.setString(2,mk.toString());
int i=p.executeUpdate();
if(i>0){

%>
 <font color="green" size="+2">	<center><strong>PK , MSK are Generated.</center></strong><br>

	

<%} 
}else{%>
 <font color="RED" size="+2"> <center><strong>Keys are  already Generated.</strong></center>

 <%
}
 


 
 %></div><br><br><br><br>
     <%@ include file="footer.jsp"%>