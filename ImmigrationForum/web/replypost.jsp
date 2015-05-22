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
            <a href="eindex?action=timeline.jsp"><img class="logo" src="images/immigrationLogo.jpg" alt="logo"/></a>
            <h1 class="center">Immigration Forum</h1>

            <%@include file="header.jspf" %>
            <br/><br/>
        </div>
        <div class="post">
            <h2>${requestScope.username}</h2>
            <h3>Posted: ${requestScope.postdate}</h3>
            <h4>${requestScope.content}</h4>
            
        </div> 
            <h2 class="flash">${flash}</h2>
            <form method="POST" action="eindex">
                
                <input align="right" type="submit" value="Reply"/>
            </form>
            <a class="nav" href="eindex?action=timeline">Back to Home</a>
        </div><br/>
        
        <div id="ft">
        Immigration Forum - Post Content.
    </div>
    </body>
</html>
