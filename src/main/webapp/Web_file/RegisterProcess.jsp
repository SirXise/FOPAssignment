<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/1/2022
  Time: 1:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.sql.*"%>

        <%

            String id = request.getParameter("ID");

            String name = request.getParameter("Full_Name");

            String pass = request.getParameter("Password");

            String gender = request.getParameter("IDGender");

            String status = request.getParameter("Status");

            String spec = request.getParameter("special");

            String muet = request.getParameter("muetband");

            try {

                Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/maya2.0", "root", "");

                PreparedStatement ps = con.prepareStatement("insert into mayausers values(?,?,?,?,?,?,?)");
                ps.setString(1,id);
                ps.setString(2,name);
                ps.setString(3,gender);
                ps.setString(4,pass);
                ps.setString(5,status);
                ps.setString(6,spec);
                ps.setString(7,muet);
                ps.executeUpdate();

                out.println("Data saved successfully");
                }catch (Exception e) {

                out.println(e);

    }

%>
            <jsp:include page="Signup.jsp" />
