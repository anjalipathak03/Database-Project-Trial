<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
int count=1;
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
PreparedStatement pst=con.prepareStatement("Select * from ngo.info");
ResultSet rs=pst.executeQuery();
PrintWriter pw=response.getWriter();
pw.print("<table class='table'><thead class='thead-dark'><tr><th scope='col'>Sr. No.</th><th scope='col'>");
pw.print("Name"+"</th><th scope='col'>"+"Address"+"</th><th scope='col'>"+"Mobile No."+"</th><th scope='col'>"+"DOB"+"</th><th scope='col'>"+"Relative Name"+"</th><th scope='col'>"+"Mobile No.");
pw.print("</th></tr></thead><tbody>");
while(rs.next()){

	
   
    String fname =rs.getString(1);
    String mname =rs.getString(2);
    String last =rs.getString(3);
    String address =rs.getString(4);
    String city =rs.getString(5);
    String state =rs.getString(6);
    String pin =rs.getString(7);
    String mob_no =rs.getString(8);
    String dob =rs.getString(9);
    String relative =rs.getString(10);
    String rmob =rs.getString(11);
   
    pw.print("<tr><td>");
    pw.print(count+++"</td><td>"+fname+" "+mname+" "+last+"</td><td>"+address+" "+city+" "+" "+state+" "+pin+"<td>"+mob_no+" "+"</td><td>"+dob+"</td><td>"+relative+"</td><td>"+rmob);
    pw.print("</td></tr>");
   
	}




%>

 </tbody>
      </table>


     
      <div id="nav-placeholder1"></div>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$.get("footer.html", function(data1){
    $("#nav-placeholder1").replaceWith(data1);
});
</script>
      
</body>
</html>