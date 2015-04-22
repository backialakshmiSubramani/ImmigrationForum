<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hubbub &raquo; Join</title>
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
            <form method="POST" action="index.jsp">
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
                        <td><input type="hidden" name="action" value="signup"/></td>
                        <td><input type="submit" value="Sign Up"/></td>
                </tr>
                </table>
            </form>
            <br/><br/><br/>
            <a class="nav" href="index.jsp">Back to Home Page.</a>.
            <a class="nav" href="login.jsp">I already have an account, Log in</a>.
        </div>

    </center>
    </body>
</html>

