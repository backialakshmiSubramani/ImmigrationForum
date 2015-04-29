<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page &raquo; Login</title>
        <link rel="stylesheet" type="text/css" href="styles/main.css"/>
    </head>
    <body>
    <center>
        <div id="hd">
            <img src="images/immigrationLogo.jpg" alt="logo"/>
        </div>
        <div id="bd">
            <h1>Log In to Your Forum Account</h1>
            <h2 class="flash">${flash}</h2>
            <form method="POST" action="eindex">
                <input type="hidden" name="action" value="login"/>
                <table>
                    <tr>
                        <td><label class="formElement" for="username">User Name:</label></td>
                        <td><input class="formElement" type="text" name="username" required/><br/></td>
                    </tr>
                    <tr>
                        <td><label class="formElement" for="password">Password:</label></td>
                        <td><input class="formElement" type="password" name="password" required/><br/><br/></td>
                    </tr>
                    <tr>
                        <td><input class="formElement" type="submit" value="Login"/></td>
                    </tr>
                </table>
            </form>
            <br/><br/>
            <a href="eindex?action=join">New User / Register</a>.
            <a href="eindex?action=timeline">Back to Home Page</a>.
        </div>
    </center>
</body>
</html>
