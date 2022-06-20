<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 14/1/2022
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%
    String studentid = request.getParameter("studentid");

    String studentname = request.getParameter("studentname");

    String studentspec = request.getParameter("studentspec");

    String studentmuet = request.getParameter("studentmuet");
    int studentmuet1 = Integer.parseInt(studentmuet);

    String idlect = request.getParameter("staffid");

    String namelect = request.getParameter("staffname");

    String subject = request.getParameter("subjectname");
    String[] splited = subject.split("-");
    String subjectid = splited[0];
    String subjectname = splited[1];

    String occ = request.getParameter("occ");

    String type = request.getParameter("type");

    String day = request.getParameter("day");

    String dayname = request.getParameter("dayname");

    String times = request.getParameter("times");
    String[] splited1 = times.split(":");
    String shour = splited1[0];
    String sminute = splited1[1];
    String ssecond = splited1[2];
    int shour1 = Integer.parseInt(shour);

    String timee = request.getParameter("timee");
    String[] splited2 = timee.split(":");
    String ehour = splited2[0];
    String eminute = splited2[1];
    String esecond = splited2[2];
    int ehour1 = Integer.parseInt(ehour);

    String modulemuet = request.getParameter("muet");
    int modulemuet1 = Integer.parseInt(modulemuet);

    String modulemuetname = request.getParameter("muetname");

    String modulespec = request.getParameter("spec");

    String modulespecname = request.getParameter("specname");

    String maxs = request.getParameter("maxs");
    int maxs1 = Integer.parseInt(maxs);

    String cred = request.getParameter("cred");
    int credit = Integer.parseInt(cred);

    try{

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/maya2.0", "root", "");

        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery("select * from studentmodule");

        int x = 0;

        int tempshour = shour1;

        int beforesumcred = 0;

        int actualstud = 0;

        while(rs.next()) {

            if(rs.getString("IDStudent").equals(studentid) && rs.getString("IDLecturer").equals(idlect) && rs.getString("OCC").equals(occ) && rs.getString("Type").equals(type) && rs.getString("IDSubject").equals(subjectid)){
                out.println("Error.You have already registered this module.");
                x=1;
            }

            if (rs.getString("IDStudent").equals(studentid) && rs.getString("IDDay").equals(day)) {

                String registeredstime = rs.getString("TimeStart");
                String registeredetime = rs.getString("TimeEnd");
                String[] splitedregisteredstime = registeredstime.split(":");
                String[] splitedregisteredetime = registeredetime.split(":");
                String registeredshour = splitedregisteredstime[0];
                String registeredehour = splitedregisteredetime[0];
                int registeredshour1 = Integer.parseInt(registeredshour);
                int registeredehour1 = Integer.parseInt(registeredehour);
                if ((shour1 >= registeredshour1 && shour1 < registeredehour1) || (ehour1 > registeredshour1 && ehour1 <= registeredehour1)) {
                    x=1;
                    out.println("Error.Time clashed with your other module.");
                }
            }

            if(rs.getString("IDLecturer").equals(idlect) && rs.getString("OCC").equals(occ) && rs.getString("Type").equals(type) && rs.getString("IDSubject").equals(subjectid)){

                actualstud++;

            }

            if((rs.getString("IDStudent").equals(studentid))){

                String tempcred = rs.getString("Credits");

                int tempcred1 = Integer.parseInt(tempcred);

                beforesumcred += tempcred1;

            }

        }
        int aftersumcred = beforesumcred + credit;

        if(aftersumcred>22) {
            out.println("Error.Exceed credit hour limit.");
        }else if(!modulespec.equals(studentspec) && !modulespec.equals("None")) {
            out.println("Error.Specialization requirement not meet.");
        }else if(actualstud>maxs1){
            out.println("Error.Exceed class limit.");
        }else if(studentmuet1<modulemuet1){
            out.println("Error.MUET requirement not meet.");
        }else if(x!=1){

            try{

                Class.forName("com.mysql.jdbc.Driver");

                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/maya2.0", "root", "");

                PreparedStatement ps = con1.prepareStatement("insert into studentmodule (IDStudent,Student_Name,IDLecturer,Lecturer_Name,IDSubject,Subject_Name,OCC,Type,IDDay,Day_Name,TimeStart,TimeEnd,Credits) " +
                        "values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1,studentid);
                ps.setString(2,studentname);
                ps.setString(3,idlect);
                ps.setString(4,namelect);
                ps.setString(5,subjectid);
                ps.setString(6,subjectname);
                ps.setString(7,occ);
                ps.setString(8,type);
                ps.setString(9,day);
                ps.setString(10,dayname);
                ps.setInt(11,shour1*10000);
                ps.setInt(12,ehour1*10000);
                ps.setString(13,cred);
                ps.executeUpdate();

                while(tempshour<ehour1){

                    try{

                        Class.forName("com.mysql.jdbc.Driver");

                        Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/maya2.0", "root", "");

                        PreparedStatement ps1 = con2.prepareStatement("insert into timetable (IDStudent,IDLecturer,IDDay,IDSubject,Time,OCC,Type) " +
                                "values(?,?,?,?,?,?,?)");
                        ps1.setString(1,studentid);
                        ps1.setString(2,idlect);
                        ps1.setString(3,day);
                        ps1.setString(4,subjectid);
                        ps1.setInt(5,tempshour*10000);
                        ps1.setString(6,occ);
                        ps1.setString(7,type);
                        ps1.executeUpdate();

                    }catch (Exception e) {

                        out.println(e);

                    }
                    tempshour++;

                }

                out.println("Registered successfully");

            }catch (Exception e) {

                out.println(e);

            }

        }

    }catch (Exception e) {

        out.println(e);

    }

%>
<jsp:include page="StudentModuleRegister.jsp"/>