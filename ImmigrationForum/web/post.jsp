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
            <a href="eindex?action=timeline.jsp"><img src="images/immigrationLogo.jpg" alt="logo"/></a>
        </div>
        <div id="bd">
            <h1>Hi  ${sessionScope.user.username}!</h1>
            <h2 class="flash">${flash}</h2>
            <form method="POST" action="eindex">
                <textarea name="content" rows="3" cols="80" placeholder="Say something" required></textarea>
                <input type="hidden" name="action" value="post"/>
                <input type="submit" value="Post it!"/>
            </form>
            <a class="nav" href="eindex?action=timeline">Back to Home</a>
        </div><br/>
        
        <div id="ft">
        Immigration Forum - New Post.
    </div>
    </body>
</html>
