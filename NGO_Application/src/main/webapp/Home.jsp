<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.list-home{
display: flex;
height: 640px;
width: auto;

justify-content: center;
align-items: center;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
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

	while (rs.next()) {
		
		String dob_db=rs.getString("dob");
		dob_db= dob_db.substring(5);
		if(dob_db.equals(date)){
			count++;
					
		}
		
	}
	
	} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


session.setAttribute("count", count);

%>

<h1>Dadhichi Dehdaan</h1>
<div class="row list-home">
<div class="col-4">
<div class="list-group" id="list-tab" role="tablist">
  <a class="list-group-item list-group-item-action active" id="list-home-list"  href="Home.jsp" role="tab" aria-controls="home">Home</a>
  <a class="list-group-item list-group-item-action" id="list-profile-list"  href="index.html" role="tab" aria-controls="profile">Registration</a>
  <a class="list-group-item list-group-item-action" id="list-messages-list"  href="Data.jsp" role="tab" aria-controls="messages">Members</a>
  <a class="list-group-item list-group-item-action" id="list-settings-list"  href="Birthday.jsp" role="tab" aria-controls="settings">Notification<span class="badge badge-light"> <%=count %> </span></a>
  <a class="list-group-item list-group-item-action" id="list-settings-list"  href="DiamondJubilee.jsp" role="tab" aria-controls="settings">Diamond Jubilee</a>
</div>
</div>

</div>

</body>
</html>