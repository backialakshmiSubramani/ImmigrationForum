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
                        <a href="/eindex?action=signup" class="button">Sign up </a>
                     
                    <a href="login.jsp" class ="button1">Log in </a>
                </c:otherwise>
            </c:choose>
        </div>
        <nav id="primary_nav_wrap">
            <ul>
                <li class="current-menu-item"><a href="#">Home</a></li>
                <li><a href="#">Wiki</a>
                    <ul>
                        <li><a href="#">Visa Types</a></li>
                        <li><a href="#">Mostly Discussed</a>
                            <ul>
                                <li><a href="#">Deep Menu 1</a>
                                    <ul>
                                        <li><a href="#">Sub Deep 1</a></li>
                                        <li><a href="#">Sub Deep 2</a></li>
                                        <li><a href="#">Sub Deep 3</a></li>
                                        <li><a href="#">Sub Deep 4</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Deep Menu 2</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Sub Menu 5</a></li>
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
                        <li class="dir"><a href="#">Edit Profile</a>
                            <ul>
                                <li><a href="#">Category 1</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </nav>



    </body>
</html>

