<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Immigration Forum &raquo; Login</title>
        <link rel="stylesheet" type="text/css" href="styles/main.css"/>
    </head>
    <body><center>
        <div id="hd">
            <img class="logo" src="images/immigrationLogo.jpg" alt="logo"/>
        </div>
        <div id="bd">
            <h1>Log In to Your Account</h1>
            <h2 class="flash">${flash}</h2>
            <form method="POST" action="list.jsp" id="login">
                <input type="hidden" name="action" value="login"/>
                <table>
                    <tr>
                        <td><label class="formElement" for="username">User Name:</label></td>
                        <td><input class="formElement" type="text" name="username"/></td>
                    </tr>
                    <tr>
                        <td><label class="formElement" for="password">Password:</label></td>
                        <td><input class="formElement" type="password" name="password"/></td>
                    </tr>
                    <p class="remember_me">
                        <label>
                            <label>
                                <input type="checkbox" name="remember_me" id="remember_me">
                                Remember me on this computer
                            </label>
                        </label>
                    </p>
                    <tr>
                        <td colspan="2"><input class="formElement" type="submit" value="Log me in"/></td>
                    </tr>
                </table>
                
                </form>
            <a href="signup.jsp">I need to join.   </a>
            <a href="index.jsp">Goto Home page</a>
        </div>
        <div class="login-help">
                <p>Forgot your password? <a href="#">Click here to reset it</a>.</p>
        </div></center>
    </body>
</html>