<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 30/12/2021
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Maya 2.0 - Home</title>
    <link href="StudentHome.css" rel="stylesheet" type="text/css">
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
<sql:query var="listmodule"   dataSource="${myDS}">
    SELECT * FROM mayausers WHERE ID = ?;
    <sql:param value="${sessionScope.ID}"/>
</sql:query>
<sql:query var="listmodule"   dataSource="${myDS}">
    SELECT * FROM studentmodule WHERE IDStudent = ?;
    <sql:param value="${sessionScope.ID}"/>
</sql:query>
<header>
    <div>
        <a href="StudentHome.jsp" target="_blank">
            <img src="UM_Logo2.png" width="140" height="55" alt="UM Logo">
        </a>
    </div>
    <nav>
        <ul>
            <li><a href="StudentModuleRegister.jsp">Module Registeration</a></li>
            <li><a href="Timetable.jsp">Timetable</a>	</li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </nav>
    <br><br><br>
</header>
<div>
    <section>
        <div>
            <a class="Greetings">Welcome <c:out value="${sessionScope.ID}"/></a>
        </div>
        <br>
        <div>
            <a class="words">Your registered module are :</a>
            <div class="border">
            <table class="css-serial">
                <thead>
                <tr>
                    <th>No</th>
                    <th>Subject</th>
                    <th>Lecturer</th>
                    <th>Occ</th>
                    <th>Type</th>
                    <th>Day</th>
                    <th>Time Start</th>
                    <th>Time End</th>
                    <th>Credit</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
<c:forEach var="module" items="${listmodule.rows}">
                <tr>
                    <!--intentionally left blank-->
                    <td></td>
                    <form name="registeredmodule" action="StudentDelete.jsp">
                        <input type="hidden" name="studentid" value="${sessionScope.ID}">
                        <input type="hidden" name="moduleno" value="${module.No}">
                        <input type="hidden" name="subjectid" value="${module.IDSubject}">
                        <input type="hidden" name="lectid" value="${module.IDLecturer}">
                        <input type="hidden" name="occ" value="${module.OCC}">
                        <input type="hidden" name="type" value="${module.Type}">
                    <td><c:out value="${module.IDSubject}-${module.Subject_Name}" /></td>
                    <td><c:out value="${module.Lecturer_Name}" /></td>
                    <td><c:out value="${module.OCC}" /></td>
                    <td><c:out value="${module.Type}" /></td>
                    <td><c:out value="${module.Day_Name}" /></td>
                    <td><c:out value="${module.TimeStart}" /></td>
                    <td><c:out value="${module.TimeEnd}" /></td>
                    <td><c:out value="${module.Credits}" /></td>
                    <td><input type="submit" value="Delete"></td>
                    </form>
                </tr>
</c:forEach>
                </tbody>
            </table>
            </div>
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
