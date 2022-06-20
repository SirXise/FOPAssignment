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
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Maya 2.0 - Student's List</title>
    <link href="Search.css" rel="stylesheet" type="text/css">
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
<sql:query var="liststudent"   dataSource="${myDS}">
    SELECT * FROM studentmodule WHERE IDLecturer = ?;
    <sql:param value="${sessionScope.ID}"/>
</sql:query>
<header>
    <div>
        <a href="StaffHome.jsp" target="_blank">
            <img src="UM_Logo2.png" width="140" height="55" alt="UM Logo">
        </a>
    </div>
    <nav>
        <ul>
            <li><a href="StaffModuleRegister.jsp">Module Registeration</a></li>
            <li><a href="StudentList.jsp">Student List</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
        </ul>
    </nav>
    <br><br><br>
</header>
<div>
    <section>
            <div>
            <a class="Greetings">Your students are :</a>
            <br><br>
            <form name="searchForm" action="SearchingProcess.jsp">
                <input type="hidden" name="lectid" value="${sessionScope.ID}">
            <label>ID Subject :</label>
                <select name="subjectid">
                    <c:forEach var="subjectid" items="${liststudent.rows}">
                        <option value="${subjectid.IDSubject}">${subjectid.IDSubject}-${subjectid.Subject_Name}</option>
                    </c:forEach>
                </select>
            <label>&nbsp&nbsp&nbsp&nbsp&nbsp Occ :</label>
                <select name="occ">
                    <c:forEach var="occ" items="${liststudent.rows}">
                        <option value="${occ.OCC}">${occ.OCC}</option>
                    </c:forEach>
                </select>
            <label>&nbsp&nbsp&nbsp&nbsp&nbsp Type : </label>
                <select name="type">
                    <c:forEach var="type" items="${liststudent.rows}">
                        <option value="${type.Type}">${type.Type}</option>
                    </c:forEach>
                </select>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="submit" value="Search">
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
