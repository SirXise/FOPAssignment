<%-- 
    Document   : Module Register
    Created on : Jan 9, 2022, 6:19:10 PM
    Author     : Asus
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Maya 2.0 - Module Registration</title>
    <link href="StaffModuleRegister.css" rel="stylesheet" type="text/css">
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
<c:set var="id" value="${sessionScope.ID}"/>
<sql:query var="name"   dataSource="${myDS}">
    SELECT * FROM mayausers;
</sql:query>
<c:forEach var="namelist" items="${name.rows}">
    <c:set var="nametest" value="${namelist.ID}"/>
    <c:if test="${id==nametest}">
        <c:set var="fullname" value="${namelist.Full_Name}"/>
    </c:if>
</c:forEach>
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
<sql:query var="subject"   dataSource="${myDS}">
    SELECT * FROM subjek;
</sql:query>
<c:forEach var="subjectlist1" items="${subject.rows}">
    <c:set var="subject1" value="${subjectlist1.IDSubject}"/>
    <c:if test="${subject1=='GIG1012'}">
        <c:set var="subjectsel" value="${subjectlist1.IDSubject}"/>
        <c:set var="subjectnamesel" value="${subjectlist1.IDSubject}-${subjectlist1.Subject_Name}"/>
    </c:if>
</c:forEach>
<sql:query var="day"   dataSource="${myDS}">
    SELECT * FROM days;
</sql:query>
<c:forEach var="daylist1" items="${day.rows}">
    <c:set var="day1" value="${daylist1.IDDay}"/>
    <c:if test="${day1==1}">
        <c:set var="daysel" value="${daylist1.IDDay}"/>
        <c:set var="daynamesel" value="${daylist1.Day_Name}"/>
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
    <br>
</header>
<section>
    <div class="registermodule">
        <br><br>
        <form class="registermodule_form" name ="form" action="StaffModuleRegisterProcess.jsp" method="post">
            <br>
            <h1>Module Registration</h1>
            <input type="hidden" value="${sessionScope.ID}" name="id"/>
            <input type="hidden" value="${fullname}" name="name"/>
            <label>Subject       :</label>
                <select id="subjectlist" onchange="update1()">
                    <option value="${subjectsel}">${subjectnamesel}</option>
                    <c:forEach items="${subject.rows}" var="listsubject">
                        <c:set var="subtest" value="${listsubject.IDSubject}"/>
                        <c:if test="${subtest != subjectsel}">
                        <option value="${listsubject.IDSubject}"><c:out value="${listsubject.IDSubject}-${listsubject.Subject_Name}" /></option>
                        </c:if>
                    </c:forEach>
                </select>
            <input type="hidden" name="subject0" id="subject0" value="${subjectsel}">
            <input type="hidden" name="subjectname0" id="subjectname0" value="${subjectnamesel}">
            <script type="text/javascript">
                function update1() {
                    var select = document.getElementById('subjectlist');
                    var option = select.options[select.selectedIndex];

                    document.getElementById('subject0').value = option.value;
                    document.getElementById('subjectname0').value = option.text;
                }

                update();
            </script>
            <br><br>
            <label>Occurence     : </label>
            <input  name="occurence" size="20" />
            <br><br>
            <label>Activity      : </label>
            <select name ="activity">
                <option value ="Tutorial">Tutorial</option>
                <option value ="Lecture">Lecture</option>
                <option value ="Lab">Lab</option>
            </select>
            <br><br><!-- comment -->
            <label>Day           : </label>
            <select id="daylist" onchange="update2()" value="sel.daylist">
                <option value="${daysel}">${daynamesel}</option>
                <c:forEach items="${day.rows}" var="listday">
                    <c:set var="daytest" value="${listday.IDDay}"/>
                    <c:if test="${daytest!=daysel}">
                    <option value="${listday.IDDay}" ${sel.daylist == listday.IDDay ? 'selected' : '4'}><c:out value="${listday.Day_Name}"/></option>
                    </c:if>
                </c:forEach>
            </select>
            <input type="hidden" name="day" id="day" value="${daysel}">
            <input type="hidden" name="dayname" id="dayname" value="${daynamesel}">
            <script type="text/javascript">
                function update2() {
                    var select = document.getElementById('daylist');
                    var option = select.options[select.selectedIndex];

                    document.getElementById('day').value = option.value;
                    document.getElementById('dayname').value = option.text;
                }

                update();
            </script>
            <br><br>
            <label>Starting Time : </label>
            <select name ="timestart" >
                <option value ="08:00">8.00 a.m.</option>
                <option value ="09:00">9.00 a.m.</option>
                <option value ="10:00">10.00 a.m.</option>
                <option value ="11:00">11.00 a.m.</option>
                <option value ="12:00">12.00 p.m.</option>
                <option value ="13:00">1.00 p.m.</option>
                <option value ="14:00">2.00 p.m.</option>
                <option value ="15:00">3.00 p.m.</option>
                <option value ="16:00">4.00 p.m.</option>
            </select>
            <br><br>
            <label>Ending Time  : </label>
            <select name ="timeend" >
                <option value ="09:00">9.00 a.m.</option>
                <option value ="10:00">10.00 a.m.</option>
                <option value ="11:00">11.00 a.m.</option>
                <option value ="12:00">12.00 p.m.</option>
                <option value ="13:00">1.00 p.m.</option>
                <option value ="14:00">2.00 p.m.</option>
                <option value ="15:00">3.00 p.m.</option>
                <option value ="16:00">4.00 p.m.</option>
                <option value ="17:00">5.00 p.m.</option>
            </select>
            <br><br>
            <label>MUET Band  : </label>
            <select id ="muetbandlist" onchange="update3()">
                <option value="${muetsel}">${muetnamesel}</option>
                <c:forEach items="${muetband.rows}" var="listmuet">
                    <c:set var="muettest" value="${listmuet.MUETband}"/>
                    <c:if test="${muettest!=muetsel}">
                    <option value="${listmuet.MUETband}"><c:out value="${listmuet.MUETbandname}"/></option>
                    </c:if>
                </c:forEach>
            </select>
            <input type="hidden" name="muet" id="muet" value="${muetsel}">
            <input type="hidden" name="muetname" id="muetname" value="${muetnamesel}">
            <script type="text/javascript">
                function update3() {
                    var select = document.getElementById('muetbandlist');
                    var option = select.options[select.selectedIndex];

                    document.getElementById('muet').value = option.value;
                    document.getElementById('muetname').value = option.text;
                }

                update();
            </script>
            <p1>(Only for English Course)</p1>
        </tr>
            <br><br><tr>
            <label>Specialization  : </label>
            <select id="specialization" onchange="specupdate()">
                <option value="${specsel}">${specnamesel}</option>
                <c:forEach items="${specialization.rows}" var="listspecial">
                    <c:set var="spectest" value="${listspecial.IDSpecialization}"/>
                    <c:if test="${spectest!=specsel}">
                    <option value="${listspecial.IDSpecialization}"><c:out value="${listspecial.SpecializationName}"/></option>
                    </c:if>
                </c:forEach>
            </select>
            <input type="hidden" name="spec" id="spec" value="${specsel}">
            <input type="hidden" name="specname" id="specname" value="${specnamesel}">
            <script type="text/javascript">
                function specupdate() {
                    var select = document.getElementById('specialization');
                    var option = select.options[select.selectedIndex];

                    document.getElementById('spec').value = option.value;
                    document.getElementById('specname').value = option.text;
                }

                update();
            </script>
            <br><br><tr>
            <label>Max Students  : </label>
            <input  name="nostudents" size="20"/>
        </tr>
            <br><br><tr>
            <label>Credits  : </label>
            <input  name="credit" size="20"/>
        </tr>

            <br><br>
            <input type="submit" value="Register"/>
            <input type="reset" value="Reset"/>
            <br><br>
        </form>

    </div>
    <br><br><br><br><br><br><br><br>
</section>
</body>
<footer>
    <p>Any problem?</p>
    <p>Contact us : </p>
</footer>
</html>