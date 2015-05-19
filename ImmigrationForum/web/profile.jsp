<%@page contentType="text/html" pageEncoding="ISO-8859-1" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Immigration Forum &raquo; Profile</title>
        <link rel="stylesheet" type="text/css" href="style/main.css"/>
    </head>
    <body>
        <div id="hd">
            <a href="eindex?action=timeline.jsp"><img class="logo" src="images/immigrationLogo.jpg" alt="logo"/></a>
        </div>
        <div class="post">
            <c:choose>
                <c:when test="${profileuser.profile.picture != null}">
                    <img src="eindex?action=image&for=${profileuser.username}"/>
                </c:when>
                <c:otherwise>
                    <img src="images/default.jpg"/>
                </c:otherwise>
            </c:choose>
            <h1>Profile for
                <c:choose>
                    <c:when test="${not empty profileuser.profile.email}">
                        <a href="mailto:${profileuser.profile.email}">${profileuser.username}</a>
                    </c:when>
                    <c:otherwise>
                        ${profileuser.username}
                    </c:otherwise>
                </c:choose>

            </h1>
            <h2 class="flash">${flash}</h2>
            <div class="biography"> ${profileuser.profile.biography}</div>
            <p>Joined on ${profileuser.joindate}.</p><br/>
            <c:if test="${sessionScope.user.id == profileuser.id}">
                <a class="nav" href="eindex?action=pedit">Edit my profile</a>
                <a class="nav" href="eindex?action=post">Post something</a>
            </c:if>
            <a class="nav" href="eindex">Back to Home.</a>
    </div><br/>
    
        <div id="ft">
            Immigration Forum - Profile...
        </div>
    </body>
</html>
