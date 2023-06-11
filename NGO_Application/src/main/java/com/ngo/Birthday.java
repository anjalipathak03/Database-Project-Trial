package com.ngo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Birthday extends HttpServlet {
 @Override
protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
	 int count=0;
	 SimpleDateFormat format = new SimpleDateFormat("MM-dd");
	 Date d = new Date();
	 String date = format.format(d);


	 try {
	 	Class.forName("com.mysql.jdbc.Driver");
	 	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
	 	PreparedStatement pst=con.prepareStatement("select * from ngo.info");
	 	ResultSet rs =pst.executeQuery();
	 	PrintWriter pw=arg1.getWriter();
	
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
}
}
