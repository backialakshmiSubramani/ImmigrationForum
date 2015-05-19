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
                    <a class="nav" href="eindex?action=post">Hi, ${sessionScope.user.username}! Post something!</a>

                    <a class="nav" href="eindex?action=profile&username=${sessionScope.user.username}">View my profile</a>
                    <a class="nav" href="eindex?action=logout">Logout</a>

                </c:when>
                <c:otherwise>
                    <a href="eindex?action=join" class="button">Register</a>

                    <a href="eindex?action=login" class ="button1">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
            <div>

            <h1>Posts</h1>
            <table class="imagetable" CELLPADDING=1 CELLSPACING=1 WIDTH=90%>
                <thead>
                    <tr>
                        <th>Username                  </th>
                        <th>content       </th>
                        <th>date          </th>
                    </tr>
                </thead>
                <c:forEach var="posts" items="${posts}">
                    <tbody>
                        <tr>

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
                            <td>${posts.content}</td>
                            <td>${posts.postdate}</td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
</div>

            <h2>Posts</h2>
        <c:forEach var="posts" items="${posts}">
            <div class="post">
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
    <div id="ft">
        Immigration Forum - Frequently Asked questions...
    </div>
</body>
</html>