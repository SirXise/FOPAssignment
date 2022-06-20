<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/1/2022
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%
    String moduleno = request.getParameter("moduleno");

    String moduleidbefore = request.getParameter("moduleidbefore");

    String moduleoccbefore = request.getParameter("moduleoccbefore");

    String moduletypebefore = request.getParameter("moduletypebefore");

    String id = request.getParameter("id");

    String name = request.getParameter("name");

    String subject = request.getParameter("subject0");

    String subjectname = request.getParameter("subjectname0");

    String occ = request.getParameter("occurence");

    String type = request.getParameter("activity");

    String Day = request.getParameter("day");

    String dayname = request.getParameter("dayname");

    String times = request.getParameter("timestart");

    String timee = request.getParameter("timeend");

    String muet = request.getParameter("muet");

    String muetname = request.getParameter("muetname");

    String spec = request.getParameter("spec");

    String specname = request.getParameter("specname");

    String maxs = request.getParameter("nostudents");

    String cred = request.getParameter("credit");

    try {

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/maya2.0", "root", "");

        PreparedStatement ps = con.prepareStatement("update staffmodule set ID = ? ,Full_Name = ? ,IDSubject = ? ,Subject_Name = ? ,OCC = ? ,Type = ? ,IDDay = ? ,Day_Name = ? ,TimeStart = ? ,TimeEnd = ? ,IDSpecialization = ? ,SpecializationName = ? ,MUETband = ? ,MUETbandname = ? ,MaxStudent = ? ,Credits = ? where No = ?");
        ps.setString(1,id);
        ps.setString(2,name);
        ps.setString(3,subject);
        ps.setString(4,subjectname);
        ps.setString(5,occ);
        ps.setString(6,type);
        ps.setString(7,Day);
        ps.setString(8,dayname);
        ps.setString(9,times);
        ps.setString(10,timee);
        ps.setString(11,spec);
        ps.setString(12,specname);
        ps.setString(13,muet);
        ps.setString(14,muetname);
        ps.setString(15,maxs);
        ps.setString(16,cred);
        ps.setString(17,moduleno);
        ps.executeUpdate();

        PreparedStatement ps1 = con.prepareStatement("delete from timetable where IDLecturer = ? and IDSubject = ? and OCC = ? and Type = ?");
        ps1.setString(1,id);
        ps1.setString(2,moduleidbefore);
        ps1.setString(3,moduleoccbefore);
        ps1.setString(4,moduletypebefore);
        ps1.executeUpdate();

        PreparedStatement ps2 = con.prepareStatement("delete from studentmodule where IDLecturer = ? and IDSubject = ? and OCC = ? and Type = ?");
        ps2.setString(1,id);
        ps2.setString(2,moduleidbefore);
        ps2.setString(3,moduleoccbefore);
        ps2.setString(4,moduletypebefore);
        ps2.executeUpdate();

        out.println("Modify success.");
    }catch (Exception e) {

        out.println(e);

    }

%>
<jsp:include page="StaffHome.jsp"/>
