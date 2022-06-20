<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 15/1/2022
  Time: 5:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Maya 2.0 - Timetable</title>
    <link href="Timetable.css" rel="stylesheet" type="text/css">
</head>
<%
    String uname = (String) session.getAttribute("ID");
    if (null == uname) {
        session.setAttribute("errorMessage", "Login Failed ");
        response.sendRedirect("Login.jsp");
    }
%>
<body>
<sql:setDataSource var="myDs" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/maya2.0"
                   user="root" password=""/>
<sql:query var="timetable"   dataSource="${myDs}">
    SELECT * FROM timetable WHERE IDStudent = ?;
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
    <!--insert after <div class -->
    <section>
        <div class="Border">
            <c:forEach var="Table" items="${timetable.rows}">
                <c:set var="Day" value="${Table.IDDay}"/>
                <c:if test="${Day==1}">
                    <c:if test="${Table.Time=='08:00:00'}">
                        <c:set var="mon_8" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_8" value="${Table.Type}"/>
                        <c:set var="montype_8" value="${mon_8}(${type_mon_8})"/>
                    </c:if>
                    <c:if test="${Table.Time=='09:00:00'}">
                        <c:set var="mon_9" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_9" value="${Table.Type}"/>
                        <c:set var="montype_9" value="${mon_9}(${type_mon_9})"/>
                    </c:if>
                    <c:if test="${Table.Time=='10:00:00'}">
                        <c:set var="mon_10" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_10" value="${Table.Type}"/>
                        <c:set var="montype_10" value="${mon_10}(${type_mon_10})"/>
                    </c:if>
                    <c:if test="${Table.Time=='11:00:00'}">
                        <c:set var="mon_11" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_11" value="${Table.Type}"/>
                        <c:set var="montype_11" value="${mon_11}(${type_mon_11})"/>
                    </c:if>
                    <c:if test="${Table.Time=='12:00:00'}">
                        <c:set var="mon_12" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_12" value="${Table.Type}"/>
                        <c:set var="montype_12" value="${mon_12}(${type_mon_12})"/>
                    </c:if>
                    <c:if test="${Table.Time=='13:00:00'}">
                        <c:set var="mon_13" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_13" value="${Table.Type}"/>
                        <c:set var="montype_13" value="${mon_13}(${type_mon_13})"/>
                    </c:if>
                    <c:if test="${Table.Time=='14:00:00'}">
                        <c:set var="mon_14" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_14" value="${Table.Type}"/>
                        <c:set var="montype_14" value="${mon_14}(${type_mon_14})"/>
                    </c:if>
                    <c:if test="${Table.Time=='15:00:00'}">
                        <c:set var="mon_15" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_15" value="${Table.Type}"/>
                        <c:set var="montype_15" value="${mon_15}(${type_mon_15})"/>
                    </c:if>
                    <c:if test="${Table.Time=='16:00:00'}">
                        <c:set var="mon_16" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_16" value="${Table.Type}"/>
                        <c:set var="montype_16" value="${mon_16}(${type_mon_16})"/>
                    </c:if>
                    <c:if test="${Table.Time=='17:00:00'}">
                        <c:set var="mon_17" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_17" value="${Table.Type}"/>
                        <c:set var="montype_17" value="${mon_17}(${type_mon_17})"/>
                    </c:if>
                    <c:if test="${Table.Time=='18:00:00'}">
                        <c:set var="mon_18" value="${Table.IDSubject}"/>
                        <c:set var="type_mon_18" value="${Table.Type}"/>
                        <c:set var="montype_18" value="${mon_11}(${type_mon_18})"/>
                    </c:if>
                </c:if>
                <c:if test="${Day==2}">
                    <c:if test="${Table.Time=='08:00:00'}">
                        <c:set var="tue_8" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_8" value="${Table.Type}"/>
                        <c:set var="tuetype_8" value="${tue_8}(${type_tue_8})"/>
                    </c:if>
                    <c:if test="${Table.Time=='09:00:00'}">
                        <c:set var="tue_9" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_9" value="${Table.Type}"/>
                        <c:set var="tuetype_9" value="${tue_9}(${type_tue_9})"/>
                    </c:if>
                    <c:if test="${Table.Time=='10:00:00'}">
                        <c:set var="tue_10" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_10" value="${Table.Type}"/>
                        <c:set var="tuetype_10" value="${tue_10}(${type_tue_10})"/>
                    </c:if>
                    <c:if test="${Table.Time=='11:00:00'}">
                        <c:set var="tue_11" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_11" value="${Table.Type}"/>
                        <c:set var="tuetype_11" value="${tue_11}(${type_tue_11})"/>
                    </c:if>
                    <c:if test="${Table.Time=='12:00:00'}">
                        <c:set var="tue_12" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_12" value="${Table.Type}"/>
                        <c:set var="tuetype_12" value="${tue_12}(${type_tue_12})"/>
                    </c:if>
                    <c:if test="${Table.Time=='13:00:00'}">
                        <c:set var="tue_13" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_13" value="${Table.Type}"/>
                        <c:set var="tuetype_13" value="${tue_13}(${type_tue_13})"/>
                    </c:if>
                    <c:if test="${Table.Time=='14:00:00'}">
                        <c:set var="tue_14" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_14" value="${Table.Type}"/>
                        <c:set var="tuetype_14" value="${tue_14}(${type_tue_14})"/>
                    </c:if>
                    <c:if test="${Table.Time=='15:00:00'}">
                        <c:set var="tue_15" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_15" value="${Table.Type}"/>
                        <c:set var="tuetype_15" value="${tue_15}(${type_tue_15})"/>
                    </c:if>
                    <c:if test="${Table.Time=='16:00:00'}">
                        <c:set var="tue_16" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_16" value="${Table.Type}"/>
                        <c:set var="tuetype_16" value="${tue_16}(${type_tue_16})"/>
                    </c:if>
                    <c:if test="${Table.Time=='17:00:00'}">
                        <c:set var="tue_17" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_17" value="${Table.Type}"/>
                        <c:set var="tuetype_17" value="${tue_17}(${type_tue_17})"/>
                    </c:if>
                    <c:if test="${Table.Time=='18:00:00'}">
                        <c:set var="tue_18" value="${Table.IDSubject}"/>
                        <c:set var="type_tue_18" value="${Table.Type}"/>
                        <c:set var="tuetype_18" value="${tue_18}(${type_tue_18})"/>
                    </c:if>
                </c:if>
                <c:if test="${Day==3}">
                    <c:if test="${Table.Time=='08:00:00'}">
                        <c:set var="wed_8" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_8" value="${Table.Type}"/>
                        <c:set var="wedtype_8" value="${wed_8}(${type_wed_8})"/>
                    </c:if>
                    <c:if test="${Table.Time=='09:00:00'}">
                        <c:set var="wed_9" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_9" value="${Table.Type}"/>
                        <c:set var="wedtype_9" value="${wed_9}(${type_wed_9})"/>
                    </c:if>
                    <c:if test="${Table.Time=='10:00:00'}">
                        <c:set var="wed_10" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_10" value="${Table.Type}"/>
                        <c:set var="wedtype_10" value="${wed_10}(${type_wed_10})"/>
                    </c:if>
                    <c:if test="${Table.Time=='11:00:00'}">
                        <c:set var="wed_11" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_11" value="${Table.Type}"/>
                        <c:set var="wedtype_11" value="${wed_11}(${type_wed_11})"/>
                    </c:if>
                    <c:if test="${Table.Time=='12:00:00'}">
                        <c:set var="wed_12" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_12" value="${Table.Type}"/>
                        <c:set var="wedtype_12" value="${wed_12}(${type_wed_12})"/>
                    </c:if>
                    <c:if test="${Table.Time=='13:00:00'}">
                        <c:set var="wed_13" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_13" value="${Table.Type}"/>
                        <c:set var="wedtype_13" value="${wed_13}(${type_wed_13})"/>
                    </c:if>
                    <c:if test="${Table.Time=='14:00:00'}">
                        <c:set var="wed_14" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_14" value="${Table.Type}"/>
                        <c:set var="wedtype_14" value="${wed_14}(${type_wed_14})"/>
                    </c:if>
                    <c:if test="${Table.Time=='15:00:00'}">
                        <c:set var="wed_15" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_15" value="${Table.Type}"/>
                        <c:set var="wedtype_15" value="${wed_15}(${type_wed_15})"/>
                    </c:if>
                    <c:if test="${Table.Time=='16:00:00'}">
                        <c:set var="wed_16" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_16" value="${Table.Type}"/>
                        <c:set var="wedtype_16" value="${wed_16}(${type_wed_16})"/>
                    </c:if>
                    <c:if test="${Table.Time=='17:00:00'}">
                        <c:set var="wed_17" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_17" value="${Table.Type}"/>
                        <c:set var="wedtype_17" value="${wed_17}(${type_wed_17})"/>
                    </c:if>
                    <c:if test="${Table.Time=='18:00:00'}">
                        <c:set var="wed_18" value="${Table.IDSubject}"/>
                        <c:set var="type_wed_18" value="${Table.Type}"/>
                        <c:set var="wedtype_18" value="${wed_18}(${type_wed_18})"/>
                    </c:if>
                </c:if>
                <c:if test="${Day==4}">
                    <c:if test="${Table.Time=='08:00:00'}">
                        <c:set var="thu_8" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_8" value="${Table.Type}"/>
                        <c:set var="thutype_8" value="${thu_8}(${type_thu_8})"/>
                    </c:if>
                    <c:if test="${Table.Time=='09:00:00'}">
                        <c:set var="thu_9" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_9" value="${Table.Type}"/>
                        <c:set var="thutype_9" value="${thu_9}(${type_thu_9})"/>
                    </c:if>
                    <c:if test="${Table.Time=='10:00:00'}">
                        <c:set var="thu_10" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_10" value="${Table.Type}"/>
                        <c:set var="thutype_10" value="${thu_10}(${type_thu_10})"/>
                    </c:if>
                    <c:if test="${Table.Time=='11:00:00'}">
                        <c:set var="thu_11" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_11" value="${Table.Type}"/>
                        <c:set var="thutype_11" value="${thu_11}(${type_thu_11})"/>
                    </c:if>
                    <c:if test="${Table.Time=='12:00:00'}">
                        <c:set var="thu_12" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_12" value="${Table.Type}"/>
                        <c:set var="thutype_12" value="${thu_12}(${type_thu_12})"/>
                    </c:if>
                    <c:if test="${Table.Time=='13:00:00'}">
                        <c:set var="thu_13" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_13" value="${Table.Type}"/>
                        <c:set var="thutype_13" value="${thu_13}(${type_thu_13})"/>
                    </c:if>
                    <c:if test="${Table.Time=='14:00:00'}">
                        <c:set var="thu_14" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_14" value="${Table.Type}"/>
                        <c:set var="thutype_14" value="${thu_14}(${type_thu_14})"/>
                    </c:if>
                    <c:if test="${Table.Time=='15:00:00'}">
                        <c:set var="thu_15" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_15" value="${Table.Type}"/>
                        <c:set var="thutype_15" value="${thu_15}(${type_thu_15})"/>
                    </c:if>
                    <c:if test="${Table.Time=='16:00:00'}">
                        <c:set var="thu_16" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_16" value="${Table.Type}"/>
                        <c:set var="thutype_16" value="${thu_16}(${type_thu_16})"/>
                    </c:if>
                    <c:if test="${Table.Time=='17:00:00'}">
                        <c:set var="thu_17" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_17" value="${Table.Type}"/>
                        <c:set var="thutype_17" value="${thu_17}(${type_thu_17})"/>
                    </c:if>
                    <c:if test="${Table.Time=='18:00:00'}">
                        <c:set var="thu_18" value="${Table.IDSubject}"/>
                        <c:set var="type_thu_18" value="${Table.Type}"/>
                        <c:set var="thutype_18" value="${thu_18}(${type_thu_18})"/>
                    </c:if>
                </c:if>
                <c:if test="${Day==5}">
                    <c:if test="${Table.Time=='08:00:00'}">
                        <c:set var="fri_8" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_8" value="${Table.Type}"/>
                        <c:set var="fritype_8" value="${fri_8}(${type_fri_8})"/>
                    </c:if>
                    <c:if test="${Table.Time=='09:00:00'}">
                        <c:set var="fri_9" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_9" value="${Table.Type}"/>
                        <c:set var="fritype_9" value="${fri_9}(${type_fri_9})"/>
                    </c:if>
                    <c:if test="${Table.Time=='10:00:00'}">
                        <c:set var="fri_10" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_10" value="${Table.Type}"/>
                        <c:set var="fritype_10" value="${fri_10}(${type_fri_10})"/>
                    </c:if>
                    <c:if test="${Table.Time=='11:00:00'}">
                        <c:set var="fri_11" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_11" value="${Table.Type}"/>
                        <c:set var="fritype_11" value="${fri_11}(${type_fri_11})"/>
                    </c:if>
                    <c:if test="${Table.Time=='12:00:00'}">
                        <c:set var="fri_12" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_12" value="${Table.Type}"/>
                        <c:set var="fritype_12" value="${fri_12}(${type_fri_12})"/>
                    </c:if>
                    <c:if test="${Table.Time=='13:00:00'}">
                        <c:set var="fri_13" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_13" value="${Table.Type}"/>
                        <c:set var="fritype_13" value="${fri_13}(${type_fri_13})"/>
                    </c:if>
                    <c:if test="${Table.Time=='14:00:00'}">
                        <c:set var="fri_14" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_14" value="${Table.Type}"/>
                        <c:set var="fritype_14" value="${fri_14}(${type_fri_14})"/>
                    </c:if>
                    <c:if test="${Table.Time=='15:00:00'}">
                        <c:set var="fri_15" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_15" value="${Table.Type}"/>
                        <c:set var="fritype_15" value="${fri_15}(${type_fri_15})"/>
                    </c:if>
                    <c:if test="${Table.Time=='16:00:00'}">
                        <c:set var="fri_16" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_16" value="${Table.Type}"/>
                        <c:set var="fritype_16" value="${fri_16}(${type_fri_16})"/>
                    </c:if>
                    <c:if test="${Table.Time=='17:00:00'}">
                        <c:set var="fri_17" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_17" value="${Table.Type}"/>
                        <c:set var="fritype_17" value="${fri_17}(${type_fri_17})"/>
                    </c:if>
                    <c:if test="${Table.Time=='18:00:00'}">
                        <c:set var="fri_18" value="${Table.IDSubject}"/>
                        <c:set var="type_fri_18" value="${Table.Type}"/>
                        <c:set var="fritype_18" value="${fri_18}(${type_fri_18})"/>
                    </c:if>
                </c:if>
            </c:forEach>
            <table style = "width: 1080px">
                <tr>
                    <th style = "width: 7%"></th>
                    <th>8:00 a.m.</th>
                    <th>9:00 a.m.</th>
                    <th>10:00 a.m.</th>
                    <th>11:00 a.m.</th>
                    <th>12:00 p.m.</th>
                    <th>1:00 p.m.</th>
                    <th>2:00 p.m.</th>
                    <th>3:00 p.m.</th>
                    <th>4:00 p.m.</th>
                    <th>5:00 p.m.</th>
                    <th>6:00 p.m.</th>
                </tr>
                <tr>
                    <td>Mon</td>
                    <td><c:out value="${montype_8}"/></td>
                    <td><c:out value="${montype_9}"/></td>
                    <td><c:out value="${montype_10}"/></td>
                    <td><c:out value="${montype_11}"/></td>
                    <td><c:out value="${montype_12}"/></td>
                    <td><c:out value="${montype_13}"/></td>
                    <td><c:out value="${montype_14}"/></td>
                    <td><c:out value="${montype_15}"/></td>
                    <td><c:out value="${montype_16}"/></td>
                    <td><c:out value="${montype_17}"/></td>
                    <td><c:out value="${montype_18}"/></td>
                </tr>
                <tr>
                    <td>Tue</td>
                    <td> <c:out value="${tuetype_8}"/> </td>
                    <td> <c:out value="${tuetype_9}"/> </td>
                    <td> <c:out value="${tuetype_10}"/> </td>
                    <td> <c:out value="${tuetype_11}"/> </td>
                    <td> <c:out value="${tuetype_12}"/> </td>
                    <td> <c:out value="${tuetype_13}"/> </td>
                    <td> <c:out value="${tuetype_14}"/> </td>
                    <td> <c:out value="${tuetype_15}"/> </td>
                    <td> <c:out value="${tuetype_16}"/> </td>
                    <td> <c:out value="${tuetype_17}"/> </td>
                    <td> <c:out value="${tuetype_18}"/> </td>
                </tr>
                <tr>
                    <td>Wed</td>
                    <td> <c:out value="${wedtype_8}"/> </td>
                    <td> <c:out value="${wedtype_9}"/> </td>
                    <td> <c:out value="${wedtype_10}"/> </td>
                    <td> <c:out value="${wedtype_11}"/> </td>
                    <td> <c:out value="${wedtype_12}"/> </td>
                    <td> <c:out value="${wedtype_13}"/> </td>
                    <td> <c:out value="${wedtype_14}"/> </td>
                    <td> <c:out value="${wedtype_15}"/> </td>
                    <td> <c:out value="${wedtype_16}"/> </td>
                    <td> <c:out value="${wedtype_17}"/> </td>
                    <td> <c:out value="${wedtype_18}"/> </td>
                </tr>
                <tr>
                    <td>Thur</td>
                    <td> <c:out value="${thutype_8}"/> </td>
                    <td> <c:out value="${thutype_9}"/> </td>
                    <td> <c:out value="${thutype_10}"/> </td>
                    <td> <c:out value="${thutype_11}"/> </td>
                    <td> <c:out value="${thutype_12}"/> </td>
                    <td> <c:out value="${thutype_13}"/> </td>
                    <td> <c:out value="${thutype_14}"/> </td>
                    <td> <c:out value="${thutype_15}"/> </td>
                    <td> <c:out value="${thutype_16}"/> </td>
                    <td> <c:out value="${thutype_17}"/> </td>
                    <td> <c:out value="${thutype_18}"/> </td>
                </tr>
                <tr>
                    <td>Fri</td>
                    <td> <c:out value="${fritype_8}"/> </td>
                    <td> <c:out value="${fritype_9}"/> </td>
                    <td> <c:out value="${fritype_10}"/> </td>
                    <td> <c:out value="${fritype_11}"/> </td>
                    <td> <c:out value="${fritype_12}"/> </td>
                    <td> <c:out value="${fritype_13}"/> </td>
                    <td> <c:out value="${fritype_14}"/> </td>
                    <td> <c:out value="${fritype_15}"/> </td>
                    <td> <c:out value="${fritype_16}"/> </td>
                    <td> <c:out value="${fritype_17}"/> </td>
                    <td> <c:out value="${fritype_18}"/> </td>
                </tr>
            </table>
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </section>
</div>
<footer>
    <p>Any problem?</p>
    <p>Contact us : </p>
</footer>
</body>
</html>
