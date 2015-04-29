<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="hd">
            <img class="logo" src="images/immigrationLogo.jpg" alt="logo"/>
            <h1 class="center">Immigration Forum</h1>
        </div>

        <h3>${flash}</h3>
        <h1>Users</h1>
        <c:forEach var="users" items="${AllUsers}">
            
                <table border="1">
                    <tbody>
                        <tr>
                            <td>User Name:</td>
                            <td>${users.username}</td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>${users.password}</td>
                        </tr>
                        <tr>
                            <td>Join Date:</td>
                            <td>${users.joindate}</td>
                        </tr>
                        
                    </tbody>
                </table>
           
        </c:forEach>
    </body>
</html>
