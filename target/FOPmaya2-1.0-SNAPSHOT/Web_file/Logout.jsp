<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/1/2022
  Time: 5:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% session.invalidate();
    out.println("Logout Successful");
%>
<jsp:include page="Login.jsp" />