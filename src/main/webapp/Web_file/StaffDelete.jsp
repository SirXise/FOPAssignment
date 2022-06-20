<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 15/1/2022
  Time: 6:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%
    String lectid = request.getParameter("lectid");

    String moduleno = request.getParameter("moduleno");

    String subjectid = request.getParameter("moduleid");

    String occ = request.getParameter("moduleocc");

    String type = request.getParameter("moduletype");

    try{

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/maya2.0", "root", "");

        PreparedStatement ps = con.prepareStatement("delete from staffmodule where No = ?");
        ps.setString(1,moduleno);
        ps.executeUpdate();

        PreparedStatement ps1 = con.prepareStatement("delete from timetable where IDLecturer = ? and IDSubject = ? and OCC = ? and Type = ?");
        ps1.setString(1,lectid);
        ps1.setString(2,subjectid);
        ps1.setString(3,occ);
        ps1.setString(4,type);
        ps1.executeUpdate();

        PreparedStatement ps2 = con.prepareStatement("delete from studentmodule where IDLecturer = ? and IDSubject = ? and OCC = ? and Type = ?");
        ps2.setString(1,lectid);
        ps2.setString(2,subjectid);
        ps2.setString(3,occ);
        ps2.setString(4,type);
        ps2.executeUpdate();

        out.println("Delete Successful");

    } catch (Exception e) {

        out.println(e);

    }
%>
<jsp:include page="StaffHome.jsp"/>
