<%-- 
    Document   : post
    Created on : Apr 27, 2015, 11:05:54 AM
    Author     : bhagya
--%>

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
        <h1>Posts</h1>
        <c:forEach var="posts" items="${AllPosts}">
            
                <table border="1">
                    <tbody>
                        <tr>
                            <td>Post Content:</td>
                            <td>${posts.content}</td>
                        </tr>
                        <tr>
                            <td>Post Date:</td>
                            <td>${posts.postdate}</td>
                        </tr>
                        <tr>
                            <td>Post Id:</td>
                            <td>${posts.id}</td>
                        </tr>
                        <c:forEach var="users" items="${AllUsers}">
                        <tr>
                            <td>Post Author:</td>
                            <td>${users.username}</td>
                        </tr>
                         </c:forEach>
                    </tbody>
                </table>
           
        </c:forEach>
    </body>
</html>
