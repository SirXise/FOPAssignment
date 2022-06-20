<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 30/12/2021
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function yesnoCheck(that) {
            if (that.value == "Student") {
                document.getElementById("ifYes").style.display = "block";
            } else {
                document.getElementById("ifYes").style.display = "none";
            }
        }
    </script>
    <meta charset="utf-8">
    <title>Maya 2.0 - Sign up</title>
    <link href="SignUp.css" rel="stylesheet" type="text/css">
</head>
<body>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/maya2.0"
        user="root" password=""
/>
<sql:query var="muetband"   dataSource="${myDS}">
    SELECT * FROM muet;
</sql:query>
<c:forEach var="muetlist" items="${muetband.rows}">
    <c:set var="muet1" value="${muetlist.MUETband}"/>
    <c:if test="${muet1==0}">
        <c:set var="muetsel" value="${muetlist.MUETband}"/>
        <c:set var="muetnamesel" value="${muetlist.MUETbandname}"/>
    </c:if>
</c:forEach>
<sql:query var="specialization"   dataSource="${myDS}">
    SELECT * FROM specialization;
</sql:query>
<c:forEach var="speclist1" items="${specialization.rows}">
    <c:set var="spec1" value="${speclist1.IDSpecialization}"/>
    <c:if test="${spec1=='None'}">
        <c:set var="specsel" value="${speclist1.IDSpecialization}"/>
        <c:set var="specnamesel" value="${speclist1.SpecializationName}"/>
    </c:if>
</c:forEach>
<header>
    <div>
        <div class="BrandLogo">
            <a href="Login.jsp" target="_blank">
                <img src="UM_Logo2.png" width="140" height="55" alt="UM Logo">
            </a>
        </div>
        <strong>&nbsp;Maya 2.0 - Sign Up</strong>
    </div>
    <br><br><br>
</header>
<div>
    <section>
        <div class="RegisterForm">
            <br><br>
            <form class="RegisterForm2" action="RegisterProcess.jsp">
                <br>
                <h1>Sign up to MAYA 2.0</h1>
                <label>Full Name:</label><br>
                <input type="text" name="Full_Name"/>
                <br><br>
                <label>ID:</label><br>
                <input type="text" name="ID"/>
                <br><br>
                <label>Password:</label><br>
                <input type="password" name="Password"/>
                <br><br>
                <label>Gender</label>
                <select name="IDGender">
                    <option value="M" selected>Male</option>
                    <option value="F">Female</option>
                </select>
                <br><br>
                <label>Status :</label>
                <select name="Status" onchange="yesnoCheck(this);">
                    <option>Staff</option>
                    <option>Student</option>
                </select>
                <br><br>
                <div id="ifYes" style="display: none;">
                    <label>Specialization :</label>
                    <select name="special">
                        <option value="${specsel}">${specnamesel}</option>
                        <c:forEach items="${specialization.rows}" var="listspecial">
                            <c:set var="spectest" value="${listspecial.IDSpecialization}"/>
                            <c:if test="${spectest!=specsel}">
                                <option value="${listspecial.IDSpecialization}"><c:out value="${listspecial.SpecializationName}"/></option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <br><br>
                    <label>MUET Band :</label>
                    <br>
                    <select name="muetband">
                        <option value="${muetsel}">${muetnamesel}</option>
                        <c:forEach items="${muetband.rows}" var="listmuet">
                            <c:set var="muettest" value="${listmuet.MUETband}"/>
                            <c:if test="${muettest!=muetsel}">
                                <option value="${listmuet.MUETband}"><c:out value="${listmuet.MUETbandname}"/></option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <br><br>
                </div>
                <input type="submit" value="Register"/>  <input type="reset" value="Reset"/>
                <br>
                <p>Already have account?<a href="Login.jsp">Click Here</a></p>
                <br>
            </form>

        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </section>
</div>
<footer>
    <p>Any problem?</p>
    <p>Contact us : </p>
</footer>
</body>
</html>
