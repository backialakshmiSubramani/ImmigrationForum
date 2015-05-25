<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="style/main.css"/>
    </head>
    <body>
        <div id="hd">
            <a href="eindex?action=timeline.jsp"><img class="logo" src="images/immigrationLogo.jpg" alt="logo"/></a>
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
        <div>
            <h2>Your Activity</h2>
            <c:forEach var="post" items="${posts}">
                <div class="post">
                    <c:choose>
                        <c:when test="${user.username != null}">
                            <a href="eindex?action=profile&username=${post.authorid.username}">
                                <span class="postAuthor">${post.authorid.username}</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="postAuthor">${post.authorid.username}</span>
                        </c:otherwise>
                    </c:choose>
                    <span class="postDate">(user since ${post.authorid.joindate})</span>
                    <div id="postContent">
                        ${post.content}
                    </div>
                    <span class="postDate">Posted : ${post.postdate}</span>
                </div>   
            </c:forEach>    
        </div>
            <div id="ft">
        Immigration Forum - View my Wall(Posts)...
    </div>
    </body>
</html>
