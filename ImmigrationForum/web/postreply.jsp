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
            <h2>${requestScope.username}</h2>
            <h3>Posted: ${requestScope.postdate}</h3>
            <h4>${requestScope.content}</h4>
            <h2 class="flash">${flash}</h2>
            <form method="POST" action="eindex?action=postreply">
                <textarea name="replycontent" rows="3" cols="80" placeholder="Say something" required></textarea>
                <input type="hidden" name="parentid" value="${requestScope.parentid}"/>
                <input type="hidden" name="action" value="postreply"/>
                <input type="submit" value="Reply it!"/>
            </form>
            <a class="nav" href="eindex?action=timeline">Back to Home</a>
            <br/>
        </div>
        <div id="ft">Immigration Forum  -  Reply Posts</div>
    </body>
</html>
