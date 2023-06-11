<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h4{
top-margin:100px;
}
</style>
</head>
<body>

<div id="nav-placeholder"></div>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$.get("navbar.html", function(data){
    $("#nav-placeholder").replaceWith(data);
});
</script>

<%
int count=0;
SimpleDateFormat format = new SimpleDateFormat("MM-dd");
Date d = new Date();
String date = format.format(d);


try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
	PreparedStatement pst=con.prepareStatement("select * from ngo.info");
	ResultSet rs =pst.executeQuery();
	PrintWriter pw=response.getWriter();
boolean a=false;

pw.print("<table class='table table-striped'><tbody>");
	while (rs.next()) {
		
		String dob_db=rs.getString("dob");
		dob_db= dob_db.substring(5);
		if(dob_db.equals(date)){
			count++;
			pw.print("<tr><td>");
			pw.print("Todays birthday<br>");
			pw.print(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(8));
			pw.print("</td></tr>");
			
			a=true;
			
		}
		
	}
	
	if(a==false){
		pw.print("<tr><td>");
		pw.print("No Birthdays Today <br>");
		pw.print("</td></tr>");
	
		
	}
	
	
	} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

session.setAttribute("count", count);

%>


  </tbody>
</table>

</body>
</html>