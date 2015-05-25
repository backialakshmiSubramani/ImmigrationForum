<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Immigration Forum &raquo; Post</title>
        <link rel="stylesheet" type="text/css" href="style/main.css"/>
    </head>
    <body>
        <div id="hd">
            <a href="eindex?action=timeline"><img class="logo" src="images/immigrationLogo.jpg" alt="logo"/></a>
            <h1 class="center">Immigration Forum</h1>

            <%@include file="header.jspf" %>
            <br/><br/>
            <c:choose>
                <c:when test="${sessionScope.user.username != null}">                   
                    <a class="button" href="eindex?action=logout">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="eindex?action=join" class="button">Register</a>

                    <a href="eindex?action=login" class ="button1">Login</a>
                </c:otherwise>
            </c:choose>
        </div>





        <div class="post">
            <h3>${requestScope.username}</h3>
            <h4>Posted: ${requestScope.postdate}
                <div class="biography">${requestScope.content}</h4>
            <h3><a class="nav" href="eindex?action=postreply&parentid=${requestScope.id}&postdate=${requestScope.postdate}">Reply</a></h3>
        </div>

        <div class="replydisplay">
            <c:forEach var="posts" items="${posts}">

                <div class="post">  
                    <h3>${posts.authorid.username}</h3>
                    <h4>Posted: ${posts.postdate}
                        <div class="biography"> ${posts.content}</h4>
                    <h3><a class="nav" href="eindex?action=postreply&parentid=${requestScope.id}&postdate=${requestScope.postdate}">Reply</a></h3>
                </div>
            </c:forEach>
        </div>



        <div id="ft">
            Immigration Forum - Post Content & Replies.
        </div>
    </body>
</html>
