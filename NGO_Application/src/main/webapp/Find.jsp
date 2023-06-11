<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

    Connection con=null;
    PreparedStatement pst=null;
    ResultSet rs=null;

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con =DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
        pst=con.prepareStatement("Select * from ngo.info where fname=?");
        Scanner sc= new Scanner(System.in);
        System.out.println("enter where id= ");
        String a=request.getParameter("se");
        pst.setString(1, a);
        rs=pst.executeQuery();
        PrintWriter pw=response.getWriter();
        pw.print("<table class='table table-striped'><tbody>");
        if (rs.next()) {
            
            String fname =rs.getString(1);
            String lname =rs.getString(2);
            pw.print("<tr><td>");
			pw.print("Todays birthday<br>");
			pw.print(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3));
			pw.print("</td></tr>");

        }
        else {
            System.out.println("record not found");
        }


    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>

  </tbody>
</table>
</body>
</html>