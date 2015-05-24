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
            <a class="button2" href="eindex?action=gridView">Grid View </a>
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
                            <td><a class="nav" href="eindex?action=replypost&content=${posts.content}&parentid=${posts.id}">
                                    <span class="postAuthor">${posts.content}</span>
                                </a></td>
                            <td>${posts.postdate}</td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>

        
    <div id="ft">
        Immigration Forum - Frequently Asked questions...
    </div>
</body>
</html>