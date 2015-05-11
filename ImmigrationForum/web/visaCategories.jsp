<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/main1.css"/>
        <title>Immigration Forum &raquo; Visa Categories</title>
    </head>
    <body>

       <a href="eindex?action=timeline.jsp"><img class="logo" src="images/immigrationLogo.jpg" alt="logo"/></a>
        <div id="header">
            <h1>Directory of Visa Categories</h1>
        </div>

        <div id="nav">
            <a href="niList.jsp" target="iframe_a">Non-Immigration Visa Categories</a><br>
            <a href="iList.jsp" target="iframe_a">Immigration Visa Categories</a><br>
            <a class="nav" href="eindex?action=timeline">Back to Home</a><br>
        </div>

        <div id="section">
            
                <%@include file="wiki/wikiHeader.jspf" %>
            <iframe width="100%" height="900px" name="iframe_a"></iframe>
        

    </div>

    <div id="footer">
        Immigration Forum - Directory of Visa Categories...
    </div>

</body>

</html>
