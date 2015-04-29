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


            <c:choose>
                <c:when test="${sessionScope.user.username != null}">
                    <a class="nav" href="action=post">Hey, ${sessionScope.user.username}! Post something!</a>
                    <a class="nav" href="wall">View my wall.</a>
                    <a class="nav" href="action=profile&username=${sessionScope.user.username}">View my profile</a>
                    <a class="nav" href="action=pedit">Update my profile</a>
                    <a class="nav" href="logout">Log out of Hubbub</a>
                </c:when>
                <c:otherwise>
                    <a href="eindex?action=join" class="button">Register</a>

                    <a href="eindex?action=login" class ="button1">Login</a>
                    
                    <a href="/ImmigrationForum/PostServlet" class ="button2">Posts</a><br/>
                    <a href="/ImmigrationForum/UserServlet" class ="button2">Users</a>
                </c:otherwise>
            </c:choose>
        </div>
        <nav id="primary_nav_wrap">
            <ul>
                <li class="current-menu-item"><a href="#">Home</a></li>
                <li><a href="#">Wiki</a>
                    <ul>
                        <li><a href="#">Visa Types</a></li>
                        <li><a href="#">Mostly Discussed</a></li>
                    </ul>
                </li>
                <li><a href="#">Forum</a>
                    <ul>
                        <li><a href="#">Today's Top Posts</a></li>
                        <li><a href="#">Interesting Topics</a></li>
                        <li><a href="#">How to Use Forum</a></li>
                    </ul>
                </li>
                <li><a href="#">My Account</a>
                    <ul>
                        <li class="dir"><a href="#">My Profile</a></li>
                        <li class="dir"><a href="#">Edit Profile</a></li>
                    </ul>
                </li>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </nav>
    </body>
</html>