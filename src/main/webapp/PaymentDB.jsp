<%@page import="javax.swing.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection"%> 
<%-- page import="com.mysql.jdbc.Driver" --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<title>Payment Database</title>   
<link rel="stylesheet" href="webb.css">
</head>
<body>
<ul>
<li><a href="webb.jsp" class="active">Home</a></li>
</ul>
<%
try
{
int f=0;
String fname = request.getParameter("fname");
String email = request.getParameter("email");
String mob = request.getParameter("mob");
String adr = request.getParameter("adr");
String city = request.getParameter("city");
String state = request.getParameter("state");
String zip = request.getParameter("zip");
String cname = request.getParameter("cname");
String ccnum = request.getParameter("ccnum");
String expmonth = request.getParameter("expmonth");
String expyear = request.getParameter("expyear");
String cvv = request.getParameter("cvv");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/serviceprovider", "root","Jayesh24"); 
Statement st=con.createStatement();
int k=st.executeUpdate("insert into payment(fname,email,mob,adr,city, state,zip,cname,ccnum,expmonth,expyear,cvv) values('"+fname+"','"+email+"','"+mob+"','"+adr+"','"+city+"','"+state+"','"+zip+"','"+cname+"','"+ccnum+"','"+expmonth+"','"+expyear+"','"+cvv+"')");                                                 
if(k>=1)
{
	JOptionPane.showMessageDialog(null, "Thank You.....!  Your Service is Confirm");
	response.sendRedirect("Payment.html");
}

else
 {
	JOptionPane.showMessageDialog(null, "Please enter valid credentials");
 }
}
catch(Exception e)
{
	out.println("error"+e);
}

%>

</body>
</html>

