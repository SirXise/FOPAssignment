<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 30/12/2021
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Maya 2.0 - Log In</title>
    <link href="Login2.css" rel="stylesheet" type="text/css">
</head>

<body>
<header>
    <div>
        <div class="BrandLogo">
            <a href="Login.jsp" target="_blank">
                <img src="UM_Logo2.png" width="140" height="55" alt="UM Logo">
            </a>
        </div>
        <strong>&nbsp;Academic Portal MAYA 2.0</strong>
    </div>
    <br><br><br>
</header>
<div>
    <section>
        <div class="loginForm">
            <br><br>
                <form class="LoginForm2"  action="CheckLogin.jsp" method="post">
                    <br>
                    <h1>Log in to MAYA 2.0</h1>
                    <label>ID :</label>
                    <br>
                    <input name="ID" size="30" />
                    <br><br>
                    <label>Password:</label><br>
                    <input type="password" name="Password" size="30" />
                    <br><br>
                    <button type="submit" value="Login" >Login</button>  <input type="reset" value="Reset"/>
                    <br>
                    <p>No Account?<a href="Signup.jsp">Click Here</a></p>
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
