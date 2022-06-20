<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13/1/2022
  Time: 12:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <meta charset="utf-8">
    <title>Maya 2.0 - Module Registration</title>
    <link href="StudentModuleRegister.css" rel="stylesheet" type="text/css">
</head>
<%
    String uname = (String) session.getAttribute("ID");
    if (null == uname) {
        session.setAttribute("errorMessage", "Login Failed ");
        response.sendRedirect("Login.jsp");
    }
%>
<body>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/maya2.0"
        user="root" password=""
/>
<sql:query var="modulelist" dataSource="${myDS}">
    SELECT * FROM staffmodule ;
</sql:query>
<sql:query var="name" dataSource="${myDS}">
    SELECT * FROM mayausers;
</sql:query>
<c:forEach var="namelist" items="${name.rows}">
    <c:set var="id" value="${sessionScope.ID}"/>
    <c:set var="nametest" value="${namelist.ID}"/>
    <c:if test="${id==nametest}">
        <c:set var="fullname" value="${namelist.Full_Name}"/>
        <c:set var="studspec" value="${namelist.IDSpecialization}"/>
        <c:set var="studmuet" value="${namelist.MUETband}"/>
    </c:if>
</c:forEach>
<header>
    <div>
        <a href="StudentHome.jsp" target="_blank">
            <img src="UM_Logo2.png" width="140" height="55" alt="UM Logo">
        </a>
    </div>
    <nav>
        <ul>
            <li><a href="StudentModuleRegister.jsp">Module Registeration</a></li>
            <li><a href="Timetable.jsp">Timetable</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </nav>
    <br><br><br>
</header>
<div>
    <section>
        <div class="registermodule">
            <form class="registerForm" name="form">

                <h1>Module Registeration</h1>

                <input id="myInput" type="text" placeholder="Search..">
                <br><br>

                <table class="css-serial">

                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Subject Name</th>
                        <th>Lecturer</th>
                        <th>OCC</th>
                        <th>Type</th>
                        <th>Day</th>
                        <th>Time Start</th>
                        <th>Time End</th>
                        <th>Specialization</th>
                        <th>MUET Band</th>
                        <th>Max Student</th>
                        <th>Credits</th>
                    </tr>
                    </thead>
                    <tbody id="myTable" class="ModuleTable">
<c:forEach var="module" items="${modulelist.rows}">
                    <tr>
                        <td></td>
                        <form name="registermodule" action="StudentModuleRegisterProcess.jsp">
                            <input type="hidden" name="studentid" value="${sessionScope.ID}">
                            <input type="hidden" name="studentname" value="${fullname}">
                            <input type="hidden" name="studentspec" value="${studspec}">
                            <input type="hidden" name="studentmuet" value="${studmuet}">
                            <input type="hidden" name="no" value="${module.No}">
                            <input type="hidden" name="staffid" value="${module.ID}">
                            <input type="hidden" name="staffname" value="${module.Full_Name}">
                            <input type="hidden" name="subjectname" value="${module.Subject_Name}">
                            <input type="hidden" name="occ" value="${module.OCC}">
                            <input type="hidden" name="type" value="${module.Type}">
                            <input type="hidden" name="day" value="${module.IDDay}">
                            <input type="hidden" name="dayname" value="${module.Day_Name}">
                            <input type="hidden" name="times" value="${module.TimeStart}">
                            <input type="hidden" name="timee" value="${module.TimeEnd}">
                            <input type="hidden" name="muet" value="${module.MUETband}">
                            <input type="hidden" name="muetname" value="${module.MUETbandname}">
                            <input type="hidden" name="spec" value="${module.IDSpecialization}">
                            <input type="hidden" name="specname" value="${module.SpecializationName}">
                            <input type="hidden" name="maxs" value="${module.MaxStudent}">
                            <input type="hidden" name="cred" value="${module.Credits}">
                        <td><c:out value="${module.Subject_Name}"/></td>
                        <td><c:out value="${module.Full_Name}"/></td>
                        <td><c:out value="${module.OCC}"/></td>
                        <td><c:out value="${module.Type}"/></td>
                        <td><c:out value="${module.Day_Name}"/></td>
                        <td><c:out value="${module.TimeStart}"/></td>
                        <td><c:out value="${module.TimeEnd}"/></td>
                        <td><c:out value="${module.SpecializationName}"/></td>
                        <td><c:out value="${module.MUETbandname}"/></td>
                        <td><c:out value="${module.MaxStudent}"/></td>
                            <td><c:out value="${module.Credits}"/></td>
                        <td><button type="submit" value="submit">Add</button></td>
                        </form>
                    </tr>
</c:forEach>
                    </tbody>

                </table>
            </form>
        </div>
        <br><br><br><br><br><br><br><br>
    </section>
</div>
<footer>
    <p>Any problem?</p>
    <p>Contact us : </p>
</footer>
</body>
</html>
