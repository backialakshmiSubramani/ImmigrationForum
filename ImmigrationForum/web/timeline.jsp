<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Immigration Forum &raquo; Posts</title>
        <link rel="stylesheet" type="text/css" href="style/main.css"/>
    </head>
    <body>


        <div id="hd">
            <img class="logo" src="images/immigrationLogo.jpg" alt="logo"/>
            <h1 class="center">Immigration Forum</h1>

            <%@include file="header.jspf" %>
            <br/><br/>
            <c:choose>
                <c:when test="${sessionScope.user.username != null}">
                    <a class="nav" href="eindex?action=post">Hey, ${sessionScope.user.username}! Post something!</a>

                    <a class="nav" href="eindex?action=profile&username=${sessionScope.user.username}">View my profile</a>
                    <a class="nav" href="eindex?action=logout">Logout</a>
                    <a href="/ImmigrationForum/PostServlet" class ="button2">Posts</a><br/>
                </c:when>
                <c:otherwise>
                    <a href="eindex?action=join" class="button">Register</a>

                    <a href="eindex?action=login" class ="button1">Login</a>


                    <a href="/ImmigrationForum/UserServlet" class ="button2">Users</a>
                </c:otherwise>
            </c:choose>

            <h1>Posts</h1>
            <c:forEach var="posts" items="${AllPosts}">

                <table border="1">
                    <tbody>
                        <tr>
                            <td>User Name :</td>
                            <td><c:choose>
                                    <c:when test="${user.username != null}">
                                        <a href="eindex?action=profile&username=${posts.authorid.username}">
                                            <span class="postAuthor">${posts.authorid.username}</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="postAuthor">${posts.authorid.username}</span>
                                    </c:otherwise>
                                </c:choose></td>
                        </tr>
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
                    </tbody>
                </table>  </c:forEach>



                <h2>Time Line</h2>
            <c:forEach var="posts" items="${AllPosts}">

                <c:choose>
                    <c:when test="${user.username != null}">
                        <a href="eindex?action=profile&username=${posts.authorid.username}">
                            <span class="postAuthor">${posts.authorid.username}</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <span class="postAuthor">${posts.authorid.username}</span>
                    </c:otherwise>
                </c:choose>
                <span class="postDate">(user since ${posts.authorid.joindate})</span>
                <div id="postContent">
                    ${posts.content}
                </div>
                <span class="postDate">Posted ${posts.postdate}</span>
            </div>   
        </c:forEach>    
    </div>
</body>
</html>