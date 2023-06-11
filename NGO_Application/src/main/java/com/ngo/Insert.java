package com.ngo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Insert extends HttpServlet {
	static {
		Birthday a=new Birthday();
		try {
			a.service(null, null);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fname=req.getParameter("fn");
		String mname=req.getParameter("mn");
		String lname=req.getParameter("ln");
		String address=req.getParameter("ad");
		 String city=req.getParameter("ct");
		 String state=req.getParameter("st");
		 String pin=req.getParameter("pn");
		 String mobno=req.getParameter("mb");
		 String dob=req.getParameter("db");
		 String rname=req.getParameter("rn");
		 String rmobno=req.getParameter("rmb");
		 
		 
		 try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
			PreparedStatement pst=con.prepareStatement("insert into ngo.info values(?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, fname);
			pst.setString(2, mname);
			pst.setString(3, lname);
			pst.setString(4, address);
			pst.setString(5, city);
			pst.setString(6, state);
			pst.setString(7, pin);
			pst.setString(8, mobno);
			pst.setString(9, dob);
			pst.setString(10, rname);
			pst.setString(11, rmobno);
			
			pst.executeUpdate();
			System.out.println("done");
			
			RequestDispatcher rd=req.getRequestDispatcher("NewFile.html");
			rd.forward(req, resp);
			} catch (Exception e) {
			
			e.printStackTrace();
		}
		 
	}
}