<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 15/1/2022
  Time: 5:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%
    String studentid = request.getParameter("studentid");

    String moduleno = request.getParameter("moduleno");

    String subjectid = request.getParameter("subjectid");

    String lectid = request.getParameter("lectid");

    String occ = request.getParameter("occ");

    String type = request.getParameter("type");

    try{

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/maya2.0", "root", "");

        PreparedStatement ps = con.prepareStatement("delete from studentmodule where No = ?");
        ps.setString(1,moduleno);
        ps.executeUpdate();

        PreparedStatement ps1 = con.prepareStatement("delete from timetable where IDStudent = ? and IDLecturer = ? and IDSubject = ? and OCC = ? and Type = ?");
        ps1.setString(1,studentid);
        ps1.setString(2,lectid);
        ps1.setString(3,subjectid);
        ps1.setString(4,occ);
        ps1.setString(5,type);
        ps1.executeUpdate();

        out.println("Delete Successful");

    } catch (Exception e) {

        out.println(e);

    }
%>
<jsp:include page="StudentHome.jsp"/>