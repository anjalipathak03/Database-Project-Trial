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


SimpleDateFormat format = new SimpleDateFormat("yyyy");
Date d = new Date();
String date = format.format(d);
int date1=Integer.parseInt(date);
date1=date1-75;
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
		dob_db= dob_db.substring(0,4);
		int dob_db1=Integer.parseInt(dob_db);
		
		if(dob_db1==date1){
			
			pw.print("<tr><td>");
			pw.print("Diamond Jubilee..!!!<br>");
			pw.print("75th Anniversary.<br>");
			pw.print(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(8));
			pw.print("</td></tr>");
			a=true;
			
		}
		
	}
	
	if(a==false){
		pw.print("<h4>NO BIrthday Today</h4>");
		
	}
	
	
	} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
</body>
</html>