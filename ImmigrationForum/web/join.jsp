<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Immigration Forum &raquo; Join</title>
        <link rel="stylesheet" type="text/css" href="styles/main.css"/>
    </head>
    <body>
    <center>
        <div id="hd">
            <img class="logo" src="images/immigrationLogo.jpg" alt="logo"/>
        </div>
        <div id="bd">
            <h1>Sign Up!</h1>
            <h2 class="flash">${flash}</h2>
            <form method="POST" action="eindex">
                <table>
                    <tr>
                        <td><label>User Name:</label></td>
                        <td><input type="text" name="username" required/></td>
                    <tr>
                        <td><label>Password:</label></td>
                        <td><input type="password" name="password" required/></td>
                    </tr>
                    <tr>
                        <td><label>Password Again:</label></td>
                        <td><input type="password" name="password2" required/></br></br></td>
                    </tr>
                    
                    <tr>
                       <td><input type="submit" value="SignUp" /></td>
                </tr>
                </table>
            </form>
            <br/><br/><br/>
            <a class="nav" href="eindex?action=timeline">Back to Home Page.</a>.
            <a class="nav" href="eindex?action=login">I already have an account, Log in</a>.
        </div>

    </center>
    </body>
</html>
