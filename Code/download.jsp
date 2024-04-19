<%@ page import="java.sql.*, javax.sql.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<%@page import="java.io.*,java.net.*"%>
<%@ page  import="java.sql.*" import="databaseconnection.*" %>
<%@include file="docheader.jsp"%>
<%!
public static String getMimeType(String fileUrl)
    throws java.io.IOException, MalformedURLException 
  {
    String type = null;
    URL u = new URL(fileUrl);
    URLConnection uc = null;
    uc = u.openConnection();
    type = uc.getContentType();
    return type;
  }

%>
<%				
byte[] data=null;

String docnm=request.getParameter("docnm");
String sk=request.getParameter("sk");
String qid=request.getParameter("qid");
System.out.println("doc="+docnm);
Connection con1 = databasecon.getconnection();
Statement st=con1.createStatement();
ResultSet r11=st.executeQuery("select "+CPABE_decrypt+"(data,'"+sk+"') from cloud where qid="+qid+" ");
if(r11.next())
	{
data=r11.getBytes(1);
	}


	String type=getMimeType("file:"+docnm);

    response.setContentType (type);
    response.setHeader ("Content-Disposition", "attachment;     filename=\""+docnm+"\"");

   
  
        ServletOutputStream outs = response.getOutputStream();

        int bit = 256;
        int i = 0;
            try {
                   
                        outs.write(data);
                    }
                         catch (IOException ioe) {
                        ioe.printStackTrace(System.out);
                    }
                        outs.flush();
                    outs.close();
                   

					
%>